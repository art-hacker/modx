<div class="tab-page" id="status[+id+]" data-id="[+id+]" data-hidden=[+hidden+]>
  <h2 class="tab" title='[+description+]'>[+name+] <small>[+count+]</small></h2>
  <script type="text/javascript">tpPane.addTabPage( document.getElementById( "status[+id+]" ) );</script>
    <div class='actions'>
      <button disabled="" class='single' name="action" title="Отправить SMS клиенту" value="sms"><i class='icon sms'></i></button>
      <button disabled="" class='single' name="action" title="Написать на почту клиенту" value="mail"><i class='icon mail'></i></button>
      <button disabled="" class='single' name="action" title="Накладная" value="torg12">Накладная</button>
      <button disabled="" class='single' name="action" title="Выставить счет" value="bill">Счет</button>
      <button disabled="" class='multi' name="action" title="Штрихкода" value="barcode"><i class='icon barcode'></i></button>
      <button disabled="" class='multi' name="action" title="Заявки" value="iml"><i class='icon iml'></i></button>
      <button disabled="" class='multi' name="action" title="Печать чеков" value="check"><i class='icon check'></i></button>
      <button disabled="" class='multi' name="action" title="Печать актов" value="act">Акты</button>
    </div>
    
    <h3>Сумма: <b>[+number_format:totalPrice:0::,+]</b> руб. Заказов [+count+]</h2>
  <table class='orders'>
    <tr>
      <th>ID</th>
      <th>Клиент</th>
      <th>Город</th>
      <th class='dates'>Дата</th>
      <th>Состав заказа</th>
      <th>Сумма</th>
      <th>Ифно</th>
      <th class='orderCheckbox'>
        <input type="checkbox" id="status_[+id+]"/>
        <label for="status_[+id+]"></label>
      </th>
    </tr>
    [+orders+]
  </table>
  <div class='loadMore'>
    <form>
      <button>Загрузить еще</button> 
      <input type='radio' name="loadMore" value="50"  id="loadMore[+id+]50" checked /><label for="loadMore[+id+]50">50</label>
      <input type='radio' name="loadMore" value="100" id="loadMore[+id+]100"/><label for="loadMore[+id+]100">100</label>
      <input type='radio' name="loadMore" value="500" id="loadMore[+id+]500"/><label for="loadMore[+id+]500">500</label>
    </form>
  </div>
</div>
