<?php
Class User extends CI_Model
{
	function login($username, $password)
	{
		$this -> db -> select('OID, User_Name, Password');
		$this -> db -> from('user');
		$this -> db -> where('User_Name = ' . "'" . $username . "'"); 
		$this -> db -> where('Password = ' . "'" . ($password) . "'"); 
		$this -> db -> limit(1);

		$query = $this -> db -> get();

		if($query -> num_rows() == 1)
		{
			return $query->result();
		}
		else
		{
			return false;
		}

	}
}
?>