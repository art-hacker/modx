<?php
/*<modx-api>*/
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: SetEnv MODX_BASE_PATH not found in .htaccess file.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/

if(!defined("IN_MANAGER_MODE")){
    startCmsSession();
    if(!isset($_SESSION['mgrValidated']) || $_SESSION['mgrValidated']!=1){ header('Refresh: 0; URL=/manager/index.php'); die;}
    $_GET['id'] = 2;
}

global $action; $action = 7; // Костыль, что бы протокол системы управления не дублировался встроенным.
require_once(MODX_MANAGER_PATH.'includes/log.class.inc.php');
$log = new logHandler();

$shk_status_t = $modx->getFullTableName('manager_shopkeeper_status');
$shk_t = $modx->getFullTableName('manager_shopkeeper');
$sc_t = $modx->getFullTableName("site_content");
$a = isset($_REQUEST['action'])? $_REQUEST['action'] : null;

$placeholders = array(
    'moduleId'      => $_GET['id'],
    'module_path'   => 'assets/modules/orders',
    'action'        => $a,
    'now'           => date('d.m.Y'),
    'inner'      => '',
);

if($a){
    require_once('classes/funcs.inc.php');
    require_once("classes/ean13.class.php");
    if(empty($_REQUEST['orderId'])){
        $_REQUEST['orderId'] = array_map(function($arr){ return $arr['id'];},$modx->db->makeArray($modx->db->select("id", $shk_t, "`status` IN(1,2)")));
    }
    if(is_array($_REQUEST['orderId'])){
        $_REQUEST['orderId'] = implode(" ",$_REQUEST['orderId']);
        header("Location: " . $_SERVER['SCRIPT_NAME'] . "?" . http_build_query(array_intersect_key($_REQUEST,array_flip(array("action","orderId")))));
        exit;
    }
    
    $_REQUEST['orderId'] = explode(" ",$_REQUEST['orderId']);
    rsort($_REQUEST['orderId']);
    
    $validActions = array(
      'check'    => array('title' => 'Чеки'),
      'bill'     => array('title' => 'Счет на оплату'),
      'torg12'   => array('title' => 'Накладная', 'styles' => '@page {size: landscape}'),
      'barcode'  => array('title' => 'Штихкоды',  'styles' => '@page {size: landscape}'),
      'iml'      => array('title' => 'Заявки'),
      'act'      => array('title' => 'Акт приемки-передачи')
    );
    
    isset($validActions[$a]) && is_array($validActions[$a])? $placeholders+=$validActions[$a] : exit('Invalid request');

    $output = file_get_contents('templates/docs_wrap.tpl');

    if(file_exists($outputInner = 'templates/docs_' . $a . '_wrap.tpl')){
        $output = $modx->setPlaceholders(str_replace("[+inner+]","[+outputInner+]",$output), array("outputInner"=>file_get_contents($outputInner)));
    }
    $tpl_outer = file_get_contents('templates/docs_' . $a . '.tpl');
    $regex = "~\[\+tpl:(.+)=`(.+)`\+\]~sU";
    preg_match_all($regex, $tpl_outer, $matches);
    $tpl_outer = preg_replace($regex, "[+$1+]", $tpl_outer);
    foreach($matches[2] as $k=>$v){ $innerTpl[$matches[1][$k]] = $v; }
    if(isset($innerTpl) && is_array($innerTpl)) extract($innerTpl, EXTR_PREFIX_ALL, "tpl");

    foreach($_REQUEST['orderId'] as $id){
        list($id,$volume) = array_pad(preg_split("~\D+~",$id), 2, NULL);

        if($order = $modx->db->getRow($modx->db->select("`id`,`content`,`short_txt`,`note`, DATE_FORMAT(`date`,'%d.%m.%Y') `date`,`price`,`allowed`,`payment`,`phone`, `status`", $shk_t, "`id`='" . $id . "'"))){
            if($order['short_txt'] = unserialize($order['short_txt'])) $order+=$order['short_txt'];
            if($order['content'] = unserialize($order['content'])) $order['content'] = array_values(array_intersect_key($order['content'], array_flip(allowedArray($order['allowed'], $order['content']))));
            
            $order += array(
                'totalIndex'    => count($order['content']),
                'itemsAmmount'  => array_sum(array_map(function($item){return $item[1];},$order['content'])),
                'items'         => '',
            );
            if(!empty($order['expectdate'])) $order['expectdate'] = date("d.m.Y", strtotime($order['expectdate']));
            if($a=='check' && !$order['company']){
                switch($order['delivery']){
                    case 'pickup':
                        $order['delivery_doc'] = $modx->db->getRow($modx->db->select("*", $sc_t, "template = 8 AND `menuindex` = " . (int)$order['pickup']));
                    break;
                    case 'delivery': case 'delivery_region':
                        $order['delivery_doc'] = $modx->db->getRow($modx->db->select("*", $sc_t, "template = 9 AND `pagetitle` = '" . $modx->db->escape($order['city']) . "'"));
                    break;
                }
                if(!empty($order['delivery_doc'])){
                    $order['content'][] = array($order['delivery_doc']['id'], 1, $modx->getTemplateVarOutput('price',$order['delivery_doc']['id'])['price'], "", "tv"=>array("delivery"=>$order['delivery'],"deliveryName"=>$order['delivery_doc']['pagetitle']));
                }
            }
            $discount = $order['price'] - array_sum(array_map(function($item){return $item[2]*$item[1];},$order['content']));
            if($discount % $order['itemsAmmount']!=0){
                if($order['content'][0][1]>1){
                    $order['content'][0][1]--;
                    $dublicate = $order['content'][0];
                    $dublicate[1] = 1;
                    $dublicate[2] += $discount % $order['itemsAmmount'];
                    $order['content'][] = $dublicate;
                    $order['totalIndex']++;
                }else{
                    $order['content'][0][1]+= $discount % $order['itemsAmmount'];
                }
            }
            foreach($order['content'] as $n=>$item){
                $item[2]+=intval($discount/$order['itemsAmmount']);
                $item = array(  
                    "index"         => $n + 1,
                    "ammount"       => $item[1],
                    "price"         => $item[2],
                    "total"         => $item[2] * $item[1],
                    "pagetitle"     => $item[3],
                    "delivery"      => isset($item["tv"]["delivery"])? $item["tv"]["delivery"] : NULL,
                    "deliveryName"  => isset($item["tv"]["deliveryName"])? $item["tv"]["deliveryName"] : NULL,
                )+$modx->getDocument($item[0]);
                
                if(isset($tpl_items)) $order['items'] .= $modx->setPlaceholders($tpl_items, $item);
            }


            if($a=='iml'){
                $senttimeSplit = array_map(function($n){ return sprintf("%02d", $n);},preg_split("~\D+~",$order["senttime"])); //9:00 - 12:00 => Array([0]=>09, [1]=>00, [2]=>12, [3]=>00)
                $order = array_merge($order,array(
                    'service'       => ($order["delivery"]=="pickup" ? "С24" : "24") . ($order["payment"]=="cash"?"КО":""),
                    'senttimeFrom'  => $order["senttime"]?($senttimeSplit[0].":".$senttimeSplit[1]):'',
                    'senttimeTo'    => $order["senttime"]?($senttimeSplit[2].":".$senttimeSplit[3]):'',
                ));
            }

            if($a == 'barcode') $volume = empty($volume)? min($order['itemsAmmount'], 3) : $volume;
            else $volume = empty($volume)? 1 : $volume;

            for($volumeTotal=1; $volumeTotal<=$volume; $volumeTotal++){
                for($i=1; $i<=$volumeTotal; $i++){
                    $ean = new ean13("3282" . sprintf("%07d", $id) . $i);
                    $order = array_merge($order,array(
                        'barcode'       => $ean->codestring(),
                        'barcodeStr'    => $ean->barcode,
                        'volume'        => $i,
                        'volumeTotal'   => $volumeTotal,
                    ));
                    $placeholders['inner'] .= $modx->setPlaceholders($tpl_outer, $order);
                }
            }
            if($a == 'bill'){
                $filePath = "assets/files/". $a . "/" .date("Y") . "/" . $id . ".html";
                $placeholders+=array('filePath' => MODX_SITE_URL . "ttstore/" . $filePath);
                $fileData = $modx->setPlaceholders($output, array_merge($placeholders,array('styles'=>".print_max{visibility:visible!important} textarea{display:none}")));
                $fileData = $modx->setPlaceholders($fileData, $modx->config, "[()]");
                if(!is_dir(dirname(MODX_BASE_PATH . $filePath))) mkdir(dirname(MODX_BASE_PATH . $filePath),755,true);
                fwrite($fh = fopen(MODX_BASE_PATH . $filePath, "w+"), $fileData); fclose($fh);
            }
        }
    }
}
else{

    $placeholders['title'] = "Заказы";
    if($_SESSION['mgrRole']<3){
        $tplGroupName = 'list';
        // добавил индексы к shop_manager_shopkeeper id_status_price
        $statuses = $modx->db->makeArray($modx->db->query("SELECT status.*, SUM(`shk`.`price`) `totalPrice`, COUNT(`shk`.`id`) `count` FROM ".$shk_status_t." `status` JOIN " . $shk_t . " `shk` ON `shk`.`status` = `status`.`id` GROUP BY `shk`.`status`"));
        $statuses[] = array(
            'id'          => 'all',
            'name'        => 'Все',
            'description' => 'Все заказы в хронологическом порядке',
            'hidden'      => 1,
        );
    }elseif($_SESSION['mgrRole']==3){
        $tplGroupName = 'listpad';
        $statuses = $modx->db->makeArray($modx->db->select("*", $shk_status_t, "`id` IN(1,2,3)"));
    }

    $statusesTpl = file_get_contents(MODX_BASE_PATH . $placeholders['module_path'] . '/templates/' . $tplGroupName . '_statuses.tpl');
    foreach($statuses as $status){
        $placeholders['inner'] .= $modx->setPlaceholders($statusesTpl, $status);
    }

    $output = file_get_contents(MODX_BASE_PATH . $placeholders['module_path'] . '/templates/' . $tplGroupName . '_wrap.tpl');
}

$log->initAndWriteLog($a?"Создание документа" : "Просмотр заказов", $_SESSION['mgrInternalKey'], $_SESSION['mgrShortname'], $a?4:112, 2, $placeholders['title']);

$output = $modx->setPlaceholders($output, $placeholders);
$output = $modx->setPlaceholders($output, $modx->config, "[()]");
$output = preg_replace('~\[[\+\(](.*?)[\)\+]\]~', "", $output); // Удаляем неиспользуемые плейсхолдеры
echo $output;
?>