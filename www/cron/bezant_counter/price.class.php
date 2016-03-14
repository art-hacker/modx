<?php

/**
 * Class price
 */

require_once('product.class.php');
require_once(MODX_BASE_PATH . 'assets/lib/PHPExcel/Classes/PHPExcel/IOFactory.php');

class price extends product
{
    private $modx;
    private $price;
    private $priceData;

    /**
     * price constructor.
     * @param DocumentParser $modx
     * @param array $config
     */
    function __construct(DocumentParser &$modx, $config=[])
    {
        $this->modx = $modx;
        parent::__construct($modx,$config);
    }

    /**
     * Отправляем письмо поставщику для запроса остатков.
     * @param string $subject Тема письма
     * @param string $from От кого
     * @param string $to Кому
     * @param string $fromName Имя отправителя
     * @param string $toName Имя получателя
     * @return bool Возвращает true в случае успешной отправки, или false при неудаче
     */
    public function request($subject='Остатки', $from = 'shop@ttstore.ru', $to = 'olga.buslova@bezant.ru', $fromName='Артём', $toName='Ольга')
    {
        $msgs = [
            'Здравствуйте, ' . $toName . '. Большое спасибо! Пришлите, пожалуйста, остатки на сегодня.',
            'Доброе утро, вышлите, пожалуйста, актуальные остатки. За предыдущие спасибо!',
            'Доброе утро, ' . $toName . ', вышлите, пожалуйста, новые остатки, хорошего дня!',
            'Доброе утро, ' . $toName . ', вышлите, пожалуйста, новый прайс, спасибо!',
            'Доброго утра, спасибо за остатки, можно актуальные? Хорошего дня!',
            'Доброго утра, спасибо за прайс, можно актуальный? Хорошего дня!',
            'Доброе утро, ' . $toName . ', не могли бы Вы выслать остатки? Спасибо!',
            'Здравствуйте, большое спасибо за предыдущие остатки, вышлите новые, пожалуйста.'
        ];
        return $this->modx->sendmail([
            'subject' => $subject,
            'body' => $msgs[array_rand($msgs)],
            'from' => $from,
            'to' => $to,
            'fromname' => $fromName
        ]);
    }

    /**
     * Скачиваем последний прайс из почты
     * @param string $folder Папка с прайсами на почте (ставить пустой если нужно искать во входящих)
     * @param string $path Пусть сохранения файла
     * @param bool $save Сохранять прайс в файл или возвращать его функцией
     * @return bool|string Возвращает прайс, или false в случае ошибки.
     */
    public function download($folder='Prices', $path='tmpfile', $save=true)
    {
        $login = $this->modx->getConfig('smtp_username');
        $password = $this->modx->getConfig('smtppw');
        $password = base64_decode(str_replace('%','=',substr($password,0,-7)));

        // Получаем письма из папки Prices
        $imap = imap_open('{imap.yandex.ru:993/imap/ssl/novalidate-cert}'.$folder, $login, $password)
            or die(imap_last_error());

        // Сортируем и фильтруем письма. Берем самое первое [0].
        $mail = imap_sort($imap, SORTDATE, 1, NULL, 'SINCE "' . date("d M Y", strtotime("-1 week")) . '"', "UTF-8")[0];

        $structure = imap_fetchstructure($imap, $mail);                                 // Берем структуру самого свежего письма
        if(isset($structure->parts)){                                                   // Если все збс
            foreach($structure->parts as $k => $part){                                  // Перебираем структуру письма
                if(isset($part->disposition) && $part->disposition=='attachment'){      // Если натыкаемся на вложение
                    $attachment = imap_fetchbody($imap, $mail, $k+1);                   // Получаем его содержимое
                    switch($part->encoding){                                            // Дешифруем
                        case 3: $attachment = base64_decode($attachment); break;
                        case 4: $attachment = quoted_printable_decode($attachment); break;
                    }
                    switch(strtolower($part->subtype)){                                 //Узнаем разширение
                        case 'vnd.ms-excel': $ext = '.xls'; break;
                        case 'vnd.openxmlformats-officedocument.spreadsheetml.sheet': $ext = '.xlsx'; break;
                        default: $ext="";
                    }
                    $this->price = $path.$ext;
                    if($save) {
                        fwrite($fh = fopen($this->price, 'w+'), $attachment); fclose($fh);
                        return $this->price;
                    }else{
                        return $attachment;
                    }
                }
            }
        }
        return false;
    }

    /**
     * @param string $path Пусть к файлу прайса
     * @return array Возвращает преобразованный из excel прайса массив данных
     * @throws PHPExcel_Reader_Exception
     */
    public function excelToArray($path=false)
    {
        if(empty($path) && !empty($this->price)){
            $path = $this->price;
        }
        if (file_exists($path)){
            // \PHPExcel_Settings::setCacheStorageMethod(\PHPExcel_CachedObjectStorageFactory::cache_in_memory_gzip); // ОЗУ меньше, ЦП больше
            $objReader = PHPExcel_IOFactory::createReaderForFile($path);                    // Определяем тип файла (версию экселя и т.п.)
            $objReader->setReadDataOnly(true);                                              // Читаем только данные (без форматирования)
            $objPHPExcel = $objReader->load($path);                                         // Загружаем файл в память
            $data = $objPHPExcel->getActiveSheet()->toArray(null,false,false,false);   // Преобразуем в массив
            array_shift($data);                                                        //Убираем первую строку
            $objPHPExcel->disconnectWorksheets();
            $this->priceData = $data;
            return $data;
        }else{
            return false;
        }
    }

    /**
    * Добавляет товар из массива в базу данных сайта
    * Пытается добавить характеристики товара
    * @param array $data Массив данных прайс листа (генерируется методом excelToArray)
    * @return array Возвращает добавленные в базу данные
    */
    public function insertData(array $data=[])
    {
        if(empty($data) && !empty($this->priceData)){
            $data = $this->priceData;
        }
        // Фильтрация данных
        $data = array_filter($data,function($row){
            foreach($row as $v) if($v=="") return false;        // если неполные строки (названия групп)
            if($row[2] < 5) return false;                       // если цена закупки меньше 5 рублей
            if(strripos($row[0], 'TOV-')!==false) return false; // если товар с уценки
            if(strripos($row[0], 'FR-')!==false) return false;  // если товар с уценки
            return true;
        });

        // Форматирование данных
        array_walk($data, function(&$item){
            list($alias, $pagetitle, $purchase, $storage, $count) = $item;
            $item = [
                'alias'     => str_replace("/","_",$alias),
                'pagetitle' => $this->xmlentities($pagetitle),
                'purchase'  => preg_replace("~[^\d]~","",$purchase)/100,     // Преобразуем закупочную цену в float число ("68.99 р." => 68.99)
                'count'     => preg_replace("~[^\d]~","",$count),            // Убираем пробелы "10 123" => 10123)
                'price'     => $this->getPrice($purchase)                    // Устанавливаем цену
            ];
        });

        // Получение информации о заменяемых данных
        $aliases = array_map(function($row){ return $row['alias'];}, $data); // Не обязательно. Вынимаем только те данные что есть в прайсе (можно вынуть и все, возможно будет медленней)
        $sc = $this->modx->getFullTableName("site_content");
        $tv = $this->modx->getFullTableName("site_tmplvars");
        $tvv = $this->modx->getFullTableName("site_tmplvar_contentvalues");
        $query = $this->modx->db->query('
            SELECT `sc`.`id`, `sc`.`alias`, `tvv`.`value`, `tv`.`name`
            FROM ' . $sc . ' `sc`
            JOIN ' . $tvv . ' `tvv` ON `tvv`.`contentid` = `sc`.`id`
            JOIN ' . $tv . ' `tv` ON `tv`.`id` = `tvv`.`tmplvarid`
            WHERE `sc`.`alias` IN ("' . implode('","', $aliases) . '")
            AND `tv`.`name` IN ("price", "purchase", "count")
        ');

        $db_data = []; // Записываем в массив
        while($row = $this->modx->db->getRow($query)){
            $db_data[$row['alias']][$row['name']] = $row['value'];
            $db_data[$row['alias']]['id'] = $row['id'];
        }

        foreach($data as $item){
            //extract($item); // phpstorm нихуя не понимает эту функцию.
            list($alias, $pagetitle, $purchase, $count, $price) = array_values($item);

            if(isset($db_data[$alias])){ //update
                $doc = ['id' => $db_data[$alias]['id']];

                if($count != $db_data[$alias]['count']){
                    $doc['hidemenu'] = $count>0 ? 0 : 1;
                    $doc['tv'][] = ['tmplvarid' => $this->getConfig("count") , 'value' => $count];
                }
                if($purchase != $db_data[$alias]['purchase']){
                    $doc['tv'][] = ['tmplvarid' => $this->getConfig("purchase") , 'value' => $purchase];
                }
                if($price > $db_data[$alias]['price']){
                    $doc['tv'][] = ['tmplvarid' => $this->getConfig("price") , 'value' => $price];
                }



            }else{// insert
                if($count>0){ //Добавляем в базу только если есть в наличии на складе
                    $doc = [
                        'pagetitle' => $this->modx->db->escape($pagetitle),
                        'alias'     => $this->modx->db->escape($alias),
                        'published' => 1,
                        'parent'    => $this->getSection(),
                        'template'  => $this->getConfig("template"),
                        'createdby' => 1,
                        'tv'        => [
                            ['tmplvarid' => $this->getConfig("price"),      'value' => $price],
                            ['tmplvarid' => $this->getConfig("purchase"),   'value' => $purchase],
                            ['tmplvarid' => $this->getConfig("count"),      'value' => $count],
                            ['tmplvarid' => $this->getConfig("brand"),      'value' => $this->getBrand($alias)],
                            ['tmplvarid' => $this->getConfig("series"),     'value' => $this->getSeries($pagetitle)]
                        ]
                    ];

                    if($image = $this->getImage($alias)){
                        $doc['tv'][] = ['tmplvarid' => $this->getConfig("image") , 'value' => json_encode([$image], JSON_UNESCAPED_SLASHES)];
                    }
                }
            }
            if(isset($doc)){
//                $this->modx->addResourse($doc);
                print_r($doc);
            }
        }
        return true;
    }

    private function xmlentities($str){
        return str_replace(array('&nbsp;','™'), array(' ',''), strip_tags($str));
    }
}