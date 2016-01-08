<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <!-- Botón para mostrar menú en dispositivos móviles -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menumov">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="/soundcloud/">Soundcloud</a>
  </div>
  <!-- Enlaces del menú -->
  <div class="collapse navbar-collapse" id="menumov">
    <ul class="nav navbar-nav">
      <li><a href="/soundcloud/index.php/search">Search</a></li>
      <?php
          if($this->session->userdata("username"))
          {?>
          <?php echo ($this->session->userdata("username")); ?>
            <li><a href="/soundcloud/index.php/login">Logout</a></li>
            <?php
            }
          else
            {
              ?>
                <li><a href="/soundcloud/index.php/login">Login</a></li>
              <?php 
            } 
              ?>
      


    </ul>
  </div>
</div>
</nav>

    