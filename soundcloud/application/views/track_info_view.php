<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Hola mundo</title>


</head>
<body>

<main>
	<h1>Track Info</h1>
	<?php
		$res = $track->row();
	?>
	<table border="1">
		<tr>
			<td> Name </td>
			<td><?php
				echo $res->Name;
			?></td>
		</tr>
		<tr>
			<td> Artist </td>
			<td><?php
				echo $res->Artist;
			?></td>
		</tr>
		<tr>
			<td> Length </td>
			<td><?php
				echo $res->Length;
			?></td>
		</tr>
		<tr>
			<td> Uploaded </td>
			<td><?php
				echo $res->Uploaded;
			?></td>
		</tr>
		<tr>
			<td> Listened </td>
			<td><?php
				echo $res->Listened;
			?></td>
		</tr>
		<tr>
			<td> Category </td>
			<td><?php
				echo $res->Top_Category;
			?></td>
		</tr>
		<tr>
			<td> Description </td>
			<td><?php
				echo $res->Description;
			?></td>
		</tr>
		<tr>
			<td> Likes </td>
			<td><?php
				echo $res->N_Like;
			?></td>
		</tr>
		<tr>
			<td> Plays </td>
			<td><?php
				echo $res->N_Plays;
			?></td>
		</tr>
	</table>

	<table width="100%">
		<th width="15%" >Minute</th>
		<th width="15%" >Author</th>
		<th width="70%">Comment</th>
		<?php
			echo '<br>';
			$username = $this->session->userdata('username');
			if($username)
			{
				$playlists = $this->Track_info_model->get_playlists($username);
				echo "<form method='post' action='/soundcloud/index.php/track_info_controller/add_to_playlist/'>";
				
				echo "<input type='hidden' name='oidTrack' value='$res->OID'>";
				echo '<select name ="oidPlaylist">';
				foreach($playlists->result() as $row)
				{
					echo "<option value='$row->OID'>$row->Name</option>";
				}
				echo '</select>';
				echo "<input type='submit' value='Añadir canción a playlist'>";
				echo '<br>';
				echo '</form>';
				echo '<br>';

				$groups = $this->Track_info_model->get_groups($username);
				echo "<form method='post' action='/soundcloud/index.php/track_info_controller/add_to_group/'>";
				
				echo "<input type='hidden' name='oidTrack' value='$res->OID'>";
				echo '<select name ="oidGroup">';
				foreach($groups->result() as $row)
				{
					echo "<option value='$row->OID'>$row->Group_Name</option>";
				}
				echo '</select>';
				echo "<input type='submit' value='Añadir canción a grupo'>";
				echo '<br>';
				echo '</form>';
			}


			foreach($comments->result() as $row)
			{
				echo '<tr>';

				echo "<td> $row->Time </td>";

				echo "<td> $row->User_Name </td>";

				echo "<td> $row->Comentario </td>";

				echo '</tr>';
			}
		?>
	</table>
</main>

</body>
</html>
