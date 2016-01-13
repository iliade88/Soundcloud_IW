<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<?php require_once('requires.php'); ?>
</head>
<body>
	<?php require_once('menu.php'); ?>
	<main>
		<form action="/soundcloud/index.php/login_controller/Login" method ="post">
			<div class="form-group" style="min-width=480px; margin: auto; width: 50%;">
				<label for="username">Username:</label>
				<input type="text" class="form-control" name="username" placeholder="Username..." autofocus><br>
				<label for="pass">Password:</label>
				<input type="password" class="form-control" name="pass" palceholder="Password..."><br>
				<input type="submit" class="btn btn-default" value="Sign In"><br>
			</div>
		</form>
	</main>

</body>
</html>