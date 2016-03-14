<section>
<textarea style='width:100%; text-align:center; padding:10px;box-sizing:border-box;resize:none; font:20px Arial;' readonly=""rows="1" onclick="this.select();">[+filePath+]</textarea>    
<table>
    <tr>
    <td>
      <img src='assets/images/logo.svg'/>
      <span style='font:24pt/18pt impact; margin-left:-10px;'>store</span><span style='font:15pt impact; color:#ccc'>.ru</span>
      <div style='font:12pt/8pt impact; color:#ccc; letter-spacing:-.7px; margin-left:16px'>тематические товары</div>
      
    </td>
    <td style='vertical-align:middle; width:310px; color:#ccc; padding-right:0;'>
    <div style='border:1px solid; padding:14px; background:#fcfcfc'>
    [(companyName)]<br/>
    [(companyAddress)]
    <br/>
    Тел.: +7 (909) 910-02-04<br/>
    E-mail: shop@ttstore.ru
    </div>
    </td>
    </tr>
</table>
<br/>
<table class='border'>
  <tr>
      <td width="190">ИНН 503613621775</td>
      <td width="190">ОГРНИП 312507431900040</td>
      <td rowspan="2">Сч. №</td>
      <td rowspan="2">40802810600030001121</td>
  </tr>
  <tr>
    <td colspan="2">Получатель<br/><b>ИП Сигуля Наталья Михайловна</b></td>
  </tr>
  <tr>
      <td width="380" colspan="2" rowspan="2" valign="top">
      Банк получателя<br/><b>ОАО АКБ "АВАНГАРД" г. Москва</b></td>
      <td>БИК</td>
      <td>044525201</td>
  </tr>
  <tr>
      <td valign="top">Сч. №</td>
      <td valign="top">30101810000000000201</td>
  </tr>
</table>

<hr/>

<h1>СЧЕТ НА ОПЛАТУ № [+id+] от [+now+]г.</h1>
<table>
  <tr>
    <td>Исполнитель:</td>
    <td><b>[(companyName)], [(companyAddress)]</b></td>
  </tr>
  <tr>
    <td>Заказчик:</td>
    <td><strong>[+companyName+], [+companyAddress+]</strong></td>
  </tr>
</table>
<br/>
<table class='border'>
  <tr>
      <td width="20" align="center">№</td>
      <td width="290" align="center">Наименование товара</td>
      <td style="text-align: center;" width="27">Кол-во</td>
      <td width="50" align="center">Цена</td>
      <td width="50" align="center">Сумма</td>
  </tr>
  [+tpl:items=`<tr>
    <td>[+index+]</td>
    <td>[+pagetitle+]</td>
    <td>[+ammount+] шт.</td>
    <td align="right">[+number_format:price:2:,:+] руб.</td>
    <td align="right">[+number_format:total:2:,:+] руб.</td>
  </tr>`+]
  <tr>
    <td align="right" colspan="4" style='border-left:none; border-bottom:none'>Итого:</td>
    <td width="100" align="right">[+number_format:price:2:,:+] руб.</td>
  </tr>
  <tr>
    <td align="right" colspan="4" style='border-left:none; border-bottom:none; border-top:none'>Без налога (НДС):</td>
    <td width="100" align="center"> - </td>
  </tr>
  <tr>
    <td align="right" colspan="4" style='border-left:none; border-bottom:none; border-top:none'><b>Всего к оплате:</b></td>
    <td align="right"><b>[+number_format:price:2:,:+] руб.</b></td>
  </tr>
</table>

<p>Всего наименований: [+totalIndex+] ([+numberToText:totalIndex::+]), на сумму [+number_format:price:2:,:+] (<span class='toPhrase currency'>[+numberToText:price+]</span>)</p>

<table style='margin-top:45px;'>
  <tr>
    <td width="80" valign="top">Руководитель</td>
    <td width="255" valign="top">
      <img class='print_max' src="[(site_url)]/ttstore/assets/modules/orders/assets/images/stamp.png"/>
      <div class="name">Сигуля Н. М.</div>
    </td>
    <td width="180" align="right">Главный бухгалтер</td>
    <td width="255">
      <img class='print_max' src="[(site_url)]/ttstore/assets/modules/orders/assets/images/sign.png"/>
      <div class="name" style="padding-top:13px">Сигуля Н. М.</div>
    </td>
  </tr>
</table>
</section>