<?php

class Logout extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->session->sess_destroy();
		$this->load->Model('Track_model');
	}

	public function index()
	{
		$data['moreListenedSongs'] = $this->Track_model->moreListenedSongs();
		$this->load->view('home_view', $data);
	}
}
?>