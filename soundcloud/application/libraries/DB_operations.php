<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class DB_operations {

  public static function ComprobarGrupo($oid) {
  	$username = $this->session->userdata('username');
    $query = $this->db->query("SELECT * FROM user_group WHERE OID_Group = $oid AND Name = $username");
    return $query;
  }
}