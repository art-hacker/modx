<form method="post" onsubmit="" target="_blank" action="iml/ajax-handler.php">
    <table>
    <tr><td colspan='6' style='border:none'>
        <img src='http://iml.ru/static/main/img/iml-logo-s.png'/><br/><br/>
    </td>
    <td colspan="6" style='border:none; padding:0'><div id='log' style='height:140px; overflow-y:auto'></div></td></tr>
      <tr>
          <th>№</th>
          <th colspan='3'>Дата и время</th>
          <th>Город</th>
          <th>Адрес/ПВЗ</th>
          <th>Имя</th>
          <th>Телефон</th>
          <th>Сумма</th>
          <th>Заметка</th>
          <th>Услуга</th>
          <th>Мест</th>
      </tr>
      [+inner+]
      <tr><td colspan='12' style='padding:0;'><button>Отправить</button></td></tr>
    </table>
</form>
<script>
(function(d,w,u){
    d.addEventListener("DOMContentLoaded", function(e) { 
        var items = d.getElementsByTagName("td");
        var button = d.getElementsByTagName('button')[0];
        
        d.forms[0].addEventListener("submit", function(e) {
            e.preventDefault();
            if(confirm("Внимание!\nПодтвердите отправку заявок курьерской службе «IML».\nНе напортачь :)")){
                button.disabled="disabled";
                button.innerHTML='Отправка данных...';
                var xmlhttp = getXmlHttp(); // Создаём объект XMLHTTP
                xmlhttp.open('POST', 'ajax-handler.php'); // Открываем асинхронное соединение
                xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // Отправляем кодировку
                xmlhttp.setRequestHeader('X-REQUESTED-WITH', 'XMLHttpRequest');
                xmlhttp.send("action=iml&"+serialize(this)); // Отправляем POST-запрос
                xmlhttp.onreadystatechange = function() { // Ждём ответа от сервера
                  if(xmlhttp.readyState == 4){ // Ответ пришёл
                    if(xmlhttp.status == 200) { // Сервер вернул код 200 (что хорошо)
                        try{ var json = JSON.parse(xmlhttp.responseText); }
                        catch(e){ var json = {"error":["Error catched: "+e]} }

                        if(json.error===u){
                            button.innerHTML = 'Заявки отправлены без ошибок! Можно закрыть страницу.';
                            button.className = "success";
                        }else{
                            button.innerHTML = 'Устраните ошибки для повторной отправки.';
                            button.className = "error";
                            for(i in json.error){
                                d.getElementById('log').innerHTML += "<p>Ошибка!\nЗаказ #"+i+": "+json.error[i]+"</p>";
                            }
                        };
                    }else alert(xmlhttp.responseText);
                  }
                };
            }
        })
        
        
    });
})(document,window)
function serialize (form) {
    if (!form || form.nodeName !== "FORM") {
            return;
    }
    var i, j, q = [];
    for (i = form.elements.length - 1; i >= 0; i = i - 1) {
            if (form.elements[i].name === "") {
                    continue;
            }
            switch (form.elements[i].nodeName) {
            case 'INPUT':
                    switch (form.elements[i].type) {
                    case 'text':
                    case 'hidden':
                    case 'password':
                    case 'button':
                    case 'reset':
                    case 'submit':
                            q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                            break;
                    case 'checkbox':
                    case 'radio':
                            if (form.elements[i].checked) {
                                    q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                            }                                               
                            break;
                    }
                    break;
                    case 'file':
                    break; 
            case 'TEXTAREA':
                    q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                    break;
            case 'SELECT':
                    switch (form.elements[i].type) {
                    case 'select-one':
                            q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                            break;
                    case 'select-multiple':
                            for (j = form.elements[i].options.length - 1; j >= 0; j = j - 1) {
                                    if (form.elements[i].options[j].selected) {
                                            q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].options[j].value));
                                    }
                            }
                            break;
                    }
                    break;
            case 'BUTTON':
                    switch (form.elements[i].type) {
                    case 'reset':
                    case 'submit':
                    case 'button':
                            q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                            break;
                    }
                    break;
            }
    }
    return q.join("&");
}
function getXmlHttp() {
    var xmlhttp;
    try {
      xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
    try {
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } catch (E) {
      xmlhttp = false;
    }
    }
    if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
      xmlhttp = new XMLHttpRequest();
    }
    return xmlhttp;
}
</script>