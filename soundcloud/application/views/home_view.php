<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Soundcloud</title>
  <?php require_once('requires.php'); ?>
</head>
<body>
  <?php require_once('menu.php'); ?>
  <h1>Home</h1>
  <?php
  if(isset($username)){
    echo "<h2>Welcome {{$username}} !</h2>";
  }
  ?>

  <h3>Most listened songs</h3>
  <table>
    <tr>
      <?php

      for ($i=0; $i < count($moreListenedSongs) ; $i++) {
        echo "<td><a href='/soundcloud/index.php/track_info_controller?oid={$moreListenedSongs[$i]->OID}'>".$moreListenedSongs[$i]->Name."</a></td>";
      }
      ?>
    </tr>
  </table>
</body>
</html>
