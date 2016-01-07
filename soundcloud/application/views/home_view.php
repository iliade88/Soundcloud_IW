<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Simple Login with CodeIgniter - Private Area</title>
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
  <a href="home/logout">Logout</a>
</body>
</html>
