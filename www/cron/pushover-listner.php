<?php
/*<modx-api>*/
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: SetEnv MODX_BASE_PATH not found in .htaccess file.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/

$pushover_table = $modx->getFullTableName("pushover_messages");
$query = $modx->db->select("*", $pushover_table);

$ch = curl_init();
while($row = $modx->db->getRow($query)){
  curl_setopt_array($ch, array(
    CURLOPT_URL => "https://api.pushover.net/1/messages.json",
    CURLOPT_POSTFIELDS => unserialize(trim($row['fields']))
  ));
  curl_exec($ch);
}
curl_close($ch);
$modx->db->query("TRUNCATE TABLE ".$pushover_table);
?>