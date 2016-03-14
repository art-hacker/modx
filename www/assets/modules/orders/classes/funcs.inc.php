<?php

function allowedArray($allowed,$purchases){
    if(empty($allowed) && $allowed!='0'){
        $o_allowed = array(); 
    }elseif($allowed=='all'){
        $o_allowed = array();
        foreach ($purchases as $i => $arr) { 
            $o_allowed = array_merge($o_allowed,array($i)); 
        }
    }else{
        $o_allowed = explode(',',$allowed); 
    }
    return $o_allowed;
}
function rdate($param, $time=0) {if(intval($time)==0)$time=time();$m=array("января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"); return date( strpos($param,'M')===false? $param : str_replace('M',$m[date('n',$time)-1], $param), $time);}
function datediff($timestamp){$diff = time()-$timestamp; $i = 1;$calendar = array(array("case"=>array("секунду", "секунды", "секунд"),"value" => 1),array("case"=>array("минуту", "минуты", "минут"),   "value" => 60),array("case"=>array("час", "часа", "часов"),        "value" => 60),array("case"=>array("день", "дня", "дней"),         "value" => 24),array("case"=>array("месяц", "месяца", "месяцев"),  "value" => cal_days_in_month(CAL_GREGORIAN, date("n",$timestamp),date("Y",$timestamp))),array("case"=>array("год", "года", "лет"),          "value" => 12),);foreach($calendar as $k=>$cal){if($diff<($i*$calendar[$k+1]["value"])) break;$i *= $calendar[$k+1]["value"];}return round($diff/$i)." ".strUnitFormat(round($diff/$i),$cal['case'])." назад";} 
function strUnitFormat($int=0,$options=array()){if($int%100<10||$int%100>19)$int%=10;switch($int){case 1: return $options[0]; break;case 2: case 3: case 4: return $options[1]; break;default: return $options[2]; break;}}
function numberToText($numeric,$currency=array("рубль","рубля","рублей"),$currency2=array("копейка","копейки","копеек")){
  if(($numeric=floatval($numeric))>0 && $numeric<10000000000000){
    $digitNames = array(
        array("биллион","биллиона","биллионов"),
        array("миллиард","миллиарда","миллиардов"),
        array("миллион","миллиона","миллионов"),
        array("тысяча","тысячи","тысяч")
    );
    $units = array(
      array(null, "сто", "двести", "триста", "четыреста", "пятьсот", "шестьсот", "семьсот", "восемьсот", "девятьсот"),
      array("десять", "одиннадцать", "двенадцать::двадцать", "тринадцать::тридцать", "четырнадцать::сорок", "пятнадцать::пятьдеят", "шестнадцать::шестьдеят", "семнадцать::семьдесят", "восемнадцать::восемьдесят", "девятнадцать::девяносто"),
      array(null,"один::одна", "два::две", "три", "четыре", "пять", "шесть", "семь", "восемь", "девять")
    );
    list($numeric,$decimal) = explode('.',sprintf("%018.2f", $numeric));
    $ouput=array();
    foreach(str_split($numeric,3) as $i=>$digits){
      if (!intval($digits)) continue;
      foreach(str_split($digits,1) as $n=>$d){
          if (!intval($d)) continue;
          if($n==1&&$d==1) $isTeen = $d = $digits[$n+1];
          if($n==2 && !empty($isTeen)) continue;
          $ouput[] = explode("::",$units[$n][$d])[$n==2&&$i==3&&$d<3 || $n==1&&!$isTeen]; // $i==2 если тысячи - женский род (одна две)
      }
      unset($isTeen);
        
      if(isset($digitNames[$i])) $ouput[] = strUnitFormat($digits,$digitNames[$i]);
    }
    if(is_array($currency) && count($currency==3)) $ouput[] = strUnitFormat($numeric,$currency); // слово "рубль"
    if(is_array($currency2) && count($currency2==3)){
      $ouput[] = $decimal;
      $ouput[] = strUnitFormat($decimal,$currency2); // слово "копейки"
    }
    return implode(" ",$ouput);
  }else return false;
}

function date_flip_args($date,$format){ return date($format,strtotime($date));}

?>