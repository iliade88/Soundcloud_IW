<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
session_start(); //we need to call PHP's session object to access it through CI
class Index extends CI_Controller {

  function __construct()
  {
    parent::__construct();
  }

  function index()
  {
      $this->load->view('home_view');
  }

}

?>
