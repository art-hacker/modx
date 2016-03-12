<link rel="stylesheet" type="text/css" href="<?=$modx->config['base_url']?>assets/widgets/multiphotos/style.css" />
<script>
(function(){//Load jQuery library using plain JavaScript
  if(typeof jQuery!='function'){
    var head = document.getElementsByTagName('head')[0];
    var script = document.createElement('script');
    script.src = "https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js";
    script.onload = script.onreadystatechange = jQueryOnLoad;
    head.appendChild(script);
  }else jQueryOnLoad();
  
})();

function jQueryOnLoad(){
  jQuery(function($){
    $('.multiphotos').multiphotos({'baseUrl':'<?=$modx->config['base_url']?>'});
  })
}
</script>
<script src="<?=$modx->config['base_url']?>assets/widgets/multiphotos/js/jquery-ui.sortable.min.js"></script>
<script src="<?=$modx->config['base_url']?>assets/widgets/multiphotos/js/jquery.md5.js"></script>
<script src="<?=$modx->config['base_url']?>assets/widgets/multiphotos/js/jquery.multiphotos.js"></script>