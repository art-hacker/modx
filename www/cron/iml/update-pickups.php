<?php
/*<modx-api>*/
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: SetEnv MODX_BASE_PATH not found in .htaccess file.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/

$PID = 197; // Папка списка ПВЗ
$tplID = 8; // ID шаблона ПВЗ

$sc = $modx->getFullTableName("site_content");
$tv = $modx->getFullTableName("site_tmplvar_contentvalues");
$iml_lists = $modx->getFullTableName("manager_iml_lists");

$pickupList = json_decode($modx->db->getValue($modx->db->select("json", $iml_lists, "name='sd'")));

$pickupList = array_filter($pickupList, function($arr){ 
  //return isset($arr->Name) && !empty($arr->Name);
  return in_array($arr->RegionCode,array("МОСКВА"));
}); 

foreach($pickupList as $pickup){
  $id = $modx->db->getValue($modx->db->query("
          SELECT `sc`.`id`
          FROM ".$sc." `sc` 
          JOIN ".$tv." `tv` 
            ON `sc`.`id` = `tv`.`contentid` AND `tv`.`tmplvarid` = 14 
          WHERE `template` = " . $tplID . " 
            AND `sc`.`menuindex` = '" . $pickup->RequestCode . "' 
            AND `tv`.`value` = '" . $pickup->RegionCode . "'
        "));
  $modx->addResourse(array(
      "id"          => $id,
      "parent"      => $PID,
      "pagetitle"   => $pickup->Name,
      "longtitle"   => $pickup->Address,
      "description" => $pickup->WorkMode,
      "menutitle"   => $pickup->Latitude . ", " . $pickup->Longitude,
      "menuindex"   => $pickup->RequestCode,
      "template"    => $tplID,
      'tv' => array(
          array('tmplvarid' => '11', 'value' => preg_replace("~([0-9]{3})([0-9]{3})([0-9]{2})([0-9]{2})~", "+7 ($1) $2-$3-$4", preg_replace("~\+7|[^0-9]~", "", $pickup->Phone))),
          array('tmplvarid' => '12', 'value' => $pickup->EMail),
          array('tmplvarid' => '14', 'value' => $pickup->RegionCode)
      )
  ));
}

?>