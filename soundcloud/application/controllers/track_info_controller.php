<?php 

class Track_info_controller extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		$this->load->model('Track_info_model');
		//$this->load->helper('url');
	}

	public function index()
	{
		$data['oid'] = $_GET['oid'];
		$output['track'] = $this->get_track_info($data['oid']);
		$output['comments'] = $this->get_comments($data['oid']);
		$this->load->view('track_info_view', $output);
	}

	public function index2($oid, $message)
	{
		$output['track'] = $this->get_track_info($oid);
		$output['comments'] = $this->get_comments($oid);
		echo $message;

		$this->load->view('track_info_view', $output);
	}

	public function get_track_info($oid)
	{
		return $this->db->query("SELECT * FROM track WHERE OID = $oid");
	}

	public function get_comments($oid)
	{
		return $this->db->query("SELECT Time, User_Name, Comentario FROM timeline JOIN User ON User.OID = Timeline.User WHERE Track = $oid");
	}

	public function add_to_playlist()
	{
		$oidTrack = $this->input->post('oidTrack');
		$oidPlaylist = $this->input->post('oidPlaylist');
		$message = "";
		if($this->verify_track($oidTrack, $oidPlaylist))
		{
			$message = "<p style='color:blue'>Track added to the playlist</p>";
			$this->db->query("INSERT INTO playlist_tracks (OID_Playlist, OID_Track) VALUES($oidPlaylist, $oidTrack)");
			$this->Track_info_model->update_N_Tracks_playlist($oidPlaylist);
		}else{
			$message = "<p style='color:blue'>Track already in the playlist</p>";
		}
		
		$this->index2($oidTrack, $message);
	}

	public function verify_track($oidTrack, $oidPlaylist)
	{
		$res = $this->db->query("SELECT * FROM playlist_tracks WHERE OID_Playlist = $oidPlaylist AND OID_Track = $oidTrack");
		if($res->num_rows() > 0)
		{
			return FALSE;
		}else{
			return TRUE;
		}
	}

	public function add_to_group()
	{
		$oidTrack = $this->input->post('oidTrack');
		$oidGroup = $this->input->post('oidGroup');
		$message = "";
		if($this->verify_track_group($oidTrack, $oidGroup))
		{
			$message = "<p style='color:blue'>Track added to the group</p>";
			$this->db->query("INSERT INTO group_track (OID_Group, OID_Track) VALUES($oidGroup, $oidTrack)");
		}else{
			$message = "<p style='color:blue'>Track already in the group</p>";
		}
		
		$this->index2($oidTrack, $message);
	}

	public function verify_track_group($oidTrack, $oidGroup)
	{
		$res = $this->db->query("SELECT * FROM group_track WHERE OID_Group = $oidGroup AND OID_Track = $oidTrack");
		if($res->num_rows() > 0)
		{
			return FALSE;
		}else{
			return TRUE;
		}
	}
}