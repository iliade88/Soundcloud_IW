<? php
	class Track_model extends CI_Model {

		public function get_tracks()
		{
			return $this->db->query('SELECT * FROM track');
		}
	}


?>