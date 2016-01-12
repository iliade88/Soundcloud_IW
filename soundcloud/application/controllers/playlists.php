<?php 

class playlisst extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		
	}

	public function index()
	{
		$username = $this->session->userdata('username');
		if($username)
		{
			$data['playlists'] = $this->db->query("SELECT * FROM playlist WHERE Author = '$username'");

			$this->load->view('playlists_view', $data);
		}else{
			$this->load->view('login_view');
		}
	}

}