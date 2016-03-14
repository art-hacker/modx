<?php
/*
 * Authentication
 */
$user = 'robot';    $pass = '2f4GcS8>A~xti\7';
if(!isset($_SERVER['PHP_AUTH_USER'])){
  header('WWW-Authenticate: Basic realm="Enter password"');
  header('HTTP/1.0 401 Unauthorized');
  exit('Пожалуйста, авторизуйтесь.');
}elseif($user != $_SERVER['PHP_AUTH_USER'] || $pass != $_SERVER['PHP_AUTH_PW']){
  header('HTTP/1.0 403 Forbidden'); 
  exit('Доступ запрещён');
}

/*
 * Script settings
 */
set_time_limit(0);
header("Content-Type: text/xml");

/*<modx-api>*/
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: SetEnv MODX_BASE_PATH not found in .htaccess file.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/

function mb_ucfirst($str,$enc='utf-8'){return mb_strtoupper(mb_substr($str,0,1,$enc),$enc) . mb_strtolower(mb_substr($str,1,mb_strlen($str,$enc),$enc),$enc);}
function xmlentities($str){$str = str_replace(array('"','&nbsp;','&','<','>','\'',' ','™'), array('&quot;',' ', '&amp;','&gt;','&lt;','&apos;',' ',''), strip_tags($str)); return $str;}

$sc = $modx->getFullTableName('site_content');
$tv = $modx->getFullTableName('site_tmplvar_contentvalues');
$minprice = isset($_GET['minprice']) ? (int)$_GET['minprice'] : 0;

/*
 * Если дата генерации фида позже последних изменений на сайте, выводим его, не генерируя новый
 */
$lastmod = max($modx->db->getValue($modx->db->select('editedon', $sc, null, 'editedon DESC',1)), filectime(MODX_BASE_PATH . "assets/modules/counter/timestamp"));
$cachefile = MODX_BASE_PATH . "assets/cache/yml_" . $minprice . ".xml";
if(file_exists($cachefile) && filectime($cachefile)>$lastmod) die(file_get_contents($cachefile)); 

/*
 * <categories> - разделы каталога
 */ 
$query = $modx->db->select('id, parent, pagetitle', $sc, 'template IN(2,3,4) AND hidemenu=0', 'parent ASC');
while($row = $modx->db->getRow($query))
  $categories[] = '<category id="' . $row['id'] . '"' . ( $row['parent'] != 2 ? ' parentId="' . $row['parent'] . '"' : '' ) . '>' . $row['pagetitle'] . '</category>';


/*
 * <offers> - товарные предложения
 */ 
$query = "
    SELECT 
      `sc`.`id`,
      `sc`.`pagetitle`,
      `sc`.`content`,
      `sc`.`alias`,
      `sc`.`parent`,
      `image`.`value`,
      `price`.`value`,
      `count`.`value`,
      `brand`.`value`
    FROM " . $sc . " `sc`
    LEFT JOIN " . $tv . " `image` ON `image`.`contentid`=`sc`.`id` AND `image`.`tmplvarid` = '1'
    LEFT JOIN " . $tv . " `brand` ON `brand`.`contentid`=`sc`.`id` AND `brand`.`tmplvarid` = '10'
    JOIN " . $tv . "      `price` ON `price`.`contentid`=`sc`.`id` AND `price`.`tmplvarid` = '2'
    JOIN " . $tv . "      `count` ON `count`.`contentid`=`sc`.`id` AND `count`.`tmplvarid` = '9'
    WHERE `sc`.`template` = 5 
      AND `sc`.`hidemenu` = 0 
      AND `sc`.`published` = 1 
      AND `sc`.`parent` != 10839
      AND `price`.`value` > " . $minprice . "
";
$query = $modx->db->query($query);


while($row = $modx->db->getRow($query, 'num')){
  list($id, $pagetitle, $content, $alias, $parent, $image, $price, $count, $brand) = $row;
  if($price<250)      $buffer = 15;
  elseif($price<600)  $buffer = 13;
  elseif($price<900)  $buffer = 10;
  elseif($price<2000) $buffer = 5;
  elseif($price<4000) $buffer = 1;
  else                $buffer = 0;
  
  $offerAttrs = array();
  $offerAttrs[] = '<url>' . $modx->makeUrl($id, null, null, 'full') . '</url>';
  $offerAttrs[] = '<price>' . $price . '</price>';
  $offerAttrs[] = '<currencyId>RUR</currencyId>';
  $offerAttrs[] = '<categoryId>' . $parent . '</categoryId>';
  if($image) $offerAttrs[] = '<picture>' . $modx->getConfig('site_url') . preg_replace("~^\/~", "" , json_decode($image)[0]) . '</picture>';
  $offerAttrs[] = '<pickup>true</pickup>';
  $offerAttrs[] = '<delivery>true</delivery>';
  //$offerAttrs[] = '<name>' . mb_ucfirst(xmlentities(htmlentities($pagetitle))) . ' (' . $alias . ')</name>';
  $offerAttrs[] = '<name>' . mb_ucfirst(xmlentities(htmlentities($pagetitle))) . '</name>';
  if($brand) $offerAttrs[] = '<vendor>' . xmlentities($brand) . '</vendor>';
  $offerAttrs[] = '<vendorCode>' . $alias . '</vendorCode>';
  if($content)  $offerAttrs[] = '<description>' . str_replace(array("\r","\n"),"",strip_tags($content,ENT_XML1)) . '</description>';
  //$offerAttrs[] = '<sales_notes>Акция! Подарок в заказ при покупке на Маркете!</sales_notes>';
  $offerAttrs[] = '<sales_notes>Мин. сумма заказа '.$modx->getConfig('price_minimal').' руб.</sales_notes>';
  
  if($count > $buffer) $offers[] = '<offer id="' . $id . '" available="true">' . implode($offerAttrs) . '</offer>'; 
}

echo $out = '<?xml version="1.0" encoding="' . $modx->getConfig('modx_charset') . '"?>
<!DOCTYPE yml_catalog SYSTEM "shops.dtd">
<yml_catalog date="' . date("Y-m-d H:i") . '">
  <shop>
    <name>' . $modx->getConfig('site_name') . '</name>
    <company>Тематические товары</company>
    <url>' . $modx->getConfig("site_url") . '</url>
    <phone>+7 (903) 761-03-14</phone>
    <platform>MODx Evolution</platform>
    <version>' . $modx->getConfig("settings_version") . '</version>
    <email>' . $modx->getConfig("site_url") . '</email>
    <currencies>
        <currency id="RUR" rate="1"/>
    </currencies>
    <categories>' . implode((array)$categories) . '</categories>
    <local_delivery_cost>' . $modx->getConfig('price_delivery') . '</local_delivery_cost>
    <offers>' . implode("\r\n",(array)$offers) . '</offers>
  </shop>
</yml_catalog>
';
fwrite($fh = fopen($cachefile, "w+"), $out); fclose($fh);

?>