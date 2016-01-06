<?php
  class Playlists extends CI_MODEL{


      function __construct()
      {
        parent::__construct();
        // Make the database available to all the methods
        $this->load->database();
      }

      function search($valor)
      {
        $this->db->like("Name", $valor);
        $consulta = $this->db->get("playlist");
        return $consulta->result();
      }
  }
?>
