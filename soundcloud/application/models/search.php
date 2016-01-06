<?php
class Search extends CI_MODEL{
  function Search()
  {
    parent::Model();

    // Make the database available to all the methods
    $this->load->database();
  }

}
?>
