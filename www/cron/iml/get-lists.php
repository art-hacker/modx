<?php
/*<modx-api>*/
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: SetEnv MODX_BASE_PATH not found in .htaccess file.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/

$lists = array(
  'Location',           // Получить список складов
  'zone',               // Зоны доставки с указанием кол-ва дней
  'PostDeliveryLimit',  // Справочник почтовых ограничений
  'region',             // Список регионов IML
  'sd',                 // GET - Получить список пунктов самовывоза. POST - Получить список пунктов самовывоза для конкретного региона, отправив его методом POST в теле сообщения
  'status',             // Справочник статусов
  'PostRateZone',       // Справочник почтовых зон
  //'PostCode',           // Справочник почтовых индексов ПИЗДЕЦ какой большой, так что лучше не грузить.
  'calendar',           // Календарь работы IML
  'service',            // Список услуг
  'all'                 // Все справочники одним запросом
);
if(isset($_REQUEST['list'])){
  in_array($_REQUEST['list'],$lists) ? getList($_REQUEST['list'],$modx) : exit('Список не найден.');
}else{
    foreach($lists as $list) getList($list,$modx);
}

function getList($list,$modx){
  $table = $modx->getFullTableName("manager_iml_lists");
  $json_list = file_get_contents('http://list.iml.ru/' . $list . '?type=json');
  $xml_list = file_get_contents('http://list.iml.ru/' . $list . '?type=xml');
  $db_list = $modx->db->select("*", $table, "`name` = '".$list."'");
  if($modx->db->getRecordCount($db_list)){
    $db_list = $modx->db->getRow($db_list);
    if($db_list['json'] != $json_list || $db_list['xml'] != $xml_list){
      $modx->db->update(array('json' => $json_list, 'xml' => $xml_list), $table, "`name` = '".$list."'");
    }
  }else{
      $modx->db->insert(array('json' => $json_list, 'xml' => $xml_list, 'name' => $list), $table);
  }
}
//echo memory_get_peak_usage(true)/1024/1024;
?>