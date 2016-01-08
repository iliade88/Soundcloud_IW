<?php 

class Create_playlist extends CI_Controller {

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
			$this->load->view('create_playlist_view');
		}else{
			$this->load->view('login_view');
		}
	}

	public function Create()
	{
		$username = $this->session->userdata('username');
		$name = $this->input->post('Name');
		$this->db->query("INSERT INTO playlist (Name, N_Followers, N_Tracks, Author) VALUES('$name', 0, 0, '$username')");
		$this->load->view('home_view');
	}
}