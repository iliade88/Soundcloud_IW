<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	
	<?php require_once('requires.php'); ?>
	
</head>
<body>
<?php require_once('menu.php'); ?>
<main>
	<h1>User Info</h1>
	<?php 
		$res = $user->row(); 
	?>
	<table border="1">
		<tr>
			<td> Userame </td>
			<td><?php
				echo $res->User_Name;
			?></td>
		</tr>
		<tr>
			<td> Full name </td>
			<td><?php
				echo $res->Full_Name;
			?></td>
		</tr>
		<tr>
			<td> Date of birth </td>
			<td><?php
				echo $res->Date_Of_Birth;
			?></td>
		</tr>
		<tr>
			<td> Email </td>
			<td><?php
				echo $res->Email;
			?></td>
		</tr>
		<tr>
			<td> Location </td>
			<td><?php
				echo $res->Location;
			?></td>
		</tr>
		<tr>
			<td> Gender </td>
			<td><?php
				echo $res->Gender;
			?></td>
		</tr>
		<tr>
			<td> Followers </td>
			<td><?php
				echo $res->N_Followers;
			?></td>
		</tr>
		<tr>
			<td> Following </td>
			<td><?php
				echo $res->N_Following;
			?></td>
		</tr>
		<tr>
			<td> Tracks uploaded </td>
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

				echo "<td> $row->Name </td>";

				echo "<td> $row->Top_Category </td>";

				echo '</tr>';
			}
		?>
	</table>

</main>

</body>
</html>