<?php 

class Track_info_controller extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		
		//$this->load->helper('url');
	}

	public function index()
	{
		$data['oid'] = $_GET['oid'];
		$output['track'] = $this->get_track_info($data['oid']);
		$output['comments'] = $this->get_comments($data['oid']);
		$this->load->view('track_info_view', $output);
	}

	public function get_track_info($oid)
	{
		return $this->db->query("SELECT * FROM track WHERE OID = $oid");
	}

	public function get_comments($oid)
	{
		return $this->db->query("SELECT * FROM timeline WHERE oid_track = $oid");
	}
}