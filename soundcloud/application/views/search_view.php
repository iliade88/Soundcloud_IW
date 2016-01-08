<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />

	<?php require_once('requires.php'); ?>
	<script src="/soundcloud/assets/js/funciones.js"></script>
	<style type='text/css'>
	body
	{
		font-family: Arial;
		font-size: 14px;
	}
	a {
		color: blue;
		text-decoration: none;
		font-size: 14px;
	}
	a:hover
	{
		text-decoration: underline;
	}
	</style>
</head>
<body>
	
	<div>
		<?php require_once('menu.php'); ?>
	</div>
	<div style='height:20px;'></div>
	<input type="text" name="buscar" id="buscar" placeholder="Buscar..."/><br>
	<div class="content">
		<div id="resultadosTracks">

		</div>
		<div id="resultadosUsers">

		</div>
		<div id="resultadosPlaylists">

		</div>
		<div id="resultadosGroups">

		</div>
	</div>
</body>
</html>
