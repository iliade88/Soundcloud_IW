<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Soundcloud</title>
	<?php require_once('requires.php'); ?>
</head>
<body>
	<?php require_once('menu.php'); ?>
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

				//echo $res->Length;
				$time=$res->Length; //Length en segundos
				$minutos_song=floor($time/60); //Convertimos a minutos
				$horas_song = 0;
				if($minutos_song >= 60){ //Si hay más de 60 minutos, convertimos a horas
					$horas_song = floor($minutos_song / 60);
					$minutos_song = $minutos_song - ($horas_song*60);
				}
				$sec_song=$time-($minutos_song*60);
				if($horas_song!=0) echo $horas_song.":";
				echo "$minutos_song:$sec_song";
				?></td>
			</tr>
			<tr>
				<td> Uploaded </td>
				<td><?php
				echo $res->Uploaded;
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

		<table width="100%" class="table-striped">
			<thead>
				<tr>
					<th width="15%" >Minute</th>
					<th width="15%" >Author</th>
					<th width="70%">Comment</th>
				</tr>
			</thead>
			<tbody>
				<?php
				foreach($comments->result() as $row)
				{
					echo '<tr>';


					echo "<td> $row->Time </td>";

					echo "<td> $row->User_Name </td>";

					echo "<td> $row->Comentario </td>";

					echo '</tr>';

				}

				?>
			</tbody>
		</table>

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
		?>
	</main>
	<form class="form-inline" action="/soundcloud/index.php/track/write_comment" method="POST">
		<fieldset>
			<legend> Write a comment: </legend>
			<div class="row">
				<div class="form-group">
					<?php
					if($horas_song!=0){
						?>
						<select class="form-control" id="hora" name="hora">
							<?php
							for ($i=0; $i <=$horas_song; $i++) {
								echo "<option>$i</option>";
							}
							?>
						</select>
						<?php
					}
					?>
					<label for="minute">Time comment:</label>
					<select class="form-control" id="minute" name="minute">
						<?php
						for ($i=0; $i <=$minutos_song; $i++) {
							echo "<option>$i</option>";
						}
						?>
					</select>
					<select class="form-control" id="sec" name="sec">
						<?php
						for ($i=0; $i <=$sec_song; $i++) {
							echo "<option>$i</option>";
						}
						?>
					</select>
				</div>
			</div>
			<br>
			<input type= "hidden" name="track" value="<?php echo $res->OID ?>">
			<textarea class="form-controll" id="comment" name="comment"> </textarea> <br>
			<input type= "submit" class= "btn-primary" value ="Send">
		</fieldset>
	</form>

</body>
</html>
