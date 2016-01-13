<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	

	
</head>
<body>

<main>
	<h1>Lista playlist</h1><br>
	<?php
		foreach($playlist->result() as $row)
		{
			echo "<a href='soundcloud/index.php/playlist_info_controller?oid=$row->OID'>$row->Name </a>";
		}
	?>

</main>

</body>
</html>