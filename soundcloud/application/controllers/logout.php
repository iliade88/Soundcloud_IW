<?php 

class Logout extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->session->sess_destroy();
	}

	public function index()
	{
		$this->load->view('home_view');
	}
}
?>