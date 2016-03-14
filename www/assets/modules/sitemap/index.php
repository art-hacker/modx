<?php
/*<modx-api>*/
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: SetEnv MODX_BASE_PATH not found in .htaccess file.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/

header("Content-Type: text/xml"); //header("Content-Type: text/plain");

set_time_limit(0);
$query = $modx->db->select('id, editedon', $modx->getFullTableName('site_content'), 'searchable = 1 AND published = 1 AND `parent`!=23', 'editedon DESC' /*,10*/);
while($row = $modx->db->getRow($query)){
  $urls[]  = '<url><loc>'.$modx->makeUrl($row['id'], '', '', 'full').'</loc><lastmod>'.date("Y-m-d\TH:i:sP", $row['editedon']).'</lastmod></url>';
}

echo '<?xml version="1.0" encoding="utf-8"?>
<urlset 
  xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" 
  xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
'.implode($urls).'
</urlset>';
?>