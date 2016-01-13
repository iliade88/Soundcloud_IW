<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
//CONTROLADOR PARA EL CRUD DE TRACK
class Track extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		$this->load->helper('url');

		$this->load->library('grocery_CRUD');
		$this->load->model('Track_model');
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

	public function show() //Muestra una tabla con el CRUD de track
	{
		$this->grocery_crud->set_theme('datatables');
		$this->grocery_crud->set_table('track');
		$output = $this->grocery_crud->render();
		$this->load->view('crud_view.php',$output);
	}
	public function write_comment()
	{
		$minute=$this->input->post("minute");
		$sec=$this->input->post("sec");
		$comment=$this->input->post("comment");
		$hora = $this->input->post("hora");
		if($hora!=0){
			$time=$hora.":".$minute.":".$sec;
		}
		else{
			$time="0:".$minute.":".$sec;
		}

		$track=$this->input->post("track");
		$data=array(
			"Comentario"=>$comment,
			"Time"=>$time,
			"user"=>$this->session->userdata ("username"),
			"Track"=>$track
		);
		if($this->db->insert('Timeline',$data)){
			echo "<br><br><br><h1>HEMOS INSERTAO</h1>";
		}
		else{
			echo "<br><br><br><h1>FALLOOO</h1>";
		}
		redirect('track_info_controller?oid='.$track);


	}
}
