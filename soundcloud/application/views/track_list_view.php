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
	<h1>Track List</h1>
	<?php

		foreach($tracks->result() as $row)
		{
			echo '<a href="http://localhost/soundcloud/index.php/track_info_controller?oid=';
			echo $row->OID;
			echo '"> ';
			echo $row->Name;
			echo '</a>';
			echo '<br>';

		}
		

	?>

</main>

</body>
</html>