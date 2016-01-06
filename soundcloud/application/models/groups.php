<?php
  class Groups extends CI_MODEL{


      function __construct()
      {
        parent::__construct();
        // Make the database available to all the methods
        $this->load->database();
      }

      function search($valor)
      {
        $this->db->like("Name", $valor);
        $consulta = $this->db->get("user_group");
        return $consulta->result();
      }
  }
?>
