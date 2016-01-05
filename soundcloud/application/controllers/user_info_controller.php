<?php 

class User_info_controller extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		
		//$this->load->helper('url');
	}

	public function index()
	{
		$data['oid'] = $_GET['oid'];
		$output['user'] = $this->get_user_info($data['oid']);
		$output['tracks'] = $this->get_tracks($data['oid']);
		$this->load->view('user_info_view', $output);
	}

	public function get_user_info($oid)
	{
		return $this->db->query("SELECT * FROM user WHERE OID = $oid");
	}

	public function get_tracks($oid)
	{
		return $this->db->query("SELECT * FROM track WHERE Uploader = $oid");
	}
}