jQuery(function($){
  jQuery.fx.off = true
  var loading = $('<div/>',{"id":"preLoader"}).html('<table width="100%" border="0" cellpadding="0"><tr><td align="center"><div class="preLoaderText"><p>Пожалуйста, подождите...</p></div></td></tr></table>').prependTo('body').hide(),
      tpl,
      xhrTimeout,
      xhrGetOrder;

  $.ajaxSetup({
    "url" : "ajax-handler.php", "dataType" : "json", "type" : "POST", "cache" : true,
    "error":function(jqHR,textStatus,errorThrown){
        console.log(textStatus);
        console.log(errorThrown);
        console.log(jqHR);
    },
    "beforeSend" : function(){
        if(xhrGetOrder){xhrGetOrder.abort();}
        if(xhrTimeout!=undefined) clearTimeout(xhrTimeout);
        xhrTimeout = setTimeout(function(){ loading.show();   },300);
        
    },
    "complete" : function(){
        if(xhrTimeout!=undefined) clearTimeout(xhrTimeout);
        loading.hide();
    },
    "success" : function(data){ 
        $('#status'+data.request.status_id).find('.loadMore').toggle(data.orders.length==data.request.display); // Показывать/скрыть кнопку "Загрузить еще"
        $.each(data.orders, function(k,order){
            order.items="";
            $.each(order.content, function(k,item) {
                order.items+=$.setPlaceholders(tpl.orderItem, item);
            });
            $($.setPlaceholders(tpl.order,order).replace(/\[\+(.*?)\+\]/g,"")).insertAfter('#status'+(data.request.status_id=="all"?"all":order.status)+' .orders>tbody>tr:last')
                .find('big b').number_format(0,""," ").end()
                .find('.items').parent().filter(function(){return $('tr', this).length>=10}).each(function(){
                    var thiz = this;
                    var text = "Показать <b>("+$('tr', this).length+")</b>";
                    $(thiz).toggleClass('hidden').append($('<div/>',{"class":"showItems","html":text,"click":function(){$(thiz).toggleClass('hidden'); $(this).html($(this).html()==text?"Скрыть":text);}}));
                })
                /* $(orderOutput).insertAfter(request['firstRequest']?'#status'+order.status+' tr:first':'.tab-page:visible tr:first').clone().insertAfter($('#statusall tr').filter(function(){if($(this).index()==0){return true;} else{ return parseInt($(this).data('index')) > order.id;}}).last())*/;
            $('#statusall .orders_actions button, #statusall .orderCheckbox').remove();
        });
    }
  });
  
  // Запрашиваем шаблоны
  $.ajax({
    "data":{"action":"getTpl"}, "beforeSend" : null, "complete" : null,
    "success":function(tplData){
      tpl = tplData;
      $.ajax(); // Запрашиваем первые заказы (статусы hidden=0)
      if($('.tab-page:visible').data('hidden')==1) $('.tab.selected').trigger('click'); // Если мы на вкладке статуса hidden=1, то делаем доп. запрос по этой вкладке
    }
  });

  /*
   * Кнопка загрузить еще
   */
  $('.loadMore button').on("click",function(e){
      e.preventDefault();
      var button = this;
      var tab = $(this).parents('.tab-page');
      var data = {
            "status_id":tab.data('id'),
            "start" : $('.orders>tbody>tr:has(td)',tab).length,
            "display" : $(this).siblings('input:checked').val(),
      };
      if(tab.data('id')=='all') data = $.extend(data,$(this).parents('form').serializeObject());
      xhrGetOrder = $.ajax({
          "data":data,
          "beforeSend":function(){
            button.disabled=true;
            $.ajaxSetup().beforeSend();
          },
          "complete":function(){
            button.disabled=false;
            $.ajaxSetup().complete();
          },
      });
  });


  /*
   * Просмотр заказа
   */
  var ordersWindow = {};
  $('.orders').on('click', '.id a', function(e){
    e.preventDefault();
    var orderId = $(this).text();
    if(ordersWindow[orderId]==undefined){
        $.ajax({"data":{"action":"viewOrder", "item_id": orderId}, "success": function (data){
            var thiz = this;
            var lastFocus;
            data.order.items = "";
            $.each(data.order.content, function(k,item) {data.order.items+=$.setPlaceholders(tpl.viewOrderItem, item);});
            if(ordersWindow[orderId]){
                $('section', ordersWindow[orderId]).html($.setPlaceholders(tpl.viewOrder, data.order).replace(/\[\+(.*?)\+\]/g,"")).trigger('update_fields');
            }
            else{
              ordersWindow[orderId] = $.popupWindow('Подробности заказа #'+orderId, $.setPlaceholders(tpl.viewOrder, data.order).replace(/\[\+(.*?)\+\]/g,""))
              .on("change","form",function(e){
                  $(ordersWindow[orderId]).addClass("changed");
                  $(this).trigger('update_fields');

                  if($(e.target).is("[name=status_id]")){
                    $("input[name=status_id_clone]", this).removeAttr("checked").filter("[value=" + $(e.target).val() + "]").attr("checked","");
                  };
                  if($(e.target).is("[name=status_id_clone]")){
                    $('select[name=status_id]',this).val($(e.target).val());
                  };
              })
              .on("keydown","form",function(e){ // что б keydown работал не только на полях на теге form нужен аттрибут tabindex=1
                  var letter = String.fromCharCode(e.which).toLowerCase();
                  if(e.ctrlKey && letter=='s') {
                      e.preventDefault();
                      $('form',ordersWindow[orderId]).submit();
                  }
              })
              .on("keydown","input,textarea",function(e){
                  var letter = String.fromCharCode(e.which).toLowerCase();
                  console.log(letter);
                  if(/\w/.test(letter)) $('form',ordersWindow[orderId]).trigger("change");
              })
              .on("submit","form",function(e){
                  e.preventDefault();
                  $('.viewOrder input',this).remove();
                  $.ajax({
                    "data": $.extend({"action":"saveOrder"},$(this).serializeObject()),
                    "success":function(data){
                      thiz.success(data);
                      var order = data.order;
                      order.items="";
                      $.each(order.content, function(k,item) {
                          order.items += $.setPlaceholders(tpl.orderItem, item);
                      });
                      $($.setPlaceholders(tpl.order,order).replace(/\[\+(.*?)\+\]/g,"")).replaceAll('.orders tr[data-id='+orderId+']')
                          .find('big b').number_format(0,""," ").end()
                          .find('.items').parent().filter(function(){return $('tr', this).length>=10}).each(function(){
                              var thiz = this;
                              var text = "Показать <b>("+$('tr', this).length+")</b>";
                              $(thiz).toggleClass('hidden').append($('<div/>',{"class":"showItems","html":text,"click":function(){$(thiz).toggleClass('hidden'); $(this).html($(this).html()==text?"Скрыть":text);}}));
                          })
                      $('#statusall .orders_actions button, #statusall .orderCheckbox').remove();
                      $(ordersWindow[orderId]).removeClass("changed");
                      $('.actions input',this).removeAttr("checked");
                    }
                  });
              })
              .on("update_fields",function(e){
                  var isPickup = $('[name=shkct_delivery]',this).val()=="pickup";
                  $('[name=shkct_address],[name=shkct_city]',this).closest('tr').toggle(!isPickup);
                  //$('[name=shkct_senttime]',this).toggle(!isPickup);
                  $('[name=shkct_pickup]',this).closest('tr').toggle(isPickup);

                  var isCompany = $('[name=shkct_company]:checked',this).val();
                  $('.tab[data-company]').css({"display":(isCompany?"inline-block":"none")});
              }).trigger('update_fields')
              .on("click",".close",function(e){
                  e.preventDefault();
                  ordersWindow[orderId].detach();
                  $('.popupWindow.inactive:eq(0)').removeClass('inactive'); 
              })
              
            }
            $('input[name=shkct_senttime]',ordersWindow[orderId]).mask("h9:00 — H9:00");
            orderPane = new WebFXTabPane($("#order_"+orderId+"_view")[0],true);
            orderPane.addTabPage( $('#order_'+orderId+'_view .viewOrder',ordersWindow[orderId])[0]);
            orderPane.addTabPage( $('#order_'+orderId+'_view .editOrder',ordersWindow[orderId])[0]);
            orderPane.addTabPage( $('#order_'+orderId+'_view .companyOrder',ordersWindow[orderId])[0]);
            orderPane.addTabPage( $('#order_'+orderId+'_view .historyOrder',ordersWindow[orderId])[0]);
          }        
        });
    }else {
        ordersWindow[orderId].appendTo('body');
    }
  });
  
  
  /*
   * Подгружаем hidden-заказы
   */ 
  $('.tab').on("click", function(){
    if($('.tab-page').eq($(this).index()).find(".orders tr").length<=1){
      xhrGetOrder = $.ajax({"data" : {"status_id":$('.tab-page').eq($(this).index()).data('id')}})
    }
  });

  // Фильтры
  $('.filter').replaceAll('#statusall h3');
  $('.filter *').on("change",function(e){
    e.preventDefault();
    $('#statusall .orders tr[data-status]').remove();
    xhrGetOrder = $.ajax({"data" : $.extend({"status_id":"all"},$(this).parents('form').serializeObject())});
  })
  
  // Действия с заказами (показываем нужные кнопки)
  $('.orders').on("change",".orderCheckbox input",function(){
    var l = $("td.orderCheckbox input:checked").length;
    $('.actions button').attr("disabled","").filter(l==1?'.single':l>1?'.multi':'').removeAttr("disabled");
  });

  // Управляющий чекбокс
  $('th.orderCheckbox input').on("change", function(){
      var thiz = this;
      $(this).parents('tr').siblings('tr').find('td.orderCheckbox input').each(function(){
          this.checked = thiz.checked;
      });
  });
  $('.orders').on("click","td",function(e){
      if(e.target==this){
          var chbx = $(this).parent().find('td.orderCheckbox input');
          chbx.prop("checked", !chbx.prop("checked")).trigger("change");
      }
  });

  $('input[data-intro]').each(function(){
      var color = $(this).css('color');
      if($(this).val()=='') $(this).val($(this).data('intro')).css({"color":"#ccc"});
      $(this).on('focus blur',function(e){
          if(e.type=='focus' && $(this).val()==$(this).data('intro')) $(this).val('').css({"color":color});
          if(e.type=='blur' && $(this).val()=='') $(this).val($(this).data('intro')).css({"color":"#ccc"});
      })
  });    
  
});

(function($,w,d,c){// c - undefined
  /**
    * popupWindow func
    */
  $.event.props.push('pageX');
  $.event.props.push('pageY');
  $.event.props.push('dataTransfer');
  d.addEventListener('dragover', function(e){e.preventDefault();});
  $.popupWindow = function(title,html){
      //var wrap = $('<div/>',{"class":"popupWindow"}).append($('<header/>',{"draggable":"true","text":title}), $('<section/>',{"html":html})).appendTo('body').css({"left":function(){return (w.innerWidth/2) - ($(this).outerWidth()/2)}});
      var wrap = $('<div/>',{
              "class":"popupWindow",
              "mousedown":function(){
                  $(this).removeClass('inactive').siblings('.popupWindow').addClass('inactive');
              }
          }).append($('<header/>',{"draggable":"true","text":title}), $('<section/>',{"html":html}))
            .appendTo('body')
            .css({"left":function(){return Math.max(((w.innerWidth/2) - ($(this).outerWidth()/2)),0)}}).siblings('.popupWindow').addClass('inactive').end();

      var mouse = {};
      $('header',wrap).on({
        "dragstart":function(e){
              e.dataTransfer.setDragImage(d.createElement("img"),0,0); // убираем полупрозрачную копию объекта
              mouse = { "offsetX" : e.pageX - wrap.offset().left, "offsetY" : e.pageY - wrap.offset().top }; // отступы мыши от краев окна
              wrap.addClass('moving');
        },
        "dragend":function(e){
            wrap.removeClass('moving');
        },
        "drag":/*$.throttle(24,*/function(e){
          if(e.pageX>0 && e.pageY>0) wrap.css({"left" : e.pageX - mouse.offsetX, "top"  : e.pageY - mouse.offsetY - $(w).scrollTop()});
        }/*)*/
      });
      return wrap;
  }
  $(document).on({"keydown" : function(e){
        if(e.keyCode==27 && $('.popupWindow:not(.inactive)').length){
            $('.popupWindow:not(.inactive)').detach();
            $('.popupWindow.inactive:eq(0)').removeClass('inactive');
        }
  }});

  /**
    * number_format func
    */
  $.fn.number_format = function(decimals, dec_point, thousands_sep){
    return this.each(function(){
      var number = $(this).text();
      // Strip all characters but numerical ones.
      number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
      var n = !isFinite(+number) ? 0 : +number,
          prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
          sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
          dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
          s = '',
          toFixedFix = function (n, prec) {
              var k = Math.pow(10, prec);
              return '' + Math.round(n * k) / k;
          };
      // Fix for IE parseFloat(0.55).toFixed(0) = 0;
      s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
      if (s[0].length > 3) {
          s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
      }
      if ((s[1] || '').length < prec) {
          s[1] = s[1] || '';
          s[1] += new Array(prec - s[1].length + 1).join('0');
      }
      $(this).text(s.join(dec));
      //return s.join(dec);
    });
  }
  
  /* setPlaceholders */
  $.setPlaceholders = function(tpl,data){$.each(data, function(k,v) {if(v!=undefined) tpl = tpl.replace(new RegExp("\\[\\+"+k+"\\+\\]","g"), v)}); return tpl;}
  /* throttle */
  $.throttle=function(e,f,j,i){var h,d=0;if(typeof f!=="boolean"){i=j;j=f;f=c}function g(){var o=this,m=+new Date()-d,n=arguments;function l(){d=+new Date();j.apply(o,n)}function k(){h=c}if(i&&!h){l()}h&&clearTimeout(h);if(i===c&&m>e){l()}else{if(f!==true){h=setTimeout(i?k:l,i===c?e-m:e)}}}if($.guid){g.guid=j.guid=j.guid||$.guid++}return g};
  /* debounce */
  $.debounce=function(d,e,f){return f===c?$.throttle(d,e,false):$.throttle(d,f,e!==false)};
  /* serializeObject */
  $.fn.serializeObject = function(){var o = {};$.each(this.serializeArray(),function(i,e){if(o[e.name]){if(!o[e.name].push) o[e.name] = [o[e.name]];o[e.name].push(e.value || '');}else o[e.name] = e.value || '';});return o;};  

  
  /* jQuery Masked Input Plugin Version: 1.4.0*/
  !function(a){"function"==typeof define&&define.amd?define(["jquery"],a):a("object"==typeof exports?require("jquery"):jQuery)}(function(a){var b,c=navigator.userAgent,d=/iphone/i.test(c),e=/chrome/i.test(c),f=/android/i.test(c);a.mask={definitions:{9:"[0-9]",a:"[A-Za-z]","*":"[A-Za-z0-9]"},autoclear:!0,dataName:"rawMaskFn",placeholder:"_"},a.fn.extend({caret:function(a,b){var c;if(0!==this.length&&!this.is(":hidden"))return"number"==typeof a?(b="number"==typeof b?b:a,this.each(function(){this.setSelectionRange?this.setSelectionRange(a,b):this.createTextRange&&(c=this.createTextRange(),c.collapse(!0),c.moveEnd("character",b),c.moveStart("character",a),c.select())})):(this[0].setSelectionRange?(a=this[0].selectionStart,b=this[0].selectionEnd):document.selection&&document.selection.createRange&&(c=document.selection.createRange(),a=0-c.duplicate().moveStart("character",-1e5),b=a+c.text.length),{begin:a,end:b})},unmask:function(){return this.trigger("unmask")},mask:function(c,g){var h,i,j,k,l,m,n,o;if(!c&&this.length>0){h=a(this[0]);var p=h.data(a.mask.dataName);return p?p():void 0}return g=a.extend({autoclear:a.mask.autoclear,placeholder:a.mask.placeholder,completed:null},g),i=a.mask.definitions,j=[],k=n=c.length,l=null,a.each(c.split(""),function(a,b){"?"==b?(n--,k=a):i[b]?(j.push(new RegExp(i[b])),null===l&&(l=j.length-1),k>a&&(m=j.length-1)):j.push(null)}),this.trigger("unmask").each(function(){function h(){if(g.completed){for(var a=l;m>=a;a++)if(j[a]&&C[a]===p(a))return;g.completed.call(B)}}function p(a){return g.placeholder.charAt(a<g.placeholder.length?a:0)}function q(a){for(;++a<n&&!j[a];);return a}function r(a){for(;--a>=0&&!j[a];);return a}function s(a,b){var c,d;if(!(0>a)){for(c=a,d=q(b);n>c;c++)if(j[c]){if(!(n>d&&j[c].test(C[d])))break;C[c]=C[d],C[d]=p(d),d=q(d)}z(),B.caret(Math.max(l,a))}}function t(a){var b,c,d,e;for(b=a,c=p(a);n>b;b++)if(j[b]){if(d=q(b),e=C[b],C[b]=c,!(n>d&&j[d].test(e)))break;c=e}}function u(){var a=B.val(),b=B.caret();if(a.length<o.length){for(A(!0);b.begin>0&&!j[b.begin-1];)b.begin--;if(0===b.begin)for(;b.begin<l&&!j[b.begin];)b.begin++;B.caret(b.begin,b.begin)}else{for(A(!0);b.begin<n&&!j[b.begin];)b.begin++;B.caret(b.begin,b.begin)}h()}function v(){A(),B.val()!=E&&B.change()}function w(a){if(!B.prop("readonly")){var b,c,e,f=a.which||a.keyCode;o=B.val(),8===f||46===f||d&&127===f?(b=B.caret(),c=b.begin,e=b.end,e-c===0&&(c=46!==f?r(c):e=q(c-1),e=46===f?q(e):e),y(c,e),s(c,e-1),a.preventDefault()):13===f?v.call(this,a):27===f&&(B.val(E),B.caret(0,A()),a.preventDefault())}}function x(b){if(!B.prop("readonly")){var c,d,e,g=b.which||b.keyCode,i=B.caret();if(!(b.ctrlKey||b.altKey||b.metaKey||32>g)&&g&&13!==g){if(i.end-i.begin!==0&&(y(i.begin,i.end),s(i.begin,i.end-1)),c=q(i.begin-1),n>c&&(d=String.fromCharCode(g),j[c].test(d))){if(t(c),C[c]=d,z(),e=q(c),f){var k=function(){a.proxy(a.fn.caret,B,e)()};setTimeout(k,0)}else B.caret(e);i.begin<=m&&h()}b.preventDefault()}}}function y(a,b){var c;for(c=a;b>c&&n>c;c++)j[c]&&(C[c]=p(c))}function z(){B.val(C.join(""))}function A(a){var b,c,d,e=B.val(),f=-1;for(b=0,d=0;n>b;b++)if(j[b]){for(C[b]=p(b);d++<e.length;)if(c=e.charAt(d-1),j[b].test(c)){C[b]=c,f=b;break}if(d>e.length){y(b+1,n);break}}else C[b]===e.charAt(d)&&d++,k>b&&(f=b);return a?z():k>f+1?g.autoclear||C.join("")===D?(B.val()&&B.val(""),y(0,n)):z():(z(),B.val(B.val().substring(0,f+1))),k?b:l}var B=a(this),C=a.map(c.split(""),function(a,b){return"?"!=a?i[a]?p(b):a:void 0}),D=C.join(""),E=B.val();B.data(a.mask.dataName,function(){return a.map(C,function(a,b){return j[b]&&a!=p(b)?a:null}).join("")}),B.one("unmask",function(){B.off(".mask").removeData(a.mask.dataName)}).on("focus.mask",function(){if(!B.prop("readonly")){clearTimeout(b);var a;E=B.val(),a=A(),b=setTimeout(function(){z(),a==c.replace("?","").length?B.caret(0,a):B.caret(a)},10)}}).on("blur.mask",v).on("keydown.mask",w).on("keypress.mask",x).on("input.mask paste.mask",function(){B.prop("readonly")||setTimeout(function(){var a=A(!0);B.caret(a),h()},0)}),e&&f&&B.off("input.mask").on("input.mask",u),A()})}})});
  $.mask.definitions['h']='[0-1]';
  $.mask.definitions['H']='[0-2]';

})(jQuery,window,document);



/* Tab Pane 1.02  http://webfx.eae.net/dhtml/tabpane/tabpane.html */
function hasSupport(){if("undefined"!=typeof hasSupport.support)return hasSupport.support;var a=/msie 5\.[56789]/i.test(navigator.userAgent);hasSupport.support="undefined"!=typeof document.implementation&&document.implementation.hasFeature("html","1.0")||a;a&&(document._getElementsByTagName=document.getElementsByTagName,document.getElementsByTagName=function(a){return"*"==a?document.all:document._getElementsByTagName(a)});return hasSupport.support}
function WebFXTabPane(a,b){if(hasSupport()&&null!=a){this.element=a;this.element.tabPane=this;this.pages=[];this.selectedIndex=null;this.useCookie=null!=b?b:!0;this.element.className=this.classNameTag+" "+this.element.className;this.tabRow=document.createElement("div");this.tabRow.className="tab-row";a.insertBefore(this.tabRow,a.firstChild);var d=0;this.useCookie&&(d=Number(WebFXTabPane.getCookie("webfxtab_"+this.element.id)),isNaN(d)&&(d=0));this.selectedIndex=d;for(var d=a.childNodes,c=0;c<d.length;c++)1==
d[c].nodeType&&"tab-page"==d[c].className&&this.addTabPage(d[c])}}WebFXTabPane.prototype.classNameTag="dynamic-tab-pane-control";WebFXTabPane.prototype.setSelectedIndex=function(a){this.selectedIndex!=a&&(null!=this.selectedIndex&&null!=this.pages[this.selectedIndex]&&this.pages[this.selectedIndex].hide(),this.selectedIndex=a,this.pages[this.selectedIndex].show(),this.useCookie&&WebFXTabPane.setCookie("webfxtab_"+this.element.id,a))};WebFXTabPane.prototype.getSelectedIndex=function(){return this.selectedIndex};
WebFXTabPane.prototype.addTabPage=function(a,b){if(hasSupport()){if(a.tabPage==this)return a.tabPage;var d=this.pages.length,c=this.pages[d]=new WebFXTabPage(a,this,d,b);c.tabPane=this;this.tabRow.appendChild(c.tab);d==this.selectedIndex?c.show():c.hide();return c}};WebFXTabPane.prototype.dispose=function(){this.tabRow=this.element=this.element.tabPane=null;for(var a=0;a<this.pages.length;a++)this.pages[a].dispose(),this.pages[a]=null;this.pages=null};
WebFXTabPane.setCookie=function(a,b,d){var c="";d&&(c=new Date,c.setTime(c.getTime()+864E5*d),c="; expires="+c.toGMTString());document.cookie=a+"="+b+c+"; path=/"};WebFXTabPane.getCookie=function(a){a=(new RegExp("(;|^)[^;]*("+a+")=([^;]*)(;|$)")).exec(document.cookie);return null!=a?a[3]:null};WebFXTabPane.removeCookie=function(a){setCookie(a,"",-1)};
function WebFXTabPage(a,b,d,c){if(hasSupport()&&null!=a){this.element=a;this.element.tabPage=this;this.callBack=c;this.index=d;a=a.childNodes;for(b=0;b<a.length;b++)if(1==a[b].nodeType&&"tab"==a[b].className){this.tab=a[b];break}this.aElement=a=document.createElement("SPAN");a.href="#";for(a.onclick=function(){return!1};this.tab.hasChildNodes();)a.appendChild(this.tab.firstChild);this.tab.appendChild(a);var f=this;this.tab.onclick=function(){return f.select()};this.tab.onmouseover=function(){WebFXTabPage.tabOver(f)};
this.tab.onmouseout=function(){WebFXTabPage.tabOut(f)}}}WebFXTabPage.prototype.show=function(){var a=this.tab,b=a.className+" selected",b=b.replace(/ +/g," ");a.className=b;this.element.style.display="block"};WebFXTabPage.prototype.hide=function(){var a=this.tab,b=a.className,b=b.replace(/ selected/g,"");a.className=b;this.element.style.display="none"};WebFXTabPage.prototype.select=function(){this.tabPane.setSelectedIndex(this.index);this.callBack&&this.callBack();return!1};
WebFXTabPage.prototype.dispose=function(){this.aElement=this.aElement.onclick=null;this.element.tabPage=null;this.tab.onclick=null;this.tab.onmouseover=null;this.element=this.tabPane=this.tab=this.tab.onmouseout=null};WebFXTabPage.tabOver=function(a){a=a.tab;var b=a.className+" hover",b=b.replace(/ +/g," ");a.className=b};WebFXTabPage.tabOut=function(a){a=a.tab;var b=a.className,b=b.replace(/ hover/g,"");a.className=b};
function setupAllTabs(){if(hasSupport())for(var a=document.getElementsByTagName("*"),b=a.length,d=/tab\-pane/,c=/tab\-page/,f,e,g=0;g<b;g++)e=a[g],f=e.className,""!=f&&(d.test(f)&&!e.tabPane?new WebFXTabPane(e):c.test(f)&&!e.tabPage&&d.test(e.parentNode.className)&&e.parentNode.tabPane.addTabPage(e))}
function disposeAllTabs(){if(hasSupport()){for(var a=document.getElementsByTagName("*"),b=a.length,d=/tab\-pane/,c,f,e=[],g=0;g<b;g++)f=a[g],c=f.className,""!=c&&d.test(c)&&f.tabPane&&(e[e.length]=f.tabPane);for(g=e.length-1;0<=g;g--)e[g].dispose(),e[g]=null}}
if("undefined"!=typeof window.addEventListener)window.addEventListener("load",setupAllTabs,!1);else if("undefined"!=typeof window.attachEvent)window.attachEvent("onload",setupAllTabs),window.attachEvent("onunload",disposeAllTabs);else if(null!=window.onload){var oldOnload=window.onload;window.onload=function(a){oldOnload(a);setupAllTabs()}}else window.onload=setupAllTabs;