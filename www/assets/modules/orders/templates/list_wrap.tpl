<!DOCTYPE html>
<head>
  <meta charset="[(modx_charset)]"/>
  <meta name="robots" content="noindex, nofollow"/>
  <title>Заказы - (MODX CMS Manager)</title>
  <!--base href="[(site_url)][+module_path+]/" /-->
  <base href="[(site_url)][+module_path+]/" />
  <link rel="stylesheet" type="text/css" href="assets/style.css" />
  <link rel="icon" href="assets/icons/orders.ico" type="image/x-icon" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="assets/script.js"></script>
  <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1' />
</head>
<body>
<form method="get" target="_blank" action="index.php">
  <div style="margin: 20px 12px;">
    <div class='filter'>
      <table>
        <tr>
        <th>Номер заказа</th>
        <th>Статус</th>
        <th>Способ оплаты</th>
        <th>Прочее</th>
        <th></th>
        <tr>
            <td><input name='order_id' value=""/></td><td>
              <select name='status'>
                  <option value=''>-</option>
                  <option value='1'>Новый</option>
                  <option value='2'>Подтверждён</option>
                  <option value='3'>Собран</option>
                  <option value='4'>Отправлен</option>
                  <option value='5'>Выполнен</option>
                  <option value='6'>Отказ</option>
                  <option value='7'>Отклонен</option>
                  <option value='8'>Отложен</option>
              </select>
            </td><td>
              <select name='payment'>
                  <option value=''>-</option>
                  <option value='bill'>Наличные</option>
                  <option value='cash'>Счет</option>
                  <option value='online'>Онлайн</option>
              </select>
            </td><td>
              <input name='info' value=""/>
            </td>
        </tr>
      </table>
    </div>
    <div class="tab-pane" id="statuses" style="border:0">
      <script type="text/javascript">tpPane = new WebFXTabPane(document.getElementById( "statuses" ),true);</script>
        [+inner+]
    </div>
  </div>
</form>
</body>
