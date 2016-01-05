<?php 

class Group_info_controller extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		
		//$this->load->helper('url');
	}

	public function index()
	{
		$data['oid'] = $_GET['oid'];
		$output['group'] = $this->get_group_info($data['oid']);
		$output['tracks'] = $this->get_tracks_info($data['oid']);
		$this->load->view('group_info_view', $output);
	}

	public function get_group_info($oid)
	{
		return $this->db->query("SELECT * FROM groups WHERE OID = $oid");
	}

	public function get_tracks_info($oid)
	{
		return $this->db->query("SELECT track.Name track_name, track.Top_Category track_category FROM track JOIN group_track ON track.OID = group_track.OID_Track WHERE group_track.OID_Group = $oid");
	}
}