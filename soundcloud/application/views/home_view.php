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
  <table class="table-striped table-condensed table-hover">
      <?php

      for ($i=0; $i < count($moreListenedSongs) ; $i++) {
        echo "<tr><td><img style='width: 100px; height: 100px;' src='{$moreListenedSongs[$i]->Image}'></td><td><a href='/soundcloud/index.php/track_info_controller?oid={$moreListenedSongs[$i]->OID}'>".$moreListenedSongs[$i]->Name."</a></td><td>{$moreListenedSongs[$i]->Artist}</td></tr>";
      }
      ?>
  </table>
  <script type="text/javascript">
    //Evento para que al hacer clic en la tabla se muestre la información de dicho elemento
    $('tr').live("click",function() {
          window.location.href = $(this).find("a").attr("href");
    });
  </script>
</body>
</html>
