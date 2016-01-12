<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
session_start(); //we need to call PHP's session object to access it through CI
class Login_controller extends CI_Controller {

  function __construct()
  {
    parent::__construct();
    $this->load->library('session');
    $this->load->database();
  }

  function index()
  {
      $this->load->view('login_view');
  }

  function Login()
  {
 	$username = $this->input->post('username');
  	$pass = $this->input->post('pass');
  	$valid = $this->verifyLogin($username, $pass);
	if($valid)
	{

    $query = $this->db->query("SELECT OID FROM user WHERE User_Name = '$username'");
    $results=$query->row();
    $this->session->set_userdata('OID', $results->OID);
		$name = $this->input->post('username');
		echo "Bienvenido $name";
		$this->session->set_userdata('username', $name);
		$this->load->view('home_view');
	}else{
    	$this->index();
  	}
  }

  function verifyLogin($username, $pass)
  {
  	$valid = false;
  	if($username && $pass)
  	{
  		$query = $this->db->query("SELECT Password FROM user WHERE User_Name = '$username'");
  		if($query->num_rows >0){
	  		$res = $query->row();
	  		if($res->Password == $pass){ $valid = true;}
  		}


  	}
  	if($valid == false)
  	{
  		echo '<p style="color:red">Incorrect username or password</p>';
  	}
  	return $valid;
  }
}

?>
