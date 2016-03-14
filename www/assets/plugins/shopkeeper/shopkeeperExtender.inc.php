<?php
/*
 plugin shopkeeperExtender
 [X] OnSHKcalcTotalPrice
 [X] OnSHKcartLoad
 [X] OnSHKgetProductPrice
 [X] OnWebPageInit сомнительно
 [X] OnSiteSettingsRender
 
 Settings &priceId=ID Цены;int;2 &sales=Скидки;string;4:7000||7:15000||10:30000 &settings=Settings;textarea;Мин. сумма заказа~price_minimal||Стоимость доставки~price_delivery||Стоимость региональной доставки~price_region||Стоимость самовывоза~price_pickup||Купон~coupon||Минимальная маржа~minMargin||Максимальная маржа~maxMargin||Ценовой порог роста маржи~thresholdPrice
*/

$e = &$modx->Event;
if(empty($tvPriceId)) $tvPriceId = 1;
$modx->basePrice = $totalPrice;
if(empty($sales)) $sales = array();

$modx->short_txt_fields = array('delivery', 'payment', 'fullname', 'phone', 'email', 'comment', 'coupon', 'subscribe', 'register');

switch($e->name){
  case 'OnSHKgetProductPrice' :
      $newprice = $modx->getTemplateVarOutput(array('newprice'), $purchaseArray['shk-id'])['newprice'];
      $e->output($newprice>0?  $newprice : $price);
  break;
  case 'OnSHKcalcTotalPrice' : // Считаем сумму заказа. Расставляем плейсхолдеры
      if($modx->basePrice > 0 || defined("IN_MANAGER_MODE")){
        
          /*
          СКИДКА
          */
          if(isset($_REQUEST['shkct_discount']) && $_REQUEST['shkct_discount']!="") $discount = $_REQUEST['shkct_discount'];
          $discount = str_replace("%", "", $discount, $isPercent); // Если не введён купон то скидка = 0
          $isPercent ? $totalPrice *= 1-(intval($discount)/100) : $totalPrice -= intval($discount); // Перерасчет суммы заказа
        
          $sc = $modx->getFullTableName("site_content");
          /* * Расчет стоимости доставки */
          if(isset($_REQUEST['shkct_delivery'])) $_REQUEST['delivery'] = $_REQUEST['shkct_delivery']; // Для получения значения И в админке
          $delivery = $_REQUEST['delivery'] ? $_SESSION['delivery'] = $_REQUEST['delivery'] : $_SESSION['delivery']; // Приоритет у POST, а так берем у сессии
          switch($delivery){
              case 'pickup':
                  $delivery_id = $modx->db->getValue($modx->db->select("id", $sc, "template = 8 AND `menuindex` = " . (int)$_REQUEST['shkct_pickup']));
              break;
              case 'delivery': case 'delivery_region':
                  $delivery_id = $modx->db->getValue($modx->db->select("id", $sc, "template = 9 AND `pagetitle` = '" . $modx->db->escape($_REQUEST['shkct_city']) . "'"));
              break;
          }
          if(isset($delivery_id) && $delivery_id) $totalPrice += $modx->getTemplateVarOutput('price',$delivery_id)['price'];
      }
      $modx->totalPrice = $totalPrice;
      $e->output(round($modx->totalPrice));
  break;
  case 'OnSHKcalcTotalPrice1' : // Считаем сумму заказа. Расставляем плейсхолдеры
    //if($modx->basePrice > $modx->price_minimal || defined("IN_MANAGER_MODE")){
    if($modx->basePrice > 0 || defined("IN_MANAGER_MODE")){/*****ТЕСТ******/
      if($_REQUEST['subscribe']=='true') $_REQUEST['subscribe'] = 'Subscribers';
      if($_REQUEST['register']=='true') $_REQUEST['register']='1';
      foreach($modx->short_txt_fields as $f){
        if(isset($_REQUEST[$f]) && !empty($_REQUEST[$f])){
          $_SESSION[$f] = $_REQUEST[$f];
        }
      }
      
      /*
       * Расчет скидок
       */
      $isCoupon = $modx->getConfig('coupon') && isset($_SESSION['coupon']) && $_SESSION['coupon']==$modx->getConfig('coupon');
      
      if($isCoupon && isset($_SESSION['purchases']) && IN_MANAGER_MODE!='true'){
        $purchases = unserialize($_SESSION['purchases']);
        $totalPrice_ = 0;
        foreach($purchases as &$purchase){
          
          $tv = $modx->getTemplateVarOutput(array('discount'), $purchase[0]);
          $tv['discount'] = str_replace("%", "", $tv['discount'], $isPercent); // Если не введён купон то скидка = 0
          $isPercent ? $purchase[2] *= 1-($tv['discount']/100) : $purchase[2] -= $tv['discount']; // Считаем стоимость позиции с учетом скидки
          $totalPrice_+=$purchase[2] * $purchase[1];
        }
        $totalPrice = $totalPrice_;
      }
      //Если незаданы настройки купона, или купон не введён, или введён неверно, считаем обычную скидку: 
      if(!$isCoupon){
        if(!$discount){
          $nextDiscount = $discount = 0;
          $sales = explode("||",$sales);
          foreach($sales as $sale){
            list($salePercent, $saleValue) = explode(":", $sale);
            if($totalPrice > $saleValue){ // Если скидка срабатывает
              $discount = $salePercent; //...сохраняем величину скидки
            }
            else{ // Если не срабатывает то...
              $threshold = $saleValue - $modx->basePrice; // ...вычисляем сколько не хватает для скидки
              $nextDiscount = $salePercent; // ...сохраняем ближайшую величину скидки
              break;
            }
          }
        }
        if(isset($_REQUEST['shkct_discount']) && $_REQUEST['shkct_discount']!="") $discount = (int)$_REQUEST['shkct_discount'];

        //$discount = 0; //УБИРАТОР СКИДИКИ
        if($discount>0){
          $totalPrice *= (1-($discount/100)); // Перерасчет суммы заказа
          $totalPrice = round($totalPrice);
        }
        
        if((($modx->basePrice+$threshold)/2)<$modx->basePrice && $nextDiscount>0){
          $modx->setPlaceholder('saleInfo', '* При заказе еще на <b style="color:#444">'.$threshold.' руб.</b> Вы получите <b style="color:#444">'.$nextDiscount.'%</b> скидку.'); 
        }
      }

      if(($modx->basePrice)>$totalPrice){
        $modx->setPlaceholder('savings', 'Ваша скидка: <b>'.($modx->basePrice - $totalPrice).'</b> руб.'); 
      }
      
      /*
       * Расчет стоимости доставки
       */
      if(isset($_REQUEST['shkct_delivery'])) $_REQUEST['delivery'] = $_REQUEST['shkct_delivery']; // Для получения значения И в админке
      $delivery = $_REQUEST['delivery'] ? $_SESSION['delivery'] = $_REQUEST['delivery'] : $_SESSION['delivery']; // Приоритет у POST, а так берем у сессии
      switch($delivery){
        case 'delivery':
          $isDelivery = true;
          $totalPrice += $modx->getConfig('price_delivery');
          //$modx->basePrice += $modx->getConfig('price_delivery');
        break;
        case 'delivery_region':
          $isDelivery = true;
          $totalPrice += $modx->getConfig('price_region');
          //$modx->basePrice += $modx->getConfig('price_region');
        break;
        case 'pickup':
          $totalPrice += $modx->getConfig('price_pickup');
          //$modx->basePrice += $modx->getConfig('price_pickup');
        break;
      }
      
      // Ставим плейсхолдеры
      $totalPriceInfo = '';
      if($discount>0 || $isDelivery || $isCoupon) $totalPriceInfo .= ' с учетом';
      if($isDelivery) $totalPriceInfo .= ' доставки'; 
      if(($discount>0 || $isCoupon) && $isDelivery) $totalPriceInfo .= ' и';
      if($isCoupon) $totalPriceInfo .= ' <b>промо-купона</b>';
      if($discount>0) $totalPriceInfo .= " <span class='sale'>".$discount.'<span class="percent">%</span></span> скидки';
    }
    else{
      unset($_SESSION['delivery']);
      unset($_SESSION['payment']);
    }
    
    $modx->totalPrice = $totalPrice;
    $modx->setPlaceholder('totalPriceInfo', $totalPriceInfo);     
    $e->output($modx->totalPrice);
  break;

  case 'OnSHKcartLoad': // Пользовательские функции
  
   /************************
    * eFormOnBeforeFormParse - генерация формы (автоподстановка значений и проверка минимальной суммы заказа)
    */
    if(!function_exists('eFormOnBeforeFormParse')){//Перед выводом формы
      function eFormOnBeforeFormParse(&$fields,&$templates){
        global $modx;
        if($modx->basePrice > $modx->getConfig('minimal_order')){ //|| !isset($_SESSION['mgrValidated'])
          
        }elseif($modx->basePrice){
          echo '
          <div >
          <h3 style="text-align:center;margin:30px 0"><b>Внимание!</b> Минимальная сумма заказа без учета доставки - ' . $modx->getConfig('minimal_order') . ' руб.</h3>
          <p style="text-align:center;margin:30px 0">Для продолжения оформления заказа необходимо заказать еще на ' . ($modx->getConfig('minimal_order') - $modx->basePrice) . ' руб.</p>
          </div>
          ';
          return false;
        }else return false;
        if($modx->basePrice > 0 && !isset($_SESSION['mgrValidated'])) return false;
        
        $user = $modx->getWebUserInfo($_SESSION['webInternalKey']);
        
        //echo $modx->basePrice;die;
      }
    }
   /*****************
    * eFormOnValidate - валидация перед отправкой
    */
    if(!function_exists('eFormOnValidate')){
      function eFormOnValidate(&$fields, &$vMsg, &$rMsg){
        global $modx;
        if(empty($fields['email'])) $fields['email']='shop@TTstore.ru';
        // Читабельный номер телефона
        $fields['phone'] = preg_replace("~([0-9]{3})([0-9]{3})([0-9]{2})([0-9]{2})~", "+7 ($1) $2-$3-$4", preg_replace("~(^\+7)|(^8)|([^0-9])~", "", $fields['phone']));
      }
    }

   /****************************
    * sendOrderToManagerExtended
    */
    if(!function_exists('sendOrderToManagerExtended')){
      function sendOrderToManagerExtended(&$fields){
        global $modx;
        /**************\
         *  Pushover  *
        \**************
        $pushoverMessage .= $fields['fullname'].", ".$fields['phone'];
        $modx->db->insert(array('fields'=> serialize(array(
                'token'     => "dMwkRdi3OFFiUK7UZzzPXz9FYLk0hb",
                'user'      => "1R4OePklqXtJrbxtmRsdQI3ZZQuKnX",
                'title'     => '#'.$fields['orderID']." на ".$modx->totalPrice." руб.",
                'timestamp' => date("U"),
                'message'   => mysql_real_escape_string($pushoverMessage)
        ))),$modx->getFullTableName("manager_pushover"));
        //*/

        /************\
         *  SMS.RU  *
        \************
        if(isset($fields['phone'])){
          file_get_contents('http://sms.ru/sms/send?' . http_build_query(array(
            'api_id'  => '3e0b3b09-6c2b-d064-79e5-a4029ee22d41',
            'from'    => 'TTstore',
            'to'      => $fields['phone'],
            'text'    => 'Номер Вашего заказа: #'.$fields['orderID']."\r\n"."Сумма к оплате: ".$modx->totalPrice." руб."
          )));
        }//*/
        sendOrderToManager($fields);
      }
    }
  break;
  case 'OnSiteSettingsRender':
    $settingsArr = !empty($settings) ? explode('||',$settings) : array();
    $output = '</td></tr></table></div>
    <div style="display: block;" class="tab-page" id="tabPage8">
      <h2 class="tab">Настройки магазина</h2>
      <script type="text/javascript">tpSettings.addTabPage( document.getElementById( "tabPage8" ) );</script>
      <table border="0" cellpadding="3" cellspacing="0">';

    foreach($settingsArr as $key => $st_row){
        $st_label_arr = explode('~',$st_row);
        $custom_st_label = trim($st_label_arr[0]);
        $custom_st_name = isset($st_label_arr[1]) ? $st_label_arr[1] : 'custom_st';
        $custom_st_value = isset($st_label_arr[1]) && isset($modx->config[$st_label_arr[1]]) ? trim($modx->config[$st_label_arr[1]]) : '';
        $output .= '
          <tr>
            <td class="warning" nowrap="">'.$custom_st_label.'</td>
            <td><input type="text" value="'.$custom_st_value.'" name="'.$custom_st_name.'" style="width: 350px;" onchange="documentDirty=true;" /></td>
          </tr>
          <tr>
            <td colspan="2"><div class="split"/></td>
          </tr>';
    }
    $output .= '<tr><td colspan="2">';
    $e->output($output);
  break;
}
