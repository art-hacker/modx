jQuery(function($){

  $.ajaxSetup({"url" : "index-ajax.php", "cache" : true});
  $('[data-href]').seoLinks();
  $('#wrapper>aside').prependTo('#wrapper');

  $('input[data-intro]').each(function(){
    var color = $(this).css('color');
    if($(this).val()=='') $(this).val($(this).data('intro')).css({"color":"#ccc"});
    $(this).on('focus blur',function(e){
        if(e.type=='focus' && $(this).val()==$(this).data('intro')) $(this).val('').css({"color":color});
        if(e.type=='blur' && $(this).val()=='') $(this).val($(this).data('intro')).css({"color":"#ccc"});
    
    })
  })
  
  $('a[href*=#]').on('click', function(e){ // Плавный переход по якорям
    if($(this).attr('href').slice(1).length<1) return;
    var anchor = $('a[name='+$(this).attr('href').slice(1)+']');
    var speed = 300;
    if(anchor.length>0){
        e.preventDefault();
        $("html, body").animate({"scrollTop":anchor.offset().top-40},speed);
        anchor.stop().delay(speed).queue(function(){
            $(this).parent().animate({"backgroundColor":$(this).parent().css("backgroundColor")},{"start":function(){$(this).css({"backgroundColor":"#f6dbd9"})},"duration":3000}).dequeue()
        });
    }
  })
  

  $('#content').css({"minHeight":function(){
    return $( window ).height()>$('.leftbar').height() ? $( window ).outerHeight()-90 : $('.leftbar').outerHeight()+65;
  }});
  
  
  /*
  $.mask.definitions['H']='[0-2]';
  $.mask.definitions['M']='[0-5]';
  $('.deliverytime').mask("c H9-M9 по H9-M9");
  */

  $('p.oneclick').on("click","a",function(e){
    var form = $('<span/>',{html:"<input type='text'/><button>Купить</button>"});
    var button = $(this);
    $(this).replaceWith(form);
    $('input',form).mask("8 (999) 999-99-99").focus().on("blur",function(){
      form.replaceWith(button);
    });
    e.preventDefault();
  })
  
  $('a.warrantly').on("click",function(e){
    e.preventDefault();
      $.fancybox({
        openEffect  : "none", closeEffect: "none", prevEffect : "none", nextEffect : "none",
        wrapCSS     : "dialog",
        padding     : 30,
        maxWidth    : 470,
        helpers     : {"overlay": {"speedOut":0,"locked" : false}},
        content     : "\
         <h2>TTstore гарантирует:</h2><ul>\
         <li>– Подтверждение заказа в течение 1 часа</li>\
         <li>– Своевременную доставку</li>\
         <li>– Расширенные условия возврата</li></ul></br>\
         <h2>Вернуть товар? Легко!</h2><p>Наш магазин осуществляет условия возврата и обмена согласно правилам продажи товаров дистанционным способом утвержденным Правительством Российской Федерации.</p><br/>\
         <h2>+7 (909) 151-76-67</h2><p>Звоните! На любые вопросы ответит наша Служба поддержки покупателей</p>"
      });              
  });
  
  
  
  $('.leftbar').on("click", ".address", function(e){
    e.preventDefault();
    ymaps.ready(function(){
      var mapContainer = $('<div/>',{"class":"yMapAssress"}).prependTo('body');
      var yMap = new ymaps.Map(mapContainer[0], {center: [55.58189642, 37.62683702], zoom: 14, controls: ["zoomControl", "fullscreenControl"]});
      var placemark = new ymaps.Placemark(yMap.getCenter(), {},
      { iconLayout: 'default#image',
        iconImageHref:"assets/templates/default/images/placemark.png",
        iconImageSize: [37, 43]
      });
      yMap.geoObjects.add(placemark);
      $.fancybox({
        content     : mapContainer,
        openEffect  : "none", closeEffect: "none", prevEffect : "none", nextEffect : "none",
        wrapCSS     : "yMap",
        fixed: false,
        helpers     : {"overlay": {"speedOut":0,"locked" : false}}
      });
    });
  });
  
  $(".fancybox-thumb").fancybox({
    padding    : 0,
    margin     : [20,0,0,0],
    groupAttr  : "data-group",
    topRatio   : 0,
    keys       : {"next":[13,39], "prev":[8,37], "close":[27], "toggle":[70]}, //http://www.cambiaresearch.com/articles/15/javascript-char-codes-key-codes
    beforeShow : function(){$('html').addClass('fancybox-opened')},
    afterClose : function(){$('html').removeClass('fancybox-opened')},
    openEffect : "none", closeEffect: "none", prevEffect : "none", nextEffect : "none",
    arrows     : false, nextClick  : true,
    helpers    : {"overlay": {"closeClick":true, "speedOut":0}}//inside
  });

  $('a.vibrate_subscribe').on('click',function(e){
    e.preventDefault();
    $('#subscribe').vibro({'size': window.innerWidth > 800 ? 7 : 0, 'time': 90, 'easing': 'linear'});
  });
  
  
  /**
   ** SUBSCRIBE FORM
   **/
    $('#subscribe form').on("submit",function(e){
    e.preventDefault();
    var beforeSendTimeout;
    $.ajax({
      "data" : "q=assets/snippets/shopkeeper/ajax-cart.php",
      "beforeSend":function(){
        beforeSendTimeout = setTimeout(function(){
            $.fancybox.helpers.overlay.open({"closeClick":false,"parent":"body"});
            $.fancybox.showLoading();
        },150)
      },
      "complete":function(){
        console.log(clearTimeout(beforeSendTimeout));
      },
      "error":function(jqHR,textStatus,errorThrown){console.log(errorThrown);},
      "success" :function(data){
        $.fancybox({
          //openEffect  : "none", closeEffect: "none", prevEffect : "none", nextEffect : "none",
          wrapCSS     : "dialog",
          padding     : 30,
          maxWidth    : 470,
          helpers     : {"overlay": {"speedOut":0,"locked" : false}},
          content     : "\
           <h2>Держи руку на пульсе!</h2><ul>\
           <p>В качестве благодарности за проявленый интерес на Вашу почту отправлен маленький подарок от нашей команды! :)</p>\
           <p>В любой момент вы можете отписаться от наших новостей в низу любого из наших писем.</p>"
        });
      }
    })
    
    })


  /**
   ** ADD2CART
   **/
  $('#orderList>a').add('.cart a.cart-icon').on("click",function(e){
    e.preventDefault();
    $("#orderList").toggleClass($("#orderList").is(".hidden")?'hidden':'minimize').toggleClass('maximize');
  });
  
  var cart = $('#bar .cart').on("reload",function(e,data){
    var order = $('order',data),
        items = $('items item',data);
    $('#bar i.cnt').text(order.attr("total_items"));
    $("#bar .cart small").text(parseInt(order.attr("price_total")).format(0,3," ")+" руб");

    var newOrderList = $('<ul/>');
    items.each(function(){
      newOrderList.append("<li data-index='"+$(this).attr("index")+"'><a href='"+$(this).attr("link")+"'><img src='"+$("image",this).html()+"'/>"+$("name",this).html()+"</a> <input type='text' value='"+$(this).attr("count")+"' name='count' /></li>");
    });
    $('#orderList ul').replaceWith(newOrderList);
  });
  
  $('#item figcaption form').on("submit",function(e){
    var cartButton = $('button', this).stop().clearQueue();
    e.preventDefault();
    var beforeSendTimeout;
    $.ajax({
      "data" : "q=assets/snippets/shopkeeper/ajax-cart.php&cartTpl=xml-cart&cartType=full&cartRowTpl=xml-cart-items&action=add&"+$(this).serialize(),
      "dataType" : "xml",
      "beforeSend":function(){
        beforeSendTimeout = setTimeout(function(){
          cartButton.attr("disabled", "disabled").html("Загрузка<small>пару секунд...</small>");
        },150)
      },
      "error":function(jqHR,textStatus,errorThrown){console.log(errorThrown);},
      "success" :function(data){
        clearTimeout(beforeSendTimeout);
        cartButton.removeAttr("disabled").addClass("success").html("Есть!<small>товар добавлен</small>")
        .delay(300).queue(function(){
          if($('#orderList').is('.hidden')){
              $('#orderList').removeClass().addClass("maximize");
          }else{
            /*$('#bar .cart>a').stop().animate({"backgroundColor":"#404143"},{                   "start":function(){$(this).css({"backgroundColor":"#626366"})},                   "duration":2000,                 }).find('small').stop().animate({"color":"#838587"},{                   "start":function(){$(this).css({"color":"#a6a8ab"})},                   "duration":2000,                 })                 .end().parent().find('i.cnt')*/
            var marginTop = $('#bar i.cnt').css("marginTop");

            $('#bar i.cnt').stop(true)
              .animate({"marginTop":"-13px"},100)
              .animate({"marginTop":marginTop},500,"easeOutBounce")
              .delay(300)
              .animate({"marginTop":"-13px"},100)
              .animate({"marginTop":marginTop},500,"easeOutBounce");
          }
          $(this).dequeue();
          
          cart.trigger("reload",data);
          
        }).delay(1300).queue(function(){
          $(this).removeClass("success").html("В корзину<small>добавить</small>").dequeue();
        });

      }
    });
  });
  $('#orderList').on("change","input",function(e){
      $.ajax({
        "data": "q=assets/snippets/shopkeeper/ajax-cart.php&cartTpl=xml-cart&cartType=full&cartRowTpl=xml-cart-items&action=upd&count="+$(this).val()+"&index="+$(this).closest('li').data('index'),
        "dataType" : "xml",
        "success":function(data){
          cart.trigger("reload",data);
        }
      })
  })
  $('#orderList').on("click","input",function(e){
    this.select()    
  })
  $('#orderList').on("keydown","input",function(e){
      if($.inArray(e.keyCode, [13,33,34,38,40])!==-1) e.preventDefault();
      if($.inArray(e.keyCode, [13])!==-1) $(this).trigger('change');
      if($.inArray(e.keyCode, [33,38])!==-1){ $(this).val(parseInt($(this).val())+1);}
      if($.inArray(e.keyCode, [34,40])!==-1 && $(this).val()>1){ $(this).val(parseInt($(this).val())-1);}
  })
  
  
  //var asideBot = $('<aside/>',{"class":"leftbar"}).appendTo('#wrapper');
  var asideScrollTop = $('<div/>',{"id":"asideScrollTop","click":function(){$("html, body").animate({"scrollTop":0},200);}}).appendTo('.leftbar:eq(0)').hide();
  
  $(window).on("scroll", $.throttle(250, function(e){
    if(this.innerWidth>800){
      if($(this).scrollTop()>this.innerHeight*1.5){
        if(asideScrollTop.is(':hidden')) asideScrollTop.show()
      }else{
        if(asideScrollTop.is(':visible')) asideScrollTop.hide();
      }
    }
  }));
  
  /*************
  * СATALOG-MENU
  */
  (function(){
    var menu = $('.catalog-menu>ul').on('loaded', function(){
      $('a', this).preventSelect();
      $('>li:has(nav)',this).on({
        'show': function(){$(this).addClass('active').find('nav>ul').show().end().trigger('reposition').siblings().trigger('hide');},
        'hide': function(){$(this).removeClass('active').find('nav>ul').hide()},
        'reposition': function(){
            $('>nav>ul',this).css({"paddingLeft":function(){
                if(window.innerWidth<=500) return 0;
                var offtset = $(this).closest('li').offset().left - menu.offset().left;
                if($('>li',this).sumOuterWidth(true) + offtset > menu.width()){
                    return menu.width() - $('>li',this).sumOuterWidth(true); /* lookout display-block <li></li>(nospace)<li></li> */
                }else{
                    return offtset + $(this).closest('li').width()/2 - $('>li',this).sumOuterWidth(true)/2;
                }
                
            }})
        }
      })
      .find('>a').on('click', function(e){
          var li = $($(this).closest('li'));
          e.preventDefault();
          if(li.is(':not(.active)')){
              li.trigger('show')
          }else{
              li.trigger('hide')
          }
      }).on('mouseenter', function(){
      })
    });
    
    if(menu.is(":empty")){
      //menu.load($.ajaxSetup().url + "?q=assets/snippets/wayfinder/ajax-catalog-menu.php&id="+docId, function(){$(this).trigger('loaded')}).appendTo('header');
    }else{
      menu.trigger("loaded");
    }
    $(document).on({
      "keydown" : function(e){ if(e.keyCode==27) $('>li',menu).trigger('hide'); },
      "click"   : function(e){ if(!$(e.target).is($('*',menu))) $('>li',menu).trigger('hide');}
    });
    $(window).on("resize", $.debounce(150, function(e){
        $('>li>nav>ul:visible',menu).trigger('reposition');
        $('#subscribe,#marketBanner').appendTo($('aside.leftbar').eq(this.innerWidth<800));
    })).trigger('resize')
  }());
});

(function($,c){
  /* sumOuterWidth */
  $.fn.sumOuterWidth = function(m) { var w = 0; this.each(function(){w += $(this).outerWidth(m);}); return w;};
  /* seoLinks */
  $.fn.seoLinks=function(){return this.each(function(){var a=$('<a/>',{"href":this.dataset.href,"html":$(this).html()}).replaceAll(this);$.each(this.attributes,function(i,attr){if(attr.name!="data-href") a.attr(attr.name, attr.value)});if((new RegExp('https?:\/\/(?!'+location.host+')')).test(this.dataset.href)) a.attr({"target":"_blank"});});}
  /* preventSelect */
  $.fn.preventSelect=function(){return this.each(function(){this.onselectstart=function(){return false};this.unselectable="on";$(this).css('-moz-user-select','none')})}
    /* throttle */
  $.throttle=function(e,f,j,i){var h,d=0;if(typeof f!=="boolean"){i=j;j=f;f=c}function g(){var o=this,m=+new Date()-d,n=arguments;function l(){d=+new Date();j.apply(o,n)}function k(){h=c}if(i&&!h){l()}h&&clearTimeout(h);if(i===c&&m>e){l()}else{if(f!==true){h=setTimeout(i?k:l,i===c?e-m:e)}}}if($.guid){g.guid=j.guid=j.guid||$.guid++}return g};
  /* debounce */
  $.debounce=function(d,e,f){return f===c?$.throttle(d,e,false):$.throttle(d,f,e!==false)};
  
  $.fn.vibro=function(e,type){
    var cfg = $.extend({'size':10, 'time':200, 'easing':'linear','attr':'"left"'},e),
        obj1 = {}, obj2 = {}, obj3 = {};
    obj1[type=='h'?'top':'left'] = cfg.size;
    obj2[type=='h'?'top':'left'] = -cfg.size;
    obj3[type=='h'?'top':'left'] = 0;
    return this.each(function(){
      if($(window).scrollTop()>$(this).offset().top){
        $("html, body").animate({"scrollTop":$(this).offset().top-20},200);
        $(this).delay(600)
      }
      $(this).css({"position":"relative"})
      .animate(obj1,cfg.time,cfg.easing)
      .animate(obj2,cfg.time/1.2,cfg.easing)
      .animate(obj1,cfg.time/1.4,cfg.easing)
      .animate(obj2,cfg.time/1.6,cfg.easing)
      .animate(obj1,cfg.time/1.8,cfg.easing)
      .animate(obj2,cfg.time/1.9,cfg.easing)
      .animate(obj1,cfg.time/1.9,cfg.easing)
      .animate(obj3,cfg.time/2,cfg.easing,function(){
        $(this).css({"position":"static"});
      })
    });
  }
})(jQuery);



/*
    jQuery Masked Input Plugin
    Copyright (c) 2007 - 2014 Josh Bush (digitalbush.com)
    Licensed under the MIT license (http://digitalbush.com/projects/masked-input-plugin/#license)
    Version: 1.4.0
*/
!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):a("object"==typeof exports?require("jquery"):jQuery)}(function(a){var b,c=navigator.userAgent,d=/iphone/i.test(c),e=/chrome/i.test(c),f=/android/i.test(c);a.mask={definitions:{9:"[0-9]",a:"[A-Za-z]","*":"[A-Za-z0-9]"},autoclear:!0,dataName:"rawMaskFn",placeholder:"_"},a.fn.extend({caret:function(a,b){var c;if(0!==this.length&&!this.is(":hidden"))return"number"==typeof a?(b="number"==typeof b?b:a,this.each(function(){this.setSelectionRange?this.setSelectionRange(a,b):this.createTextRange&&(c=this.createTextRange(),c.collapse(!0),c.moveEnd("character",b),c.moveStart("character",a),c.select())})):(this[0].setSelectionRange?(a=this[0].selectionStart,b=this[0].selectionEnd):document.selection&&document.selection.createRange&&(c=document.selection.createRange(),a=0-c.duplicate().moveStart("character",-1e5),b=a+c.text.length),{begin:a,end:b})},unmask:function(){return this.trigger("unmask")},mask:function(c,g){var h,i,j,k,l,m,n,o;if(!c&&this.length>0){h=a(this[0]);var p=h.data(a.mask.dataName);return p?p():void 0}return g=a.extend({autoclear:a.mask.autoclear,placeholder:a.mask.placeholder,completed:null},g),i=a.mask.definitions,j=[],k=n=c.length,l=null,a.each(c.split(""),function(a,b){"?"==b?(n--,k=a):i[b]?(j.push(new RegExp(i[b])),null===l&&(l=j.length-1),k>a&&(m=j.length-1)):j.push(null)}),this.trigger("unmask").each(function(){function h(){if(g.completed){for(var a=l;m>=a;a++)if(j[a]&&C[a]===p(a))return;g.completed.call(B)}}function p(a){return g.placeholder.charAt(a<g.placeholder.length?a:0)}function q(a){for(;++a<n&&!j[a];);return a}function r(a){for(;--a>=0&&!j[a];);return a}function s(a,b){var c,d;if(!(0>a)){for(c=a,d=q(b);n>c;c++)if(j[c]){if(!(n>d&&j[c].test(C[d])))break;C[c]=C[d],C[d]=p(d),d=q(d)}z(),B.caret(Math.max(l,a))}}function t(a){var b,c,d,e;for(b=a,c=p(a);n>b;b++)if(j[b]){if(d=q(b),e=C[b],C[b]=c,!(n>d&&j[d].test(e)))break;c=e}}function u(){var a=B.val(),b=B.caret();if(a.length<o.length){for(A(!0);b.begin>0&&!j[b.begin-1];)b.begin--;if(0===b.begin)for(;b.begin<l&&!j[b.begin];)b.begin++;B.caret(b.begin,b.begin)}else{for(A(!0);b.begin<n&&!j[b.begin];)b.begin++;B.caret(b.begin,b.begin)}h()}function v(){A(),B.val()!=E&&B.change()}function w(a){if(!B.prop("readonly")){var b,c,e,f=a.which||a.keyCode;o=B.val(),8===f||46===f||d&&127===f?(b=B.caret(),c=b.begin,e=b.end,e-c===0&&(c=46!==f?r(c):e=q(c-1),e=46===f?q(e):e),y(c,e),s(c,e-1),a.preventDefault()):13===f?v.call(this,a):27===f&&(B.val(E),B.caret(0,A()),a.preventDefault())}}function x(b){if(!B.prop("readonly")){var c,d,e,g=b.which||b.keyCode,i=B.caret();if(!(b.ctrlKey||b.altKey||b.metaKey||32>g)&&g&&13!==g){if(i.end-i.begin!==0&&(y(i.begin,i.end),s(i.begin,i.end-1)),c=q(i.begin-1),n>c&&(d=String.fromCharCode(g),j[c].test(d))){if(t(c),C[c]=d,z(),e=q(c),f){var k=function(){a.proxy(a.fn.caret,B,e)()};setTimeout(k,0)}else B.caret(e);i.begin<=m&&h()}b.preventDefault()}}}function y(a,b){var c;for(c=a;b>c&&n>c;c++)j[c]&&(C[c]=p(c))}function z(){B.val(C.join(""))}function A(a){var b,c,d,e=B.val(),f=-1;for(b=0,d=0;n>b;b++)if(j[b]){for(C[b]=p(b);d++<e.length;)if(c=e.charAt(d-1),j[b].test(c)){C[b]=c,f=b;break}if(d>e.length){y(b+1,n);break}}else C[b]===e.charAt(d)&&d++,k>b&&(f=b);return a?z():k>f+1?g.autoclear||C.join("")===D?(B.val()&&B.val(""),y(0,n)):z():(z(),B.val(B.val().substring(0,f+1))),k?b:l}var B=a(this),C=a.map(c.split(""),function(a,b){return"?"!=a?i[a]?p(b):a:void 0}),D=C.join(""),E=B.val();B.data(a.mask.dataName,function(){return a.map(C,function(a,b){return j[b]&&a!=p(b)?a:null}).join("")}),B.one("unmask",function(){B.off(".mask").removeData(a.mask.dataName)}).on("focus.mask",function(){if(!B.prop("readonly")){clearTimeout(b);var a;E=B.val(),a=A(),b=setTimeout(function(){z(),a==c.replace("?","").length?B.caret(0,a):B.caret(a)},10)}}).on("blur.mask",v).on("keydown.mask",w).on("keypress.mask",x).on("input.mask paste.mask",function(){B.prop("readonly")||setTimeout(function(){var a=A(!0);B.caret(a),h()},0)}),e&&f&&B.off("input.mask").on("input.mask",u),A()})}})});

Number.prototype.format = function(n, x, s, c) {
    var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\D' : '$') + ')',
        num = this.toFixed(Math.max(0, ~~n));

    return (c ? num.replace('.', c) : num).replace(new RegExp(re, 'g'), '$&' + (s || ','));
};