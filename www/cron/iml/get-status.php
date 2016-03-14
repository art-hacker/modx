<?php
/*<modx-api>*/
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: SetEnv MODX_BASE_PATH not found in .htaccess file.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/

require_once(MODX_BASE_PATH . "assets/modules/orders/classes/iml.class.php");
$iml = new IMLogistics("04234", "08cOgG4A", "3282" , $modx);
$orderIds = array_merge(
    $modx->db->getColumn('id', $modx->db->select("id", $modx->getFullTableName("manager_shopkeeper"), "`status` IN(4)", "`id` DESC", 100)),
    $modx->db->getColumn('id', $modx->db->select("id", $modx->getFullTableName("manager_shopkeeper"), "`status` IN(5)", "`id` DESC", 100)),
    //$modx->db->getColumn('id', $modx->db->select("id", $modx->getFullTableName("manager_shopkeeper"), "`status` IN(6)", "`id` DESC", 20)),
    $modx->db->getColumn('id', $modx->db->select("id", $modx->getFullTableName("manager_shopkeeper"), "`status` IN(7)", "`id` DESC"))
);
echo $iml->getStatus($orderIds);
?>