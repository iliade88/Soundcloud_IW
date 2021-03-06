<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
//CONTROLADOR PARA EL CRUD DE CATEGORY
class Category extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		$this->load->helper('url');

		$this->load->library('grocery_CRUD');
	}

  public function index()
  {
		if($this->session->userdata("Admin")){
			$this->show();
		}
		else{
			redirect('/');
		}
  }

	public function show()
	{
    $this->grocery_crud->set_theme('datatables');
    $this->grocery_crud->set_table('category');
    $output = $this->grocery_crud->render();
		$this->load->view('crud_view.php',$output);
	}

}
