<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	

	<?php require_once('requires.php'); ?>
</head>
<body>
<?php require_once('menu.php'); ?>
<main>
	<h1>Group Info</h1>
	<?php 
		$res = $group->row(); 
	?>
	<table border="1">
		<tr>
			<td> Name </td>
			<td><?php
				echo $res->Group_Name;
			?></td>
		</tr>
	</table>
	<table width="50%">
		<th width="50%" >User</th>
		<th width="50%">Location</th>
		<?php
			foreach($user->result() as $row)
			{
				echo '<tr>';

				echo "<td> $row->user_name </td>";

				echo "<td> $row->Location </td>";

				echo '</tr>';
			}
		?>
	</table>
	<?php 
		if($this->session->userdata('username')) 
		{
			$username = $this->session->userdata('username');
    		$query = $this->db->query("SELECT * FROM user_group WHERE OID_Group = " . $res->OID . " AND Name = '$username'");
			if($query->num_rows() > 0)
			{
				echo 'Usted ya está unido a este grupo, para salir pulse ';
				echo "<a href='/soundcloud/index.php/group_info_controller/del_user_from_group/" . $res->OID . "' > aqui</a>";
	
			}else
			{
				echo 'No está unido a este grupo, unase ';
				echo "<a href='/soundcloud/index.php/group_info_controller/add_user_to_group/" . $res->OID . "' > aqui</a>";
			}
		}

	?>
</main>

</body>
</html>