<?php
	class Track_info_model extends CI_Model {

		function __construct()
		{
			parent::__construct();
			$this->load->database();
		}
		public function get_playlists($username)
		{
			return $this->db->query("SELECT Name, OID FROM playlist WHERE Author='$username'");
		}

		public function get_groups($username)
		{
			return $this->db->query("SELECT OID, Group_Name FROM `group` JOIN user_group ON OID = OID_Group WHERE Name='$username'");
		}

		public function update_N_Tracks_playlist($oid)
		{
			$this->db->query("UPDATE playlist SET N_Tracks = N_Tracks + 1 WHERE OID = $oid");
		}

	}


?>