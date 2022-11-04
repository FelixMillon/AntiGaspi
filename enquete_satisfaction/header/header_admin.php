<header class="d-flex flex-wrap align-items-center justify-content-around justify-content-md-around py-2 mb-4 border-bottom colorHeader">
  <a href="index.php?page=0" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none" >
    <img src="img/logo1.png" class="bi me-2 img" style="width: 10vw;" role="img" alt="">
  </a>
  

  <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
    <li><a href="index.php?page=4" class="nav-link px-2 link-light">Enquête</a></li>
    <li><a href="index.php?page=16" class="nav-link px-2 link-light">Gestion Enquête</a></li>

  </ul>

  <ul class="nav col-12 col-md-auto mb-2 justify-content-end mb-md-0" style="padding-left: 17%;">
  <?php
    if(!isset($_SESSION['email']))
    {
      echo'<li><a href="index.php?page=15" class="nav-link px-2 link-light">Se Connecter</a></li>
      <li><a class="px-2 text-light align-item-center"> NOM PRENOM </a></li>';
    }else{
      echo'<li><a href="index.php?page=100" class="nav-link px-2 link-light">Se Déconnecter</a></li>
      <li><a class="nav-link px-2 link-light"> '.$_SESSION['prenom'].' '.$_SESSION['nom'].' </a></li>';
    }
  ?>

         
  </ul>
</header>