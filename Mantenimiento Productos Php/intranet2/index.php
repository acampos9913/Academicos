<!DOCTYPE html>
<html lang="us">
<head>
<meta charset="utf-8">
<title>Ejemplo</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link type="text/css" href="css/jquery-ui-1.10.0.custom.css" rel='stylesheet'/>
<script type="text/javascript" src="js/jquery-1.9.0.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.0.custom.js"></script>
<script type="text/javascript" src="js/jqueryvalidate.js"></script>
<script type="text/javascript" src="js/html5.js"></script>
<!--<script type="text/javascript" src="js/old-browsers.js"></script>-->
<script type="text/javascript" src="js/jsGeneral.js"></script>
<script>
  $(document).ready(function() {
    $( "#accordion" ).accordion();
  });
</script>
</head>
<body>
<div id="cuerpo" class="contenido">
	<div id="bienvenido">
		<span>Bienvenido:</span>
	</div>
	<div id="menu">
		<div id="accordion">
			<h3>Mantenimiento</h3>
			<div><a onclick="verurl('producto.php')" href="#">Producto</a></div>
			<h3>Movimientos</h3>
			<div><a href="#">Entrada de Productos</a></div>
			<h3>Galeria</h3>
			<div><a href="#">Entrada de Productos</a></div>					
		</div>
	</div>
	<div id="contenido">
		MI CONTENIDO
	</div>
</div>
</body>
</html>