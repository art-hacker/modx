<form method='post' class='status[+status+]' tabindex="0">
<div class="tab-pane" id="order_[+id+]_view" style="border:0">
    <div class="tab-page viewOrder">
        <h2 class="tab" >Инфо</h2>
        <table>
            <tr>
                <th>Клиент</th>
                <td>[+fullname+] - <a href='tel:[+phone+]'>[+phone+]</a></td>
            </tr>
            <tr class='delivery'>
                <th>Способ получения</th>
                <td><span class='[+delivery+]'><span class='city'><b>[+city+]</b></span><span class='pvz'>[+pickup+]</span></span></td>
            </tr>
            <tr class='payment'>
                <th>Способ оплаты</th>
                <td><span class='[+payment+]'></span></td>
            </tr>
            <tr class='address [+delivery+]'>
                <th>Адрес</th>
                <td>[+address+][+pickup_address+]</td>
            </tr>
            <tr>
                <th>Заметка</th>
                <td>[+note+]</td>
            </tr>
            <tr>
                <th>Дата доставки</th>
                <td>[+sentdate+], [+time+]</td>
            </tr>
            <tr>
                <th>Скидка</th>
                <td>[+discount+]</td>
            </tr>
            <tr>
                <th>Источник</th>
                <td>[+sourse+] [+tracking_num+]</td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr><td colspan="2">
                <table class='items list'>
                  <tr>
                    <th>Актикул</th>
                    <th>Наименование</th>
                    <th>Кол</th>
                    <th>Сумма</th>
                  </tr>
                  [+items+]
                  <tr><td></td><td></td><td></td><td><b>[+price+] руб.</b></td></tr>
                </table>
            </td></tr>
        </table>
    </div>
    <div class="tab-page editOrder">
        <h2 class="tab" >Редактировать</h2>
            <input type='hidden' name='item_id' value='[+id+]'/>
            <input type='hidden' name='tracking_num' value='[+tracking_num+]' />
            <input type='hidden' name='add_prod_params' value=''/>   
            <input type='hidden' name='shkct_sourse' value='[+sourse+]'/>
            <table>
              <tr><th>Клиент:</th><td><input type='text' name='shkct_fullname' value='[+fullname+]'/><label><input name='shkct_company' [+company_1_checked+] value="1" type='checkbox'/><span>Организация</span></label></td></tr>
              <tr><th>Контакты:</th><td><input type='text' name='phone' value='[+phone+]'/><input type='text' name='email' value='[+email+]'/></td></tr>
              <tr><th>Статус:</th><td>
                  <select name='status_id'>
                      <option [+status_1_selected+] value='1'>Новый</option>
                      <option [+status_2_selected+] value='2'>Подтвеждён</option>
                      <option [+status_3_selected+] value='3'>Собран</option>
                      <option [+status_4_selected+] value='4'>Отправлен</option-->
                      <option [+status_5_selected+] value='5'>Выполнен</option>
                      <option [+status_6_selected+] value='6'>Отказ</option>
                      <option [+status_7_selected+] value='7'>Отклонен</option>
                      <option [+status_8_selected+] value='8'>Отложен</option>
                  </select>
              </td></tr>
              <tr><th>Оплата:</th><td>
                  <select name='payment'>
                      <option [+payment_cash_selected+] value='cash'>Наличными</option>
                      <option [+payment_bill_selected+] value='bill'>По счету</option>
                      <option [+payment_online_selected+] value='online'>Онлайн</option>
                  </select>
              </td></tr>
              <tr><th>Доставка:</th><td>
                    <select name='shkct_delivery'>
                        <option [+delivery_delivery_selected+] value='delivery'>Курьером</option>
                        <!--option [+delivery_delivery_region_selected+] value='delivery_region'>В регион</option-->
                        <option [+delivery_pickup_selected+] value='pickup'>Самовывоз</option>
                    </select>
              </td></tr>
              <tr><th>ПВЗ:</th><td><input type='text' name='shkct_pickup' value='[+pickup+]'/></td></tr>
              <tr><th>Скидка:</th><td><input type='text' name='shkct_discount' value='[+discount+]'/></td></tr>
              <tr><th>Город:</th><td><input type='text' name='shkct_city' value='[+city+]'/></td></tr>
              <tr><th>Адрес:</th><td><textarea name='shkct_address'>[+address+]</textarea></td></tr>
              <tr><th>Заметка:</th><td><textarea name='note'>[+note+]</textarea></td></tr>
              <tr><th>Дата получения:</th><td>
                  <input type='date' name='shkct_expectdate' value='[+expectdate+]'/><input type='text' name='shkct_senttime' value='[+senttime+]'/>
              </td></tr>
              <tr><td colspan="2">&nbsp;</td></tr>
              <tr><td colspan="2">
                <table class='items list'>
                    <tr>
                      <th></th>
                      <th>Наименование</th>
                      <th>шт</th>
                      <th>Цена</th>
                      <th></th>
                    </tr>
                    [+items+]
                    <tr class='edit'>
                      <td colspan="2">
                        <input type='text' name='add_prod_alias' value=''/>
                      </td>
                      <td>
                        <input type='text' name='add_prod_count' value='1'/>
                      </td>
                    </tr>
                </table>
              </td></tr>
              <tr><td>Итого [+price+] руб.</td></tr>
            </table>
    </div>
    <div class="tab-page editOrder companyOrder">
        <h2 class="tab" data-company="">Данные компании</h2>
            <table>
              <tr><th>Название:</th><td><input type='text' name='shkct_companyName' value='[+companyName+]'/></td></tr>
              <tr><th>Адрес:</th><td><textarea name='shkct_companyAddress'>[+companyAddress+]</textarea></td></tr>
              <tr><th>ИНН/КПП:</th><td><input type='text' name='shkct_companyInn' value='[+companyInn+]'/><input type='text' name='shkct_companyKpp' value='[+companyKpp+]'/></td></tr>
              <tr><th>Р/С:</th><td><input type='text' name='shkct_companyRs' value='[+companyRs+]'/></td></tr>
              <tr><th>Банк:</th><td><input type='text' name='shkct_companyBank' value='[+companyBank+]'/></td></tr>
              <tr><th>К/С:</th><td><input type='text' name='shkct_companyKrs' value='[+companyKrs+]'/></td></tr>
              <tr><th>БИК:</th><td><input type='text' name='shkct_companyBik' value='[+companyBik+]'/></td></tr>
            </table>
    </div>
    <div class="tab-page historyOrder">
        <h2 class="tab" >История</h2>
          [+status_history+]
    </div>
</div>
<div class='actions'>
  <input type='radio' name='status_id_clone' id='order[+id+]confirm' value='2'/> <label for='order[+id+]confirm'>Подтвердить</label><span> или </span>
  <input type='radio' name='status_id_clone' id='order[+id+]reject' value='7'/> <label for='order[+id+]reject'>Отменить</label><span> и </span>
  <button  name='action' value='save_purchases'>Сохрнанить</button>
</div>
<button class="close" title="Закрыть">Закрыть</button>
</form>