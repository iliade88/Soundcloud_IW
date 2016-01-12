<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Search extends CI_Controller {

  public function __construct()
  {
    parent::__construct();

    $this->load->database();
    $this->load->helper('url');
    $this->load->model('Track_model');
    $this->load->model('Playlists');
    $this->load->model('Groups');
    $this->load->model('Users');
  }

  public function index()
  {
    $this->load->view("search_view");
  }

  public function buscarTrack(){
    if($this->input->is_ajax_request()){
      $buscar = $this->input->post("buscar");
      $datos = $this->Track_model->search($buscar);
      echo json_encode($datos);
    }
  }

  public function buscarPlaylist(){
    if($this->input->is_ajax_request()){
      $buscar = $this->input->post("buscar");
      $datos = $this->Playlists->search($buscar);
      echo json_encode($datos);
    }
  }

  public function buscarGroup(){
    if($this->input->is_ajax_request()){
      $buscar = $this->input->post("buscar");
      $datos = $this->Groups->search($buscar);
      echo json_encode($datos);
    }
  }

  public function buscarUsers(){
    if($this->input->is_ajax_request()){
      $buscar = $this->input->post("buscar");
      $datos = $this->Users->search($buscar);
      echo json_encode($datos);
    }
  }

}
