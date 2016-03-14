<?php
/*<modx-api>*/
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: SetEnv MODX_BASE_PATH not found in .htaccess file.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/

$PID = 253; // Папка списка
$tplID = 9; // ID шаблона
$sc = $modx->getFullTableName("site_content");
$tv = $modx->getFullTableName("site_tmplvar_contentvalues");
$iml_lists = $modx->getFullTableName("manager_iml_lists");

if(!function_exists('mb_ucfirst')){function mb_ucfirst($s,$e='utf-8'){ return mb_strtoupper(mb_substr($s,0,1,$e),$e) . mb_strtolower(mb_substr($s,1,mb_strlen($s,$e),$e),$e);}}
if (!function_exists('mb_ucwords')){function mb_ucwords($s){return mb_convert_case($s, MB_CASE_TITLE, "UTF-8");}}
$citiespList = json_decode($modx->db->getValue($modx->db->select("json", $iml_lists, "name='zone'")));

$citiespList = array_filter($citiespList, function($arr){ return $arr->FromRegion == "МОСКВА" && $arr->ToRegion!='ПОЧТА'; }); 

foreach($citiespList as $city){
  $id = $modx->db->getValue($modx->db->query("SELECT `sc`.`id` FROM ".$sc." `sc` WHERE `template` = " . $tplID . " AND `sc`.`longtitle` = '" . $city->ToRegion . "'"));
  $modx->addResourse(array(
      "id"          => $id,
      "parent"      => $PID,
      "pagetitle"   => mb_ucwords($city->ToRegion),
      "longtitle"   => $city->ToRegion,
      "description" => $city->ZoneCode,
      "template"    => $tplID
  ));
}

?>