<?php
/*</modx-api>*/
putenv("MODX_BASE_PATH=C:/xampp/htdocs/");
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: environment variable MODX_BASE_PATH not defined.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/

startCmsSession();
if(!isset($_SESSION['mgrValidated']) || $_SESSION['mgrValidated']!=1){ header('Refresh: 0; URL=/manager/index.php'); die;}

define("PHPTHUMB_PATH", MODX_BASE_PATH . 'assets/snippets/phpThumb/');
define("PHOTOBANK_PATH", 'D:/photobank/pics/');
define("TARGET_PATH", MODX_BASE_PATH . 'assets/images/products/p/');
require_once(PHPTHUMB_PATH . 'phpthumb.class.php');

ini_set("memory_limit","1256M"); // Что бы рендерить большие изображения (6000х6000)

/**
 * Зафигачиваем в массив все что есть в фотобанке
 */
$q = $modx->db->query(/** @lang MySQL */
"SELECT `p`.`CODE`, pi.SRC  FROM `fotobank`.`products` p
JOIN(
    SELECT * FROM `fotobank`.`product_images` UNION SELECT * FROM `fotobank`.`product_images2`
) `pi`
ON p.`ID` = `pi`.`PRODUCT_ID`");

$src_arr = [];
while($row = $modx->db->getRow($q)) {
    $src_arr[strtolower($row['CODE'])][] = $row['SRC'];
}

/**
 * Вытягиваем все товары в массив
 */
$q = $modx->db->select("*",$modx->getFullTableName("site_content"),'template=7');
$db_products=[];
while($row = $modx->db->getRow($q)){
    $db_products[] = strtolower($row['alias']);
}

$src_arr = array_intersect_key($src_arr, array_flip($db_products)); // Фильтруем изображения фотобанка

foreach($src_arr as $alias => $srcs){
    foreach($srcs as $i => $src){
        // Куда рендерить изображение
        $targetPath = TARGET_PATH . substr($alias,0,1) . DIRECTORY_SEPARATOR . $alias . (count($srcs)>1 ? "_".$i:"") . ".jpg";
        if(file_exists($targetPath)) continue; // Если уже есть не рендерим

        $phpThumb = new phpThumb();
        $srcPath1 = PHOTOBANK_PATH . "files" . DIRECTORY_SEPARATOR  . $src;
        $srcPath2 = PHOTOBANK_PATH . "files2" . DIRECTORY_SEPARATOR  . $src;
        if(file_exists($srcPath1)) $phpThumb->src = $srcPath1;
        elseif(file_exists($srcPath2)) $phpThumb->src = $srcPath2;
        else{
            echo "[".$alias."] File ".$src." not found", PHP_EOL;
            continue;
        }

        list($src_width, $src_height) = GetImageSize($phpThumb->src);
        $max_width = 1600;
        $max_height = 900;
        if($src_width - $max_width > $src_height - $max_height){    // Если ширина должна уменьшиться больше чем высота
            $phpThumb->w = $max_width;                              // Уменьшеем по ширине
        }else{
            $phpThumb->h = $max_height;
        }
        $phpThumb->zc = 0; // Не обрезаем
        $phpThumb->q = 70; // Шакалим
        $phpThumb->f = "jpg";
        $phpThumb->GenerateThumbnail();

        if(!is_dir(dirname($targetPath))) mkdir(dirname($targetPath),$chmod=0755,$recursive=true); // Создаем папки если нет

        if($phpThumb->RenderToFile($targetPath))
            echo "[".$alias."] uploaded ", $targetPath, PHP_EOL;
        else echo "[".$alias."] <u>failed</u> ", $phpThumb->src, PHP_EOL;
    }
}

echo memory_get_peak_usage(1)/1024/1024;
//header('Content-Type: image/'.$phpThumb->f);
//exit($phpThumb->outputImageData);











/*$doc = array(
    'pagetitle'     => 'Банка РОНДО ВАЛЕНСИЯ 0.5л',
    'alias'         => 'G8491',
    'published'     => '1',
    'parent'        => '23',
    'template'      => '7',
    'createdby'     => '1',
    'tv'            => array(
        ['tmplvarid' => 1, 'value' => '["/assets/images/b/G8491.jpg"]'],
        ['tmplvarid' => 2, 'value' => 149]
    )
);

$sc = $modx->getFullTableName('site_content');
$data = $modx->db->getTableMetaData($sc);
//$data=array_map(function(&$row){return 1;},$data);
print_r($t);
//$modx->addResourse($doc);
*/