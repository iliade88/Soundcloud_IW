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
				$time=$res->Length;
				$minutos_song=floor ($time/60);
				$sec_song=$time-($minutos_song*60);
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

	<table width="100%">
		<th width="15%" >Minute</th>
		<th width="15%" >Author</th>
		<th width="70%">Comment</th>
		<?php
			foreach($comments->result() as $row)
			{
				echo '<tr>';

				echo "<td> $row->Time </td>";

				$time=$row->Time;
				$minutos=floor ($time/60);
				$sec=$time-($minutos*60);
				echo "<td>$minutos:$sec</td>";



				echo "<td> $row->User_Name </td>";

				echo "<td> $row->Comentario </td>";

				echo '</tr>';

			}

		?>
	</table>
</main>
<form class="form-inline" action "/soundcloud/index.php/track/write_comment" method="POST"> 
<fieldset>
<legend> Write a comment: </legend> 
<div class="row">
	<div class="form-group">
	<label for="minute"> Minute</label>
	<select class="form-control" id="minute">
		<?php
		for ($i=0; $i <=$minutos_song; $i++) { 
			echo "<option>$i</option>";
		}
		?>
	</select>
	<select class="form-control" id="sec">
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
