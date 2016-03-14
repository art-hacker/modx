<?php

class IMLogistics{
    public  $request;
    private $login;
    private $pass;
    private $barcode_prefix;
    private $response;
    private $log;
    private $logpath;
    private $table;
    private $lists;
    
    public function __construct($login, $pass, $barcode_prefix, $modx) {
        $lists = $modx->db->makeArray($modx->db->select("name,json", $modx->getFullTableName("manager_iml_lists")));
        foreach($lists as $list){
            $list['json'] = str_replace("\r\n","",$list['json']); // ждем устранения ошибки от IML
            $this->lists[$list['name']] = json_decode($list['json']);
        }
        $this->log = true;
        $this->logpath = dirname($_SERVER['SCRIPT_FILENAME']) . "/logs/" . date("Y-m");
        $this->pass = $pass;
        $this->login = $login;
        $this->barcode_prefix = $barcode_prefix;
        $this->table = $modx->getFullTableName("manager_iml_requests");
        $this->request = array(
            "Message" => array(
                'sender'    => 'TTstore', // 04234
                'recipient' => 'IM Logistics',
                'issue'     => date("Y-m-d\TH:i:s"),
                'reference' => '',//time(),
                'version'   => '1.0',
            )
        );
    }
    
    public function curl_init($path,$request=false){
        $optArr = array(
            CURLOPT_URL             => "https://request.imlogistic.ru" . $path,
            CURLOPT_USERPWD         => $this->login . ":" . $this->pass,
            CURLOPT_SSLVERSION      => 3,
            CURLOPT_SSL_VERIFYPEER  => false,
            CURLOPT_RETURNTRANSFER  => true
        );

        if($request){
          switch($request){
            case "DELETE" :
                $optArr += array(CURLOPT_CUSTOMREQUEST => "DELETE");
            break;
            default :
                $optArr += array(
                  CURLOPT_POST        => true,
                  CURLOPT_HTTPHEADER  => array('Expect:', 'Content-type: text/xml', 'Content-length: '.strlen($request)),
                  CURLOPT_POSTFIELDS  => $request
                );
            break;
          }
        }
        curl_setopt_array($ch = curl_init(), $optArr);
        $response = array("result" => curl_exec($ch), "code" => curl_getinfo($ch, CURLINFO_HTTP_CODE));
        curl_close($ch);
        return $response;
    }
    
    public function listen($folder="Outbox"){
        $response = $this->curl_init("/".$folder);
        $response = simplexml_load_string($response["result"]);
        return $response->fileName;
    }

    public function read($filename, $delete=true, $folder='Outbox'){
        $response = $this->curl_init('/'.$folder.'/'.$filename);
        if($this->log){
            $logfile = $this->logpath . "/RE/" . $filename;
            if(!is_dir(dirname($logfile))) mkdir(dirname($logfile),755,true);
            fwrite($fh = fopen($logfile, "w+"), $response["result"]); fclose($fh);
        }
        $response = simplexml_load_string($response["result"]);
        if($delete) $this->delete($filename);
        
        return $response;
    }
    
    public function delete($filename,$reference=false){
        $response = $this->curl_init("/Outbox/".$filename, "DELETE");
        if($reference===false) $reference = $this->request["reference"];
        mysql_query("DELETE FROM " . $this->table . " WHERE `reference` = '".$reference."'");
        return $response["code"];
    }

    public function send(){
        mysql_query("INSERT INTO ". $this->table ." (`issue`,`action`) VALUES (".time().",'".$this->request[0]["Order"]["action"]."')") or die(mysql_error()) ;
        $this->request["Message"]["reference"] = mysql_insert_id();
        foreach($this->request as $key => &$val){// Перебор массива запросов
            if(is_int($key) && empty($val["Order"]["number"])){// Если массив - это запрос и у него нет номера заказа (забор)
                $val["Order"]["number"] = "Z".$this->request["Message"]["reference"];
            }
        }
        $xml = $this->createXML($this->request);
        if($this->log){
          $logfile = $this->logpath . "/".$this->request["Message"]["reference"].".xml";
          if(!is_dir(dirname($logfile))) mkdir(dirname($logfile),755,true);
          fwrite($fh = fopen($logfile, "w+"), $xml); fclose($fh);
        }
        $response['code'] = 200;
        //$response = $this->curl_init("/Inbox/".$this->request["Message"]["reference"].".xml", $xml);
        return $response["code"];
    }
    
    public function getStatus($orderId){
        $orderIds = is_array($orderId)? $orderId : preg_split("/[\s,]+/", $orderId);
        foreach($orderIds as $orderId){
          if(preg_match("~^\d+$~", $orderId)){
            $this->request[] = array(
                  "Order" => array(
                      "number" => $orderId,
                      "action" => "STATUS"
                  )
              );
          }else return 'Неверный формат номера заказа';
        }
        return $this->send();
    }
    
    public function sendOrder($number, $service, $issue, $timeFrom='', $timeTo='', $comment='', $address='', $fullname, $phone, $selfDelivery='', $price, $barcode, $region='МОСКВА', $volume=1){

        $purchase = $price;

        if(!$this->isValidService($service))return 'Некорректный код услуги. ('.$service.')';
        
        if(in_array($service,array("24", "С24", "Э24"))) $price = 0; // Если предоплата - обнуляем сумму заказа (оценочная остается)

        if(!$issue = date_create_from_format("Y-m-d", $issue)) return 'Не верный формат даты.';
        if($issue->format('U')<strtotime(preg_match("~^Э~",$service)?'now':'tomorrow')) return 'Дата '.$issue->format('d.m.Y').' устарела.';// Если дата ранее чем завтрашняя (для Экспресс - сегодняшняя) читаем что устарела
        //if($issue->format("N")==7) return 'Воскресенье - не рабочий день.'; // Уже рабочий)
          

        if(!in_array($service,array("ЗАБОР","ВОЗВРАТ"))){
            if(!is_numeric($price)) return 'Не верно указана сумма заказа';
            if(!preg_match("~^" . $this->barcode_prefix . "\d{9}~",$barcode)) return 'Некорректный штрихкод.';
        }
        
        if(in_array($service,array("С24КО","С24"))){ // Проверка номера ПВЗ (если самовывоз)
          unset($timeFrom, $timeTo, $address);
          if(empty($selfDelivery)) return 'Для услуги <b>'.$service.'</b> НЕ указан номер ПВЗ.';
        }else{ //Проверка адреса (если доставка, забор, возват и т.п.)
          unset($selfDelivery);
          $timeFrom = date_create_from_format("H:i", $timeFrom);
          $timeTo = date_create_from_format("H:i", $timeTo);
          if(!$timeFrom || !$timeTo || $timeFrom>$timeTo) return 'Не верный формат времени.';
          if($timeFrom->diff($timeTo)->format("%h")<3) return 'Минимальный временной интервал - 3 часа.';
          if($timeFrom->format("H")<9 || $timeTo->format("H")>21) return 'Временной промежуток указан неверно.';
          if(empty($address)) return 'Для услуги <b>'.$service.'</b> НЕ указан адрес.';
        }

        if(empty($fullname)) return 'Не заполнено имя';         // Проверка имени
        if(empty($phone)) return 'Не заполнен номер телефона.'; // Проверка телефона
        if(!$region = $this->isValidRegion($region)) return 'Не верное название региона.'; // Проверка региона доставки

        $this->request[] = array("Order" => array(
            'number' => $number,
            'action' => 'CREATE',
            'Condition' => array(
                'service' => $service,
                'Delivery' => array(
                    'issue'     => $issue->format("Y-m-d"),
                    'timeFrom'  => empty($timeFrom)? null : $timeFrom->format("H:i"),
                    'timeTo'    => empty($timeTo)? null : $timeTo->format("H:i")
                ),
                'comment' => $comment,
            ),
            'Region' => array(
                'departure'   => 'МОСКВА',
                'destination' => $region
            ),
            'Consignee' => array(
                'Address' => array(
                    'line' => $address,
                    /*'Detail' => array('street'=>'','house'=>'','structure'=>'','apartment'=>''),'city' => $city,'postCode' => $postCode,*/
                ),
                'RepresentativePerson'=>array(
                    'name' => $fullname,
                    'Communication' => array("telephone1" => $phone)
                ),
            ),
            'SelfDelivery' => empty($selfDelivery)? null : array("deliveryPoint" => $selfDelivery),
            'barCode'      => $barcode,
            'GoodsMeasure' => array(
                'weight' => '',
                'volume' => $volume,
                'amount' => $price,
                'statisticalValue' => $price
            )
            //,'GoodsItems'=>''
        ));
        return 200; //return $this->send(); //$this->request
    }
    
    public function createXML(array $arr, $xml=false){
      if($xml===false) $xml = new SimpleXMLElement('<?xml version="1.0" encoding="utf-8"?><DeliveryRequest xmlns="http://www.imlogistic.ru/schema/request/v1"/>');
      foreach($arr as $t => $v){
        if(is_numeric($t)){ $t = array_keys($v)[0]; $v = $v[$t]; }
        is_array($v) ? $this->createXML($v, $xml->addChild($t)) : $xml->addChild($t, $v);
      }
      return $xml->asXML();
    }
    
    public function isTest($test){
      if($test){
        $this->request["Message"]["test"] = 1;
      }else{
        unset($this->request["Message"]["test"]);
      }       
      return $this->request;
    }
    public function logging(){
      $this->log = true;
    }
    
    public function isValidService($service){
      foreach($this->lists['service'] as $validService){
        if($service==$validService->Code) return true;
      }
      return false;
    }
    public function isValidRegion($region){
      foreach($this->lists['region'] as $validRegion){
        if(in_array($region,array_values((array)$validRegion))) return $validRegion->Code;
      }
      return false;
    }
    public function setLogPath($logpath){
      $this->logpath = $logpath;
    }
}
    
?>