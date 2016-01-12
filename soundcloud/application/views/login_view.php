<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Hola mundo</title>
	<?php require_once('requires.php'); ?>
	
</head>
<body>
	<?php require_once('menu.php'); ?>
<main>
<form action="/soundcloud/index.php/login_controller/Login" method ="post">

	Username: <input type="text" name="username"><br>
	Password: <input type="password" name="pass"><br>
	<input type="submit" value="Sign In"><br>

</form>
</main>

</body>
</html>