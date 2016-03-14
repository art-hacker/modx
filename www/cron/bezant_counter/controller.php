<?php
/*<modx-api>*/
if(!getenv('MODX_BASE_PATH')) exit('Fatal error: environment variable MODX_BASE_PATH not defined.');
define('MODX_BASE_PATH', getenv('MODX_BASE_PATH'));
require_once(MODX_BASE_PATH . 'modx-api.inc.php');
/*</modx-api>*/

ini_set('memory_limit','256M'); // Скрипт использует около 160mb памяти
set_time_limit(0);

require_once('price.class.php');
$price = new price($modx, [
        "template"  => 7,
        "image"     => 1,
        "price"     => 2,
        "purchase"  => 6,
        "count"     => 8,
        "brand"     => 13,
        "series"    => 15
]);
$time = microtime(1);

switch($_SERVER["QUERY_STRING"]){
    case 'requestPrice':
        $price->request();
    break;
    case 'updateProducts':
        $price->download();
        $price->excelToArray();
        $price->insertData();
    break;
}

echo round((microtime(1)-$time)*100)/100, PHP_EOL;
echo memory_get_peak_usage(1)/1024/1024, 'mb', PHP_EOL;



//$str = "Кресло ПРЕСТИЖ зеленое";
//echo $b->getSeries($str);
//die;

//$data = $b->excelToArray("tmpfile.xls");
//foreach($data as $row){
//    $series = $b->getSeries($row[1]);
//    if($row[4]>0) {
//        if ($series) {
//            //echo $row[1],PHP_EOL;
//            $serieses[$series]++;
//        }
//        else {
//            $serieses[""][] = $row[1];
//        }
//    }
//}
//ksort($serieses);
//print_r($serieses);
//die;
//
//foreach($serieses as $series => $count){
//    echo $series . "\t" . $count, PHP_EOL;
//}
//
//die;
