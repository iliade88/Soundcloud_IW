<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
session_start(); //we need to call PHP's session object to access it through CI
class Index extends CI_Controller {

  function __construct()
  {
    parent::__construct();
    $this->load->Model('Track_model');
  }

  function index()
  {
    $data['moreListenedSongs'] = $this->Track_model->moreListenedSongs();
    $this->load->view('home_view', $data);
  }

}

?>
