<?php

/**
 * Class product
 */

class product
{
    private $modx;
    private $config = [];

    /**
     * product constructor.
     * @param DocumentParser $modx
     * @param array $config
     */
    public function __construct(DocumentParser &$modx, $config=[])
    {
        $this->config = array_merge($this->config,$config);
        $this->modx = $modx;
    }

    /**
     * @param $param
     * @return bool|string
     */
    public function getConfig($param){
        if(isset($this->config[$param])){
            return $this->config[$param];
        }else{
            return false;
        }
    }

    /**
     * @param float $purchase Закупочная цена
     * @param bool $psychPricing использовать метод psychPricing при расчете цены
     * @return float Возвращает цену товара
     */
    public function getPrice($purchase, $psychPricing=true){
        $maxMargin = $this->modx->getConfig('maxMargin');       // Максмальная маржа
        $minMargin = $this->modx->getConfig('minMargin');       // Минимальная маржа
        $threshold = $this->modx->getConfig('thresholdPrice');  // Цена с коротой начинает расти маржа
        $price = (($minMargin + (1 - $minMargin/$maxMargin) * $maxMargin * (1-pow(($purchase>$threshold?$threshold:$purchase)/$threshold,0.1)))/100+1) * $purchase;
        if($psychPricing){
            $price = $this->getPsychPrice($price);
        }else{
            $price = round($price);
        }
        return $price;
    }

    /**
     * @param float $price Цена товара
     * @param int $minus Сколько вычитать из итога
     * @return float Возвращает преобразованную цену товара
     */
    private function getPsychPrice($price, $minus=1){
        if($price < 10){ $range = 1; $minus=0;}
        elseif($price <= 299) $range = 10;
        elseif($price <= 1499) $range = 50;
        else $range = 100;
        return ceil($price / $range) * $range - $minus;
    }

    /**
     * @param string $alias Артикул товара
     * @return bool|string Возвращает название производителя, или false если он не был найден.
     */
    public function getBrand($alias){
        $brand = false;
        $brandsRegExps = array(
            "Luminarc"        => "^(C|D|E|H|J|U)[0-9]{4}(-1)?$", // G____ - могут быть как Luminarc так и YORK.
            "Domenik"         => "^DM[0-9]{4}",
            "Taller"          => "^TAL[0-9]{4}",
            "Attribute"       => "^A(BA|BB|BC|BE|BF|BH|BM|BP|BR|BT|BV|CA|CB|CC|CD|CF|CG|CH|CJ|CP|CS|CU|CW|DC|DM|DP|DS|DW|FA|FB|FC|FE|HB|HC|HD|HM|HN|HO|HR|HS|HW|KA|KB|KC|KF|KG|KK|KM|KR|KW|KZ|LB|LH|LL|LM|LS|MM|MO|MV|SK|TT|TV)[\-0-9]{2,3}",
            "China-NA-TIExp"  => "^(CN|GC)[0-9]{3,5}(W|B|-1)?$",
            "Rozenbal"        => "^R[0-9]{6}(-1)?$",
            "Walther-Glas"    => "^W[0-9]{7}(-1)?$",
            "Вилина"          => "^VI[0-9]{4,5}$",
            "Инстар"          => "^IN[0-9]{3}(-1)?$",
            "Либра"           => "^EF[0-9]{3}(-1)?$",
            "М-пластика"      => "^M[0-9]{4}(-1)?$",
            "МКН"             => "^MKN[0-9]{2}$",
            "Паклан"          => "^PK[0-9]{5,7}$",
            "Пластхозторг"    => "^PZ[0-9]{2}$",
            "Полибытхим"      => "^PL[0-9]{2,3}$",
            "Полимербыт"      => "^C([0-9]{3}|[0-9]{5})(-1)?$",
            "СВ-Форум"        => "^SV[0-9]{2}$",
            "СпринтРИМ"       => "^CC[0-9]{2}$",
            "Тандем-Пласт"    => "^KRT?[0-9]{3}$",
            "Телерин"         => "^TN[0-9]{3}A?$",
            "ЭВИС"            => "^EVIS[0-9]{4}$",
            "SJ"              => "^NC[0-9]{5}M?$",
            "Эксима"          => "^EK[0-9]{3,4}$",
            "ЭНС"             => "^PSN?L?[0-9]{6,7}$",
            "Неман"           => "^N[0-9]{4,5}\/[0-9]{4}$",
            "Borner"          => "^1[0-1]{1}[0-9]{1}[-\/][0-9]{1}$",
            "Deniro"          => "^DENI[0-9]{2}$",
            "Frybest"         => "^((C|R|T)(A|L|O|P|R)[0-9]{5}B[0-9]N[0-9](-[0-9])?|MUR-.*|(Z|S|E|C)(C|O|T)-[0-9]{2}.{1,2})$",
        );
        foreach($brandsRegExps as $regBrand => $regExp){
            if(preg_match("~".$regExp."~",$alias)){
                $brand = $regBrand;
            }
        }

        /*
         if($brand===false){ // Если не удалось определить производителя по артикулу, пробуем спарсить с безанта.
            $page = file_get_contents("http://bezant.ru/good.php?goods_id=".$row['eId']);
            $page = iconv("cp1251","utf-8",$page);
            preg_match("~<b>Производитель:</b>(.+)<~U",$page,$matches);
            $brand = trim($matches[1]);
        }

        switch($brand){
            case 'Arc International':           $brand = 'Luminarc'; break;
            case 'Borner (Бернер Ист)':         $brand = 'Borner'; break;
            case 'PYREX':                       $brand = 'Pyrex'; break;
            case 'Simax (Богемия Люкс)':        $brand = 'Simax'; break;
            case 'York (ВТФК,Этна)':            $brand = 'York'; break;
            case 'НЕМАН':                       $brand = 'Неман'; break;
            case 'Никис (Эскорт)':              $brand = 'Никис'; break;
            case 'Паклан (СедоХаусхолд Продакс)': $brand = 'Паклан'; break;
            case 'Полибытхим (Фиброполимер)':   $brand = 'Полибытхим'; break;
            case 'РадиусПак (Подарки)':         $brand = 'РадиусПак'; break;
            case 'Телерин (Мультипласт 2000)':  $brand = 'Телерин'; break;
            case 'ЭНС (Династия)(Фламинго)':    $brand = 'ENS'; break;
            case ''; case 'не указан':          $brand = false; break;
        }//*/
        return $brand;
    }

    /**
     * @param $pagetitle
     * @return string Возвращает название серии
     */
    public function getSeries($pagetitle){
        /**
         *  @var string $regexp
         *  Перед названием серии обязательно долежн быть пробел.
         *  Далее обязательно 1 и более заглавн буквы.
         *  Далее могут быть заглавные буквы или строчная a, дефисы, пробелы или знаки & цифры или !
         *  Последний символ серии обязательно либо заглавная буква или восклицательный знак.
         *  В конце серии через может быть "дефис-цифра"
         *  В конце серии через пробел может быть год
         *  Заканчивается серия обазетельно либо пробелом либо кавычкой либо нихуя ничем (больше символов нет)
         */
        $regexp = '~
        (?:\s|")
        (
          [Ё А-Я A-Z]+
          [Ё А-Я A-Z а \- \s \' &]+
          [Ё А-Я A-Z \!]+
          (?: -[0-9]{1,2})?
          (?: \s 20\d{2} )?
        )
        (?:"|\s|$)
        ~ux'; //
        preg_match_all($regexp, $pagetitle, $matches);
        $series = implode(" ",array_unique($matches[1]));           // Соединяем результат регулярки в строку
        $series = explode(" ",$series);                             // Разбиваем строку на слова
        if(mb_strlen(end($series),"UTF-8")==1) array_pop($series);  // Удаляем последнее слово, если оно из 1го символа
        foreach($series as $k=>$v){
            if(empty($v)){
                unset($series[$k]);                                 // Удаляем пустые вхождения
            }
        }

        $series = implode(" ", $series);
        $series = trim($series);

        $seriesRegExps = array(
            'RATTAN STYLE'      => '.*RATTAN STYLE.*',
            'СВЧ FRESH&GO'      => '.*FRESH&GO.*',
            'ЭКСТРА ЛОК'        => '.*ЭКСТРА ЛОК.*',
            'ДУЭТ'              => '.*ДУЭТ.*',
            'ANGRY BIRDS'       => '.*ANGRY BIRDS.*',
            'РОТОР'             => 'РОТОР[0-9]',
            'АЛЬФА'             => 'АЛЬФА\-[0-9]',
            'ПРОФИ'             => 'ПРОФИ\-[0-9]',
            'КАСКАД'            => '.*КАСКАД.*',
            'СМАЙЛ'             => '.*СМАЙЛ .*'
        );

        foreach($seriesRegExps as $regSeries => $regExp){
            if(preg_match("~".$regExp."~",$series)){
                $series = $regSeries; break;
            }
        }
        $series = $this->mb_ucfirst($series);
        return $series;
    }

    /**
     *
     * @return bool|int Возвращает id категории товара, или false в случае, если категорию определить не удалось
     */
    public function getSection(){
        return 23;
    }

    /**
     * @param $alias
     * @return string|bool Получает изображение товара
     */
    public function getImage($alias){
        $path = MODX_BASE_PATH . "assets/images/b/" . $alias . ".jpg";
        if(file_exists($path)){
            return str_replace(MODX_BASE_PATH, MODX_BASE_URL, $path);
        }else{
            if($image = @file_get_contents("http://bezant.ru/cat/" . strtolower($alias) . ".jpg")){
                if(!is_dir(dirname($path))) mkdir(dirname($path), $chmod=0755, $recursive=true);
                fwrite($fh = fopen($path, "w+"), $image); fclose($fh);
                return str_replace(MODX_BASE_PATH, MODX_BASE_URL, $path);
            }else{
                return false;
            }
        }
    }

    private function mb_ucfirst($str,$enc='UTF-8'){
        return mb_strtoupper(mb_substr($str,0,1,$enc),$enc) . mb_strtolower(mb_substr($str,1,mb_strlen($str,$enc),$enc),$enc);
    }
}