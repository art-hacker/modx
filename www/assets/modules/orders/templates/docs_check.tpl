<section>

<div style='line-height:22px; position:absolute; right:0;'>&nbsp;от &nbsp;<u>&nbsp;&nbsp;&nbsp;[+expectdate+]&nbsp;&nbsp;&nbsp;</u> &nbsp;г.</div>
<h1>ТОВАРНЫЙ ЧЕК № [+id+]</h1>


<p>Продавец: <b>[(companyName)]</b></p>
<p>ОГРНИП <u>312507431900040</u> от 14 ноября 2012г. выдано в межрайонной инспекции федеральной налоговой службы №5 по М.О.</p>
<p>Св-во о пост. на учет <u>2398780</u> от 14 ноября 2012г. выдано в межрайонной инспекции федеральной налоговой службы №5 по М.О.</p>

<table class='price'>
<tr>
<td colspan="6"><b>ВНИМАНИЕ! Проверяйте комплектацию и внешний вид товара во время его получения.<Br/>Покупатель самостоятельно несет ответственность за внешний вид и комплектацию товара после приема его от продавца.</b></td>
</tr>
  <tr>
    <th style='width:13px'>№</th>
    <th style='width:640px'>Наименование товара</th>
    <th>Артикул</th>
    <th style='width:60px'>Кол-во</th>
    <th>Цена</th>
    <th>Сумма</th>
  </tr>
  [+tpl:items=`<tr class='[+delivery+]'>
    <td>[+index+]</td>
    <td data-deliveryName='[+deliveryName+]'>[+pagetitle+]</td>
    <td>[+alias+]</td>
    <td width='50'>[+ammount+] шт.</td>
    <td width='100'>[+number_format:price:2:,:+] руб.</td>
    <td width='100'>[+number_format:total:2:,:+] руб.</td>
  </tr>`+]
  <tr>
    <td style='border:none'></td>
    <td style='border:none'></td>
    <td style='border:none'></td>
    <td style='border:none; text-align:right'>Итого</td>
    <td><b>[+number_format:price:2:,:+] руб.</b></td>
  </tr>
</table>

<table style='margin-top:52px;'>
<tr>
  <td>Итого</td><td width='65%' class='borderBot' style='text-align:center; border-bottom:1px solid'>[+numberToText:price+]</td>
  <td>&nbsp;&nbsp;</td><td width='15%' style='text-align:center; border-bottom:1px solid'>&nbsp;<small>Подпись</small></td>
  <td>&nbsp;&nbsp;</td><td width='20%' style='text-align:center; border-bottom:1px solid'>Сигуля Н. М.<small>Расшифровка</small></td>
</tr>
<tr>
<td></td><td></td><td></td><td><br/><br/>М.П.</td><td></td><td></td><td></td>
</tr>
</table>
</section>