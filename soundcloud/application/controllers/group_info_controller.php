<?php 

class Group_info_controller extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		
		//$this->load->helper('url');
	}

	public function index()
	{
		$data['oid'] = $_GET['oid'];
		$output['group'] = $this->get_group_info($data['oid']);
		$output['user'] = $this->get_user_info($data['oid']);
		$this->load->view('group_info_view', $output);
	}

	public function get_group_info($oid)
	{
		return $this->db->query("SELECT * FROM `group` WHERE OID = $oid");
	}

	public function get_user_info($oid)
	{
		return $this->db->query("SELECT user.User_Name user_name, user.Location Location FROM user JOIN user_group ON user.User_Name = user_group.Name WHERE user_group.OID_Group = $oid");
	}
}