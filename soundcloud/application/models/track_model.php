<?php
  class Track_model extends CI_MODEL{


      function __construct()
      {
        parent::__construct();
        // Make the database available to all the methods
        $this->load->database();
      }

      function search($valor, $pag)
      {
        $this->db->like("Name", $valor)->limit(10, $pag*10);
        $consulta = $this->db->get("track");
        return $consulta->result();
      }

      function moreListenedSongs() //Get 10 more listened songs
      {
        $this->db->order_by("N_Plays", "desc")->limit(10);
        $consulta = $this->db->get("track");
        return $consulta->result();
      }
  }
?>
