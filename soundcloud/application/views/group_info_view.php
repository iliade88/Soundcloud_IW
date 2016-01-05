<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Hola mundo</title>

	
</head>
<body>

<main>
	<h1>Group Info</h1>
	<?php 
		$res = $group->row(); 
	?>
	<table border="1">
		<tr>
			<td> Name </td>
			<td><?php
				echo $res->Name;
			?></td>
		</tr>
	</table>
	<table width="50%">
		<th width="50%" >Name</th>
		<th width="50%">Category</th>
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