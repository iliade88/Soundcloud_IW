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
<?php
	echo $this->session->userdata('username');
?>
</main>

</body>
</html>