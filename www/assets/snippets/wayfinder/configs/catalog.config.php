<?php
//$rowTpl = '@CODE: <li[+wf.classes+]><a href="[+wf.link+]" title="[+wf.title+]" [+wf.attributes+]>[+wf.linktext+]</a><small> [[parentCount? &id=`[+wf.docid+]`]]</small>[+wf.wrapper+]</li>';

$rowTpl = '@CODE:<li[+wf.classes+]><a href="[+wf.link+]" title="[+wf.title+]" [+wf.attributes+]>[+wf.linktext+]</a>[+wf.wrapper+]</li>';
$outerTpl = '@CODE:<nav[+wf.classes+]><ul>[+wf.wrapper+]</ul></nav>';

$outerClass ='catalog-menu';
$lastClass="";
$hereClass="";
$removeNewLines="1";
//$showSubDocCount="true";
$startId='2';
$level='3';
$includeDocs='SELECT id FROM shop_site_content WHERE hidemenu=0 AND isfolder<>0';
//    [[Wayfinder? &startId=`2` &level=`3` &includeDocs=`SELECT id FROM shop_site_content WHERE hidemenu=0 AND isfolder<>0`]]

?>