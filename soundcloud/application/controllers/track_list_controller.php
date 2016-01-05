<?php 

class Track_list_controller extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		//$this->load->helper('url');
	}

	public function index()
	{
		$output['tracks'] = $this->get_tracks();
		$this->load->view('track_list_view', $output);
	}

	public function get_tracks()
	{
		return $this->db->query('SELECT * FROM track');
	}
}