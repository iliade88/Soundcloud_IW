<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
session_start(); //we need to call PHP's session object to access it through CI
class Login_controller extends CI_Controller {

  function __construct()
  {
    parent::__construct();
    $this->load->library('session');
    $this->load->database();
    $this->load->model('Track_model');
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

    $query = $this->db->query("SELECT OID, Admin FROM user WHERE User_Name = '$username'");
    $results=$query->row();
    $this->session->set_userdata('OID', $results->OID);
    $this->session->set_userdata('Admin', $results->Admin);
		$name = $this->input->post('username');

		$this->session->set_userdata('username', $name);
    $data['moreListenedSongs'] = $this->Track_model->moreListenedSongs();
		$this->load->view('home_view', $data);
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
	  		//if($res->Password == $pass){ $valid = true;}
        $valid = $this->verifyPass($pass, $res->Password);
  		}


  	}
  	if($valid == false)
  	{
  		echo '<p style="color:red">Incorrect username or password</p>';
  	}
  	return $valid;
  }

  function verifyPass($passInput, $pass)
  {
    if(hash_equals($pass, crypt($passInput, $pass)))
    {
      return true;
    }else{
      return false;
    }
  }
}

?>
