<?php

error_reporting(E_ALL&~E_NOTICE);

define("BASE_PATH", "../../../");

$allowedSizes = array(
  'w' => array(400,150,230,64,null),
  'h' => array(275,95,64,null)
);

$path = BASE_PATH . "thumbs/".$_REQUEST["size"]."/".$_REQUEST["path"];
//if(!file_exists($path)){
list($w,$h) = explode("x",$_REQUEST["size"]);

if(!in_array($h, $allowedSizes['h']) || !in_array($w, $allowedSizes['w'])){
  header("HTTP/1.0 404 Not Found");
  exit('HTTP/1.0 404 Not Found');
}
if(!is_dir(dirname($path))) mkdir(dirname($path),$chmod=0755,$recursive=true);
require_once(dirname(__FILE__).'/phpthumb.class.php');
$phpThumb = new phpThumb();
$phpThumb->w = $w;
$phpThumb->h = $h;
$phpThumb->zc = 1;
$phpThumb->q = 95;
//$phpThumb->src = $_SERVER['document_root'].'/'.$_REQUEST['path'];
$phpThumb->src = BASE_PATH . $_REQUEST['path'];
$phpThumb->f = $_REQUEST['ext'];
$phpThumb->GenerateThumbnail();
$phpThumb->RenderToFile($path); 
header('Content-Type: image/'.$phpThumb->f);

exit($phpThumb->outputImageData);
//}
?>