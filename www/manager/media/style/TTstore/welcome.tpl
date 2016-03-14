<!-- welcome -->
<div style="margin: 20px 12px;">
	<script type="text/javascript" src="media/script/tabpane.js"></script>
	<!--script type="text/javascript" src="jquery.autosize.min.js"></script-->
	<div class="tab-pane" id="welcomePane" style="border:0">
    <script type="text/javascript">
        tpPane = new WebFXTabPane(document.getElementById( "welcomePane" ),false);
    </script>
		<!-- home tab -->
		<div class="tab-page" id="tabhome" style="padding-left:0; padding-right:0;">
[+OnManagerWelcomePrerender+]			
			<h2 class="tab">[+site_name+]</h2>
			<script type="text/javascript">tpPane.addTabPage( document.getElementById( "tabhome" ) );</script>
      <table width="100%"><tr valign="top">
      <td>
			<div class="sectionHeader">Меню</div>
			<div class="sectionBody">
        [+OnManagerWelcomeHome+]
        <a class='menu orders' href='index.php?a=112&id=3' target="_blank">Заказы</a>
        <a class='menu iml' href=''>iml</a>
        <a class='menu buh' href=''>iml</a>
        <a class='menu call' href=''>Звонки</a>
        <a class='menu sms' href=''>sms.ru</a>
        <a class='menu fornex' href=''>fornex.com</a>
			</div>
      <div class='menutab four'> 
        <div class="sectionHeader">Посещаемость</div>
        <div class="sectionBody">
          <ul>
            <li><h2 style='margin:0'>Сегоня: <b>100</b></h2></li>
            <li>За неделю: <b>100</b></li>
            <li>За месяц: <b>1000</b></li>
          </ul>
        </div>
      </div><div class='menutab four'> 
        <div class="sectionHeader">Конверсия</div>
        <div class="sectionBody">
          <ul>
            <li><h2 style='margin:0'>Сегоня: <b>4% (1)</b></h2></li>
            <li>За неделю: <b>3% (29)</b></li>
            <li>За месяц: <b>7% (100)</b></li>
          </ul>
        </div>
      </div><div class='menutab four'> 
        <div class="sectionHeader">Звонки за сегодня</div>
        <div class="sectionBody">
          <ul>
            <li><h2 style='margin:0'>Сигуля Н.М.: <b>10</b></h2></li>
            <li>Федотов: <b>8</b></li>
            <li>Байдин: <b>8</b></li>
          </ul>
        </div>
      </div><div class='menutab four'> 
        <div class="sectionHeader">Аварийное сообщение</div>
        <div class="sectionBody">
          <textarea></textarea>
          <Br/><input type='submit'/>
        </div>
      </div><div class='menutab three'> 
        <div class="sectionHeader">Безант М</div>
        <div class="sectionBody">
          <ul>
            <li><h2 style='margin:0'>Баланс: <b>10 124 руб.</b></h2></li>
            <li>Скидка: <b>14%</b></li>
            <li>Оборот: <b>81241 руб.</b></li>
          </ul>
        </div>
      </div><div class='menutab three'> 
        <div class="sectionHeader"><a target="_blank" href='http://wikimart.ru/my/seller/orders/opened/'>Викимарт</a></div>
        <div class="sectionBody">
          <ul>
            <li><h2 style='margin:0'>Баланс: <b>10 000 руб</b></h2></li>
            <li>Заказов: <b>34</b></li>
            <li>Комиссия: <b>3 400 руб.</b></li>
          </ul>
        </div>
      </div><div class='menutab three'> 
        <div class="sectionHeader">.</div>
        <div class="sectionBody">
        </div>
      </div>
      </td>
      <td class='rightcol'>
        <div class="sectionBody">
          <h2 style='margin:0 10px; line-height:32px'><img style='margin-right:10px' src='media/style/[+theme+]/images/user.png'/> Байдин А. Г. <a target="_top" style='float:right' href='index.php?a=8'>Выход</a></h2>
        </div>
        <div class="sectionHeader">Поиск товара</div>
        <div class="sectionBody">
          <form>
            <input type='text' style="width:100%; box-sizing : border-box; margin-right:-55px; font:17px Arial; padding:15px 5px"/>
            <input type='submit' value="Найти" style="margin:0; padding:17px 7px"/>
          </form>
        </div>
        <div class="sectionHeader">Новые заказы</div>
        <div class="sectionBody">
          [+neworders+]
        </div>
        <div class="sectionHeader">Заметки</div>
        <div class="sectionBody">
          <textarea class="autosize"></textarea>
        </div>
        <div class="sectionHeader">Полезная информация</div>
        <div class="sectionBody">
          [+userfull+]
        </div>
        
        </td>
      </tr></table>
      <script>
        (function(){
          var div = document.createElement('div');
          var textarea = document.getElementsByClassName("rightcol")[0].getElementsByTagName("textarea")[0];
          textarea.parentNode.appendChild(div);
          
          div.style.cssText = getComputedStyle(textarea).cssText;
          div.style.height="";
          div.style.position="absolute";
          div.style.visibility="hidden";
          
          var areaListner;
          textarea.onblur = function(){if(typeof areaListner!=="undefined") clearInterval(areaListner);}
          textarea.onkeydown = function(e){
            areaListner = setInterval(function(){
                /*var text="";
                textarea.value.split("\n").each(function(s){
                  text+=s+"<br/>";
                });
                div.innerHTML = text;*/
                div.innerHTML = textarea.value.replace(/\n/,"<br/>")+"<br/>";
                var height = div.offsetHeight;
                height = Math.min("250", height);
                textarea.style.height = height+"px";
            },1);
          }
          
        })()
      </script>
    </div>
		
		<!-- system check -->
		<div class="tab-page" id="tabcheck" style="display:[+config_display+]; padding-left:0; padding-right:0;">
			<h2 class="tab" style="display:[+config_display+]"><strong style="color:#ffeb00;">[+settings_config+]</strong></h2>
			<script type="text/javascript"> if('[+config_display+]'=='block') tpPane.addTabPage( document.getElementById( "tabcheck" ) );</script>
			<div class="sectionHeader">[+configcheck_title+]</div>
			<div class="sectionBody">
				<img src="media/style/[+theme+]/images/icons/error.png" />
				[+config_check_results+]
			</div>
		</div>
		
		<!-- modx news -->
		<div class="tab-page" id="tabNews" style="padding-left:0; padding-right:0">
			<h2 class="tab">[+modx_news+]</h2>
			<script type="text/javascript">tpPane.addTabPage( document.getElementById( "tabNews" ) );</script>
			<div class="sectionHeader">[+modx_news_title+]</div><div class="sectionBody">
				[+modx_news_content+]
			</div>
		</div>	

		<!-- security notices -->
		<div class="tab-page" id="tabSecurityNotices" style="padding-left:0; padding-right:0">
			<h2 class="tab">[+modx_security_notices+]</h2>
			<script type="text/javascript">tpPane.addTabPage( document.getElementById( "tabSecurityNotices" ) );</script>
			<div class="sectionHeader">[+modx_security_notices_title+]</div><div class="sectionBody">
				[+modx_security_notices_content+]
			</div>
		</div>

		<!-- recent activities -->
		<div class="tab-page" id="tabAct" style="padding-left:0; padding-right:0">
			<h2 class="tab">[+recent_docs+]</h2>
			<script type="text/javascript">tpPane.addTabPage( document.getElementById( "tabAct" ) );</script>
			<div class="sectionHeader">[+activity_title+]</div><div class="sectionBody">
				[+RecentInfo+]
			</div>
		</div>

		<!-- user info -->
		<div class="tab-page" id="tabYour" style="padding-left:0; padding-right:0">
			<h2 class="tab">[+info+]</h2>
			<script type="text/javascript">tpPane.addTabPage( document.getElementById( "tabYour" ) );</script>
			<div class="sectionHeader">[+yourinfo_title+]</div><div class="sectionBody">
				[+UserInfo+]
			</div>
		</div>

		<!-- online info -->
		<div class="tab-page" id="tabOnline" style="padding-left:0; padding-right:0">
			<h2 class="tab">[+online+]</h2>
			<script type="text/javascript">tpPane.addTabPage( document.getElementById( "tabOnline" ) );</script>
			<div class="sectionHeader">[+onlineusers_title+]</div><div class="sectionBody">
				[+OnlineInfo+]
			</div>
		</div>
[+OnManagerWelcomeRender+]
	</div>
</div>