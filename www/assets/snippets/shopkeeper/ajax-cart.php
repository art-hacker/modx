<?php
/* MODX API */
if(!defined("MODX_MANAGER_PATH")) define('MODX_MANAGER_PATH', "../../../manager/");
require_once (MODX_MANAGER_PATH . 'includes/protect.inc.php');
require_once(MODX_MANAGER_PATH . 'includes/config.inc.php');
define('MODX_API_MODE', true);
include_once (MODX_MANAGER_PATH . 'includes/document.parser.class.inc.php');
$modx = new DocumentParser;
$modx->db->connect();
$modx->getSettings();
startCMSSession();
require_once "classes/class.shopkeeper.php";

$shopCart = new Shopkeeper($modx, array(
  "cartTpl"=> (isset($_REQUEST['cartTpl']) && $_REQUEST['cartTpl'])? $_REQUEST['cartTpl'] : "@FILE:chunk_shopCart.tpl",
  "cartType"=> (isset($_REQUEST['cartType']) && $_REQUEST['cartType'])? $_REQUEST['cartType'] : 'full',
  "cartRowTpl"=> (isset($_REQUEST['cartRowTpl']) && $_REQUEST['cartRowTpl'])? $_REQUEST['cartRowTpl'] : "@FILE:chunk_shopCartRow.tpl",
  "excepDigitGroup" => 0,
  'currency'=>'руб.'
));

if(isset($_REQUEST['action'])){
  switch($_REQUEST['action']){
    case 'add':
      $shopCart ->savePurchaseData(array(
        'shk-id'=>(int)$_REQUEST['shk-id'],
        'shk-name'=>$_REQUEST['shk-name'],
        'count'=> (isset($_REQUEST['count']) && $_REQUEST['count'])? $_REQUEST['count'] : '1'
      ));
      /*mysql_query("
        UPDATE ".$modx->getFullTableName('site_tmplvar_contentvalues')."
        SET `value`=`value`+1 
        WHERE `tmplvarid` = '" .$modx->getConfig('tvOrderedId'). "' 
        AND `contentid` = ".(int)$_REQUEST['shk-id']
      );*/
    break;
    case 'del':
      if(isset($_REQUEST['index'])) $shopCart->delArrayItem($_REQUEST['index']);
    break;
    case 'upd':
      if(isset($_REQUEST['index']) && isset($_REQUEST['count'])) $shopCart->recountDataArray((int)$_REQUEST['index'],(int)$_REQUEST['count'],false);
    break;
    case 'empty':
        $shopCart->emptySavedData();
    break;
  }
}
$modx->documentContent = $shopCart->getCartContent("", $_SERVER['HTTP_REFERER']);
$modx->documentContent = str_replace(array("[[","]]"), array("[!","!]"), $modx->documentContent);
$modx->outputContent();

?>