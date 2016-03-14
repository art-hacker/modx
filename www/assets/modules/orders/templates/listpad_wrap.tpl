<!DOCTYPE html>
<head>
  <meta charset="[(modx_charset)]"/>
  <meta name="robots" content="noindex, nofollow"/>
  <title>Заказы</title>
  <base href="[(site_url)][+module_path+]/" />
  <link rel="stylesheet" type="text/css" href="assets/style.css" />
  <link rel="icon" href="assets/icons/orders.ico" type="image/x-icon" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="assets/script.js"></script>
  <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1' />
</head>
<body>

<div style="margin: 20px 12px;">
	<div class="tab-pane listpad" id="statuses" style="border:0">
    <script type="text/javascript">tpPane = new WebFXTabPane(document.getElementById( "statuses" ),true);</script>
    <form method="post" target="_blank" action="doc/index.php">
      [+inner+]
    </form>
	</div>
</div>
</body>
