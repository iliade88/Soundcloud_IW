<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
//CONTROLADOR PARA EL CRUD DE TRACK
class Track extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		$this->load->helper('url');

		$this->load->library('grocery_CRUD');
	}

  public function index()
  {
      $this->show();
  }

	public function show() //Muestra una tabla con el CRUD de track
	{
    $this->grocery_crud->set_theme('datatables');
    $this->grocery_crud->set_table('track');
    $output = $this->grocery_crud->render();
		$this->load->view('crud_view.php',$output);
	}

}
