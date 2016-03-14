<?php
if(!isset($_SERVER['HTTP_X_REQUESTED_WITH'])||strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) != 'xmlhttprequest'){
  header('HTTP/1.1 403 Forbidden');
  die('HTTP/1.1 403 Forbidden');
}
/*<modx-api>*/
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: SetEnv MODX_BASE_PATH not found in .htaccess file.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/
startCmsSession();

if(!isset($_SESSION['mgrValidated']) || $_SESSION['mgrValidated']!=1){ header('Location:/manager/'); die;}

require_once('classes/funcs.inc.php');
require_once(MODX_MANAGER_PATH.'includes/log.class.inc.php');
$log = new logHandler();
function parseOrderData($order){
    global $modx;
    $order = array_merge(unserialize($order['short_txt']),$order,array(
      'content'   => unserialize($order['content']),
      'date_diff' => datediff(strtotime($order['date'])),
      'date'      => rdate("d M",strtotime($order['date'])),
      'time'      => date("H:i", $order['date'])
    ));

    if(isset($order['sentdate'])) $order['sentdate'] = rdate("d M",strtotime($order['sentdate']));
    elseif(!empty($order['expectdate'])) $order['sentdate'] = rdate("d M",strtotime($order['expectdate']));

    
    if(stristr($_SERVER['HTTP_USER_AGENT'],"android")) $order['ymap'] = "intent://maps.yandex.ru/?text=" . ($order['address']) . "&z=12#Intent;scheme=http;package=ru.yandex.yandexmaps;end";
    elseif(stristr($_SERVER['HTTP_USER_AGENT'],"ipad")) $order['ymap'] = "yandexmaps://maps.yandex.ru/?text=" . urlencode($order['address']) . "&z=12";
    else $order['ymap'] = 'http://maps.yandex.ru/?text=' . urlencode($order['address']);
    
    foreach(array("company","status","payment","delivery","city") as $k){
        if(isset($order[$k])) $order+=array($k."_".$order[$k]."_selected"=>'selected=""',$k."_".$order[$k]."_checked"=>'checked=""');
    }
    foreach($order['content'] as $n => &$item){
        $item = array(
            'n'         => $n,
            'id'        => $item[0],
            'amount'    => $item[1],
            'unit_price'=> $item[2],
            'price'     => $item[2] * $item[1],
            'pagetitle' => $item[3],
            'url'       => $modx->makeUrl($item[0]),
            'allowed'   => in_array($n, allowedArray($order['allowed'],$order['content']))
        );
        $doc = $modx->getDocument($item['id']);
        $item += $modx->getTemplateVarOutput(array('count','purchase','instore'), $item['id'], !!$doc);
        $item += $doc ? $doc : $modx->getDocument($item['id'], "*", !!$doc);
        if($item['allowed']) $item['allowed_checked'] = 'checked=""';;
    }
    $order['costs']=round(array_sum(array_map(function($item){return $item['allowed'] ? $item['purchase']*$item['amount']:0;}, $order['content'])) * (1-$modx->getConfig('bezantDiscount')));
    $order['profit'] = $order['price'] - $order['costs'];
    $order['status_history'] = $modx->db->getHTMLGrid($modx->db->query("SELECT `s`.`name` `status`, (SELECT IFNULL(`u`.`fullname`, 'System')) `fullname`, FROM_UNIXTIME(`h`.`timestamp`, '%d %M') AS `date`, FROM_UNIXTIME(`h`.`timestamp`, '%H:%i') AS `time` FROM `shop_manager_shopkeeper_status_history` `h` LEFT JOIN `shop_manager_shopkeeper_status` `s` ON `s`.`id` = `h`.`status_id` LEFT JOIN `shop_user_attributes` AS `u` ON `u`.`internalKey` = `h`.`mgr_id` WHERE `h`.`order_id` = " . (int)$order['id'] . " ORDER BY `timestamp` ASC"),
        array(
            'fields'            => 'status,fullname,date,time',
            'columns'           => 'Статус,Менеджер,Дата,Время',
            'cssClass'          => 'history list',
            'columnHeaderStyle' => 'color:#777; background:#E5E5E5',
            'altItemStyle'      => 'background:auto'
        )
    );
    return $order;
}

/* 
 * Vars *
 */
$shk_t = $modx->getFullTableName('manager_shopkeeper');
$shk_status_t = $modx->getFullTableName('manager_shopkeeper_status');
$json=$_where=array();

/* 
 * Actions
 */
switch(!empty($_REQUEST['action'])?$_REQUEST['action']:''){
  case 'getTpl':
      if($_SESSION['mgrRole']<3){
        $json['order'] = file_get_contents('templates/list_order.tpl');
        $json['orderItem'] = file_get_contents('templates/list_order_item.tpl');
        $json['viewOrder'] = file_get_contents('templates/view_order.tpl');
        $json['viewOrderItem'] = file_get_contents('templates/view_order_item.tpl');
      }elseif($_SESSION['mgrRole']==3){
        $json['order'] = file_get_contents('templates/listpad_order.tpl');
        $json['orderItem'] = file_get_contents('templates/listpad_order_item.tpl');
      }
  break;
  case 'viewOrderList':
  default:
      array_walk($_REQUEST,function(&$v) use ($modx){$v = $modx->db->escape($v);}); // sanitize request
      $_REQUEST['display'] = isset($_REQUEST['display'])? min((int)$_REQUEST['display'],1000) : 50;
      $_REQUEST['start'] = isset($_REQUEST['start'])? $_REQUEST['start'] : 0;
      if(isset($_REQUEST['status_id'])){
          if(!empty($_REQUEST['order_id'])) $_where[] = '(`shk`.`id` = ' . (int)$_REQUEST['order_id'] . ' OR `tracking_num` = ' . (int)$_REQUEST['order_id'] . ')';
          if(!empty($_REQUEST['status'])) $_where[] = '`status`.`id` = '. (int)$_REQUEST['status'];
          if(!empty($_REQUEST['payment'])) $_where[] = '`shk`.`payment` = "' . $_REQUEST['payment'] . '"';
          if(!empty($_REQUEST['info'])) $_where[] = "(REPLACE(REPLACE(REPLACE(REPLACE(`shk`.`phone`,' ',''),'-',''),')',''),'(','') LIKE '%" . $_REQUEST['info'] . "%' OR `shk`.`short_txt` LIKE '%" . $_REQUEST['info'] . "%')";

          if($_REQUEST['status_id']!='all')     $_where[] = '`status`.`id` = '. (int)$_REQUEST['status_id'];
          $_limit = 'LIMIT '.(int)$_REQUEST['start'].', ' . (int)$_REQUEST['display'];
      }else{
          $_where[] = '`status`.`hidden` = 0';
          $_limit = "";
      }
      $_where = count($_where)>0 ? "WHERE " . implode(" AND ", $_where) : "";
      $orders = $modx->db->makeArray($modx->db->query("SELECT `shk`.* FROM ".$shk_t." `shk` JOIN ".$shk_status_t." `status` ON `shk`.`status` = `status`.`id` ".$_where." ORDER BY `shk`.`id` DESC ".$_limit));
      foreach($orders as &$order) $order = parseOrderData($order);
      $json['orders'] = $orders;
  break;
  case 'saveOrder':
      if(isset($_REQUEST['item_id'])){
          require_once(MODX_BASE_PATH . "assets/snippets/shopkeeper/classes/class.shopkeeper.php");
          require_once(MODX_BASE_PATH . "assets/snippets/shopkeeper/classes/class.shk_manager.php");
          $shkm = new SHKmanager($modx);
          $shkm->mod_table = $shk_t;
          if(isset($_REQUEST['status_id'])){
              $modx->db->update(array('status'=>(int)$_REQUEST['status_id']), $shk_t, "`id` = ".(int)$_REQUEST['item_id']);
              if($modx->db->getAffectedRows()) $modx->invokeEvent('OnSHKChangeStatus',array('order_id'=>$_REQUEST['item_id'],'status'=>$_REQUEST['status_id']));
          }
          $_REQUEST['phone'] = preg_replace("~[78]*([0-9]{3})([0-9]{3})([0-9]{2})([0-9]{2})~", "+7 ($1) $2-$3-$4", preg_replace("~\D~","",$_REQUEST['phone']));
          if(empty($_REQUEST['shkct_city'])) $_REQUEST['shkct_city'] = "Москва";
          if(empty($_REQUEST['shkct_sourse'])) $_REQUEST['shkct_sourse'] = $modx->getConfig('site_name');
          if(!isset($_REQUEST['shkct_company'])) $_REQUEST['shkct_company'] = ''; // Если не установлен флажок "Компания" нужно всё равно передать параметр (пустой).
          if(!empty($_REQUEST['add_prod_alias'])){//Добавление товара в заказ
              $_REQUEST['add_prod_id'] = $modx->db->getValue($modx->db->select("id", $modx->getFullTableName('site_content'), "alias = '" . $_REQUEST['add_prod_alias'] . "'"));
              if($_REQUEST['add_prod_id']) $_REQUEST['add_prod_price'] = $modx->getTemplateVarOutput('price',$_REQUEST['add_prod_id'])['price'];
          }
          $log->initAndWriteLog("Сохранение заказа #" . $_REQUEST['item_id'], $_SESSION['mgrInternalKey'], $_SESSION['mgrShortname'], 5, 2, "Заказы");
          $shkm->saveOrderData($_REQUEST);
      }
  case 'viewOrder':
      $order = $modx->db->getRow($modx->db->select("*", $shk_t, "id = " . (int) $_REQUEST['item_id']));
      $json['order'] = parseOrderData($order);
      if(!empty($json['order']['pickup'])){
          $pickupInfo = $modx->db->getRow($modx->db->select("*",$modx->getFullTableName('site_content'), "parent = 197 AND menuindex = ".(int)$json['order']['pickup']));
          $json['order']['pickup_address'] = "<b>".$pickupInfo['pagetitle'] . "</b><br/>" . $pickupInfo['longtitle'] . ", " . $pickupInfo['description'];
      }
  break;
  case 'iml':
      if(!empty($_REQUEST['data']) && is_array($_REQUEST['data'])){
          require_once('classes/iml.class.php');
          $iml = new IMLogistics("04234", "08cOgG4A", "3282" , $modx);
          $iml->setLogPath(MODX_BASE_PATH . "assets/files/iml/" . date("Y/m"));
          foreach($_REQUEST['data'] as $order){
              extract($order);
              $json['response'] = $iml->sendOrder($id, $service, $expectdate, $senttimeFrom, $senttimeTo, $note, $address, $fullname, $phone, $pickup, $price, $barcode, $city, $volume);
              if($json['response'] !== 200) $json["error"][$id][] = $json['response'];
          }
          if(empty($json["error"])){
              $log->initAndWriteLog("Отправка заявок", $_SESSION['mgrInternalKey'], $_SESSION['mgrShortname'], 61,2, "Заявки");
              $json['response'] = $iml->send();
              if($json['response'] !== 200) $json["error"][][]=$json['response'];
          }
      }else $json["error"][][]='Нет данных';
  break;
}
$json['request'] = $_REQUEST;

echo json_encode($json, JSON_UNESCAPED_UNICODE);

?>