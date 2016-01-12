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
	<h1>Playlist Info</h1>
	<?php 
		$res = $playlist->row(); 
	?>
	<table border="1">
		<tr>
			<td> Name </td>
			<td><?php
				echo $res->Name;
			?></td>
		</tr>
		<tr>
			<td> Followers </td>
			<td><?php
				echo $res->N_Followers;
			?></td>
		</tr>
		<tr>
			<td> Tracks </td>
			<td><?php
				echo $res->N_Tracks;
			?></td>
		</tr>
	</table>
	<table width="50%">
	<th width="50%" >Name</th>
	<th width="50%" >Category</th>
		<?php
			foreach($tracks->result() as $row)
			{
				echo '<tr>';

				echo "<td> $row->track_name </td>";

				echo "<td> $row->track_category </td>";

				echo '</tr>';
			}
		?>
	</table>
</main>

</body>
</html>