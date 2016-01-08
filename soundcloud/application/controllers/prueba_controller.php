<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
session_start(); //we need to call PHP's session object to access it through CI
class prueba_controller extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$name = $_POST['username'];
		$this->session->set_userdata('username', $name);
	}

	public function index()
	{
		$this->load->view('prueba_view');
	}
}