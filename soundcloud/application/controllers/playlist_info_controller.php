<?php 

class Playlist_info_controller extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		
		//$this->load->helper('url');
	}

	public function index()
	{
		$data['oid'] = $_GET['oid'];
		$output['playlist'] = $this->get_playlist_info($data['oid']);
		$output['tracks'] = $this->get_tracks($data['oid']);
		$this->load->view('playlist_info_view', $output);
	}

	public function get_playlist_info($oid)
	{
		return $this->db->query("SELECT * FROM playlist WHERE OID = $oid");
	}

	public function get_tracks($oid)
	{
		return $this->db->query("SELECT track.Name track_name, track.Top_Category track_category FROM track JOIN playlist_tracks ON track.OID = playlist_tracks.OID_Track WHERE playlist_tracks.OID_Playlist = 1");
	}
}