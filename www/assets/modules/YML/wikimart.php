<?php
/* 
 * Authentication
 */
$user = 'wikirobot';    $pass = '2f4GcS8>A~xti\7';
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
function xmlentities($str){$str = str_replace(array('"','&nbsp','&','<','>','\'',' ','™'), array('&quot;',' ', '&amp;','&gt;','&lt;','&apos;',' ',''), strip_tags($str)); return $str;}

$sc = $modx->getFullTableName('site_content');
$tv = $modx->getFullTableName('site_tmplvar_contentvalues');
$minprice = isset($_GET['minprice']) ? (int)$_GET['minprice'] : 0;

/*
 * Если дата генерации фида позже последних изменений на сайте, выводим его, не генерируя новый
 */
$cachefile = MODX_BASE_PATH . "assets/cache/wml_" . $minprice . ".xml";
$lastmod = max($modx->db->getValue($modx->db->select('editedon', $sc, null, 'editedon DESC',1)), filectime(MODX_BASE_PATH . "assets/modules/counter/timestamp"));
if(file_exists($cachefile) && filectime($cachefile)>$lastmod) die(file_get_contents($cachefile)); 

/*
 * <categories> - разделы каталога
 */ 
$query = $modx->db->select('id, parent, pagetitle, longtitle', $sc, 'template IN(2,3,4) AND hidemenu=0', 'parent ASC');
while($row = $modx->db->getRow($query))
  $categories[] = '<category id="' . $row['id'] . '"' . ( $row['parent'] != 2 ? ' parentId="' . $row['parent'] . '"' : '' ) . '>' . ($row['longtitle']?$row['longtitle']:$row['pagetitle']) . '</category>';


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
    `brand`.`value`,
    `newprice`.`value`
  FROM " . $sc . " `sc`
  LEFT JOIN " . $tv . " `image` ON `image`.`contentid`=`sc`.`id` AND `image`.`tmplvarid` = '1'
  LEFT JOIN " . $tv . " `brand` ON `brand`.`contentid`=`sc`.`id` AND `brand`.`tmplvarid` = '10'
  LEFT JOIN " . $tv . " `newprice` ON `newprice`.`contentid`=`sc`.`id` AND `newprice`.`tmplvarid` = '17'
  JOIN " . $tv . "      `price` ON `price`.`contentid`=`sc`.`id` AND `price`.`tmplvarid` = '2'
  JOIN " . $tv . "      `count` ON `count`.`contentid`=`sc`.`id` AND `count`.`tmplvarid` = '9'
  WHERE `sc`.`template` = 5 
    AND `sc`.`hidemenu` = 0 
    AND `sc`.`published` = 1 
    AND `sc`.`parent` NOT IN(10839, 29, 89, 92, 94, 96, 99, 100, 101, 102, 107, 108, 109, 110, 116, 140, 144, 145, 146, 147, 148, 149, 150, 151, 14415, 14633, 14634, 14635, 14636, 14637, 14705, 14706, 14708, 14719, 14720, 14722)
    AND `price`.`value` > " . $minprice . "
";

$query = $modx->db->query($query);


while($row = $modx->db->getRow($query, 'num')){
  list($id, $pagetitle, $content, $alias, $parent, $image, $price, $count, $brand, $newprice) = $row;
  
  //if(in_array($alias, array('78869','G4147','G4148'))) continue; // убрать потом 
  //if(in_array($parent, array(''))) $count = 0; // новогодний ассортимент
  
  if($price<250)      $buffer = 15;
  elseif($price<600)  $buffer = 13;
  elseif($price<900)  $buffer = 10;
  elseif($price<2000) $buffer = 5;
  elseif($price<4000) $buffer = 1;
  else                $buffer = 0;
  
  $offerAttrs = array();
  $offerAttrs[] = '<url>' . $modx->makeUrl($id, null, null, 'full') . '</url>';
  
  //* <--- меняющий слеш
  if($newprice>0){
    $offerAttrs[] = '<oldprice>' . $price . '</oldprice>';
    $offerAttrs[] = '<price>' . $newprice . '</price>';
    $price = $newprice;
  }else{
    $offerAttrs[] = '<price>' . $price . '</price>';
  }
  /*/
  $offerAttrs[] = '<price>' . $price . '</price>';
  //*/

  $offerAttrs[] = '<currencyId>RUR</currencyId>';
  $offerAttrs[] = '<categoryId>' . $parent . '</categoryId>';

  if($image){
    foreach(json_decode($image) as $img){
      $offerAttrs[] = '<picture>' . $modx->getConfig('site_url') . preg_replace("~^\/~","",$img) . '</picture>';
    }
  }
  $offerAttrs[] = '<pickup>true</pickup>';
  $offerAttrs[] = '<delivery>true</delivery>';
  $offerAttrs[] = '<name>' . mb_ucfirst(htmlentities($pagetitle)) . '</name>';
  if($brand) $offerAttrs[] = '<vendor>' . xmlentities($brand) . '</vendor>';
  $offerAttrs[] = '<vendorCode>' . $alias . '</vendorCode>';
  $offerAttrs[] = '<article>' . $alias . '</article>';
  $offerAttrs[] = '<stock>' . ($count - $buffer) . '</stock>';
  if($content)  $offerAttrs[] = '<description>' . str_replace(array("\r","\n"), "", strip_tags($content,ENT_XML1)) . '</description>';
  
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
    <offers>' . implode((array)$offers) . '</offers>
  </shop>
</yml_catalog>';

fwrite($fh = fopen($cachefile, "w+"), $out); fclose($fh);

?>