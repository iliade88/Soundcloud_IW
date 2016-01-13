<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
session_start(); //we need to call PHP's session object to access it through CI
class prueba_controller extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
		//$name = $_POST['username'];
		//$this->session->set_userdata('username', $name);
	}

	public function index()
	{
		$passwords[0] = "Aucan1234";
		$passwords[1] = "venetian";
		$passwords[2] = "Aphex234";
		$passwords[3] = "Aria1234";
		$passwords[4] = "pomoricky";
		$passwords[5] = "clapclap";
		$passwords[6] = "diplo89";
		$passwords[7] = "BjorkErika";
		$passwords[8] = "Gell1995";
		$passwords[9] = "gorogoncitymusic";
		$passwords[10] = "freddy12";
		$passwords[11] = "hudmo";
		$passwords[12] = "Morrissey";
		$passwords[13] = "EMPofTSun";
		$passwords[14] = "reminiscens";
		$passwords[15] = "ryanjamesmusic";
		$passwords[16] = "zeddy-d";
		$passwords[17] = "Fedeelmuz";
		$passwords[18] = "safari90s";
		$passwords[19] = "duskycall";
		$passwords[20] = "AOKIDJ";
		$passwords[21] = "weeknd2015";
		$passwords[22] = "yokoono1949";
		$passwords[23] = "tokiwoki";
		
		for ($i=0; $i < 24; $i++) { 

			$password = $passwords[$i];
			$cost = 10;

			$salt = strtr(base64_encode(mcrypt_create_iv(16, MCRYPT_DEV_URANDOM)), '+', '.');

			$salt = sprintf("$2a$%02d$", $cost) . $salt;

			$hash = crypt($password, $salt);

			$this->db->query("UPDATE user SET Password = '$hash' WHERE Password = '$password'");
		}
		

		$this->load->view('prueba_view');
	}
}