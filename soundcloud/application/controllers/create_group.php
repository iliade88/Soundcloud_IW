<?php

class Create_group extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		$this->load->model('Track_model');
	}

	public function index()
	{
		$username = $this->session->userdata('username');
		if($username)
		{
			$this->load->view('create_group_view');
		}else{
			$this->load->view('login_view');
		}
	}

	public function Create()
	{
		$username = $this->session->userdata('username');
		$name = $this->input->post('Name');
		$this->db->query("INSERT INTO `group` (Group_Name) VALUES('$name')");
		$data['moreListenedSongs'] = $this->Track_model->moreListenedSongs();
		$this->load->view('home_view', $data);
	}
}