<?php
  class Users extends CI_MODEL{


      function __construct()
      {
        parent::__construct();
        // Make the database available to all the methods
        $this->load->database();
      }

      public function search($valor, $pag)
      {
        $this->db->like("User_Name", $valor);
        $this->db->or_like("Full_Name", $valor)->limit(10, $pag*10);;
        $consulta = $this->db->get("user");
        return $consulta->result();
      }
  }
?>
