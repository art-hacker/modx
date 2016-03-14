(function($){$.fn.multiphotos = function(cfg){
var inc=0; // Auto increment for items

this.bind('addItem', function(e,src){
    var self = this;
    var itemInput = $("<input/>", {type : "hidden", value: src, id:"item_"+(inc++)});
    var itemImage = $("<img/>",{"src" : thumb(src)});
    var itemRemove = $("<span/>",{ "click" : function(){
        $(this).parent().animate({"opacity":0},200).animate({"width":"hide","margin-right":"hide"},200,function(){$(this).remove(); $(self).trigger('sync');});
    }})

    var item = $('<div/>',{ "class" : "item",
        "mouseenter" : function(){ itemRemove.stop().fadeTo(150,1) }, /* hide */
        "mouseleave" : function(){ itemRemove.stop().fadeTo(150,0) },    /* show close button */
        "html" : itemInput.add(itemImage).add(itemRemove)
    }).insertBefore($(this).siblings('.addButton'))
    
    $(this).parent().sortable("refresh");
    return item;
})
.bind('sync', function(){ // Synchronization TV value with items
    var val = [];
    $(this).parent().find('.item input').each(function(){
        val.push(this.value)
    });
    $(this).val(JSON.stringify(val));
})
.each(function(){
    var self = this,
    inputListner;

    $(this).parent().addClass('mpTv')
    .append(
        $('<div/>',{
        'class' : 'addButton',
        'click' : function(){
            var item = $(self).triggerHandler('addItem').hide();
            var lastVal = $('input', item).val();
            
            lastImageCtrl = $('input', item).attr("id");
            window.open(cfg.baseUrl+'manager/media/browser/mcpuk/browser.html?Type=images&Connector='+cfg.baseUrl+'manager/media/browser/mcpuk/connectors/php/connector.php&ServerPath='+cfg.baseUrl, 'FCKBrowseWindow', 'toolbar=no,status=no,resizable=yes,dependent=yes,width='+screen.width * 0.7+',height='+screen.height*0.7+',left='+screen.width*0.3/2+',top=' + screen.height*0.3/2);

            clearInterval(inputListner);
            inputListner = setInterval(function(){
                if(lastVal!=$('input', item).val()){
                    clearInterval(inputListner);
                    item.css({"opacity":0}).animate({"width":'show', "margin-right":'show'},200).animate({"opacity":1},200).find('img').attr({"src":thumb($('input', item).val())});
                    $(self).trigger('sync');
                }
            },50);
        }
        })
    );

    $(this).parent().sortable({
        "items" : '>.item',
        "scroll" : false,
        "sort" : function (e, ui) {
            $('>.item',this).not(ui.placeholder).not(ui.helper).each(function(){
                if (Math.abs(ui.position.left - $(this).position().left)<ui.helper.outerWidth()*0.5 && Math.abs(ui.position.top - $(this).position().top)<ui.helper.outerHeight()*0.5) {
                    ui.position.left > $(this).position().left ? $(this).before(ui.placeholder) : $(this).after(ui.placeholder);
                }
            });
        },
        "revert" : 100,
        "stop" : function(){
            $(self).trigger('sync');
            $('span',this).hide();
        }
    })

    try{
    $($.parseJSON(this.value)).each(function(e, val){
        $(self).trigger('addItem',val);
    });
    }catch(e){}
    
})//.parent().attr("colspan",2).siblings('td').hide();


function thumb(src,w,h){

  var password = 'iiuhOIUH86UGYuyg9882wefpihjawefu4hOIUHoiuh1235436';
  var ParameterString = 'w=48&h=48&zc=1&src=../../../'+src;
  var hash = $.md5(ParameterString+password);
    //return cfg.baseUrl+(src||'').replace(/(.*\/)(.*)/,"$1.thumb_$2");
    return '../assets/snippets/phpThumb/phpThumb.php?' + ParameterString + '&hash='+hash;
    
}

return this;

}})(jQuery);

/*!
* DON'T MODIFY THIS!
*/
var lastFileCtrl,lastImageCtrl;function SetUrl(url, width, height, alt){if(lastFileCtrl) {var c = document.mutate[lastFileCtrl];if(c)c.value = url;lastFileCtrl='';}else if(lastImageCtrl){var c=document.mutate[lastImageCtrl];if(c)c.value=url;lastImageCtrl='';}else{return;}}
