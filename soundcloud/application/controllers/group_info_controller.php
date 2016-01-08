<?php 

class Group_info_controller extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		
	}

	public function index()
	{
		$data['oid'] = $_GET['oid'];
		$output['group'] = $this->get_group_info($data['oid']);
		$output['user'] = $this->get_user_info($data['oid']);
		$this->load->view('group_info_view', $output);
	}

	public function refresh($oid)
	{
		$data['oid'] = $oid;
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

	public function add_user_to_group($oid)
	{
		$username = $this->session->userdata('username');
		$this->db->query("INSERT INTO user_group (OID_Group, Name) VALUES('$oid', '$username')");
		$this->refresh($oid);
	}

	public function del_user_from_group($oid)
	{
		$username = $this->session->userdata('username');
		$this->db->query("DELETE FROM user_group WHERE OID_Group = $oid AND Name = '$username'");
		$this->refresh($oid);
	}
}