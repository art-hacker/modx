<?php

// MM rules can go in here, instead of a chunk
// If you copy them to a chunk, don't include the opening and closing PHP tags

// ------------------------ INSERT YOUR RULES HERE --------------------
// See example.mm_rules.inc.php and documentation
// Rename this file to mm_rules.inc.php if you wish to use it
$product_tpl_id = 7;
$main_tpl_ids = '3,4,5,6,7';
mm_hideFields("link_attributes");
mm_createTab('Содержимое ресурса','contentTab', null, $main_tpl_ids, '');
mm_moveFieldsToTab('content', 'contentTab',null,$main_tpl_ids);

mm_createTab('SEO','seoTab', null, $main_tpl_ids, '', '700');
mm_moveFieldsToTab('searchable,title,metaDescription,metaKeywords','seoTab',null,$main_tpl_ids);


mm_renameField('alias',"URL");
mm_renameField("searchable","Индексировать?");

// Если пункты выдачи заказов
mm_renameField('pagetitle',"Метро",null,8);
mm_renameField('longtitle',"Адрес",null,8);
mm_renameField('menuindex',"Номер пункта",null,8);
mm_renameField('description',"Режим работы",null,8);
mm_renameField('menutitle',"Координаты",null,8);
mm_renameField('introtext',"Как проехать",null,8);

mm_renameField('pagetitle',"Регион",null,9);
mm_renameField('longtitle',"Код региона",null,9);
mm_renameField('description',"Код зоны",null,9);
mm_hidetabs("SEO");

mm_hideFields("content,alias",null,"8,9");
mm_hideFields("menutitle,introtext",null,"9");


mm_createTab('Информация','infoTab', '', $product_tpl_id, '', '600');
mm_moveFieldsToTab('pagetitle,longtitle,alias,introtext,template,menutitle,description,menuindex,hidemenu,parent','infoTab',null,$product_tpl_id);
//mm_hideSections("content");
// ------------------------ END OF RULES --------------------

?>