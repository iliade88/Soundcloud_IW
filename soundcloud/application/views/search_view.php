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
	<div class="form-group">
		<input type="text" class="form-control" name="buscar" id="buscar" placeholder="Buscar..." autofocus/><br>
	</div>
	<div class="content">
		<div>
			<ul class="nav nav-tabs">
				<li class="active"><a href="javascript:showTracks()"><span class="glyphicon glyphicon-headphones" aria-hidden="true"></span> Tracks</a></li> <!-- glyphicon-cd? -->
				<li><a href="javascript:showUsers()"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Users</a></li>
				<li><a href="javascript:showPlaylists()"><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> Playlists</a></li>
				<li><a href="javascript:showGroups()"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span> Groups</a></li>
			</ul>
		</div>
		<div id="resultadosTracks">

		</div>
		<div id="resultadosUsers">

		</div>
		<div id="resultadosPlaylists">

		</div>
		<div id="resultadosGroups">

		</div>
		<div id="paginador">
			<ul class="pager">
			  <li id="prevPag" class="previous"><a href="javascript:pageDown()">&larr; Anterior</a></li>
			  <li id="nextPag" class="next"><a href="javascript:pageUp()">Siguiente &rarr;</a></li>
			</ul>
		</div>
	</div>
</body>
</html>
