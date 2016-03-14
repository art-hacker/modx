<?php
/*<modx-api>*/
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: SetEnv MODX_BASE_PATH not found in .htaccess file.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/

$shk_table = $modx->getFullTableName("manager_shopkeeper");
$iml_table = $modx->getFullTableName("iml_requests");
if($modx->db->getValue($modx->db->select("COUNT(`reference`)", $iml_table, "UNIX_TIMESTAMP() - `issue` < 3600"))==0) return;
require_once(MODX_BASE_PATH . "assets/modules/orders/classes/iml.class.php");
$iml = new IMLogistics("04234", "08cOgG4A", "3282" , $modx);

//set_time_limit(0); $responses=false; while($responses==false){
$responses = $iml->listen();
//if($responses!==false) usleep(60);}

foreach($responses as $fileName){
    $response = $iml->read($fileName,0);
    $action = $modx->db->getValue($modx->db->select("action", $iml_table, "`reference`='".($response->Message->reference)."'"));
    $iml->delete($fileName, $response->Message->reference);
    foreach($response->Order as $order){
        switch($action){
            case "STATUS":
                list($status,$short_txt) = $modx->db->getRow($modx->db->select("status,short_txt", $shk_table, "`id`='".$order->number."'"),'num');
                $short_txt = unserialize($short_txt);
                if($short_txt['deliveryStatus']!=$order->deliveryStatus || $short_txt['orderStatus']!=$order->orderStatus){
                    $short_txt['orderStatus'] = (string)$order->orderStatus;
                    $short_txt['deliveryStatus'] = (string)$order->deliveryStatus;
                    $modx->db->update("`short_txt` = '".mysql_real_escape_string(serialize($short_txt))."'", $shk_table, "`id`='".$order->number."'") or die(mysql_error());
                    $modx->invokeEvent('OnSHKChangeStatus',array(
                        'order_id'  => $order->number,
                        'substatus' => array($order->orderStatus, $order->deliveryStatus),
                        'from' => 'IM Logistics'
                    ));
                }
            break;
            case "CREATE":
                if($order->status=='OK'){
                    $modx->db->update("`status` = 7", $shk_table, "`id`='" . $order->number . "'");
                    $modx->invokeEvent('OnSHKChangeStatus', array('order_id' => $order->number, 'status' => 7, 'from' => 'IM Logistics'));
                }else{
                    $out .= "#" . $order->number . ". Статус заявки: " . ($order->status);
                    if(isset($order->description)) $out .= " (".$order->description.")";
                    $out .= ".\r\n";
                }
            break;
        }
    }
    
    if(!empty($out)){
        $modx->db->insert(array('fields'=> serialize(array(
                "token"     => "akxD2dWcNwxVeendWKmvewhNS6j8iz",
                "user"      => "1R4OePklqXtJrbxtmRsdQI3ZZQuKnX",
                'title'     => 'Заявка обработана.',
                'timestamp' => date("U"),
                'message'   => $out,
                'sound'     => 'bike',
        ))),$modx->getFullTableName("pushover_messages"));
    }
    unset($out);
}
?>
