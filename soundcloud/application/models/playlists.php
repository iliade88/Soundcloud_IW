<?php
  class Playlists extends CI_MODEL{


      function __construct()
      {
        parent::__construct();
        // Make the database available to all the methods
        $this->load->database();
      }

      function search($valor, $pag)
      {
        $this->db->like("Name", $valor)->limit(10, $pag*10);
        $consulta = $this->db->get("playlist");
        return $consulta->result();
      }
  }
?>
