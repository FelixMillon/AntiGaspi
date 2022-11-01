<?php
	require_once("controleur/config_bdd.php");
	require_once("controleur/controleur.class.php");
	$unControleur = new Controleur($serveur,$bdd,$user,$mdp);
?>


<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="js/style.css">
    <link rel="stylesheet" href="js/style_ambrine.css">
	<link rel="stylesheet" href="js/felix.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FireCrest | Pré-connexion </title>
</head>
<body>
<header class="d-flex flex-wrap align-items-center justify-content-around justify-content-md-around py-2 mb-4 border-bottom colorHeader">
              <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none" >
                <img src="img/logo1.png" class="bi me-2 img" style="width: 10vw;" role="img" alt="">
              </a>
              
        
              <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2 link-light">Collaborateur</a></li>
                <li><a href="#" class="nav-link px-2 link-light">Assistance</a></li>
                <li><a href="#" class="nav-link px-2 link-light">à propos</a></li>
              </ul>
        
              <div class="nav col-md-3 text-end" style="padding-left: 17%; white-space: nowrap;">
                <li><a href="#" class="nav-link px-2 link-light">Se Connecter</a></li>
              </div>
            </header>
	<center>

		<?php
			if(isset($_GET['page']))
			{
				$page = $_GET['page'];
			}else{
				$page = 0;
			}
    switch ($page) {
      case 0: require_once ("gestion_page_choix_enquete.php"); break;
      case 1: require_once ("gestion_question_perso.php"); break;
      case 2: require_once ("gestion_page_enquete.php"); break;
      case 3: require_once ("gestion_remerciement.php"); break;
      case 4: require_once ("gestion_dashboard.php"); break;
    }
		?>
	</center>
<footer class="d-flex flex-wrap align-items-center justify-content-around justify-content-md-around py-3 border-top colorHeader">
	<p class="col-md-4 mb-0 text-light" style="padding-left: 6%; white-space: nowrap;" >©Copyright 2022 FireCrest</p>

	<a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
	<svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
	</a>

	<ul class="nav col-md-4 justify-content-end" style="padding-right: 6%; white-space: nowrap;">
	<li class="nav-item"><a href="#" class="nav-link px-2 text-light">Mentions légales</a></li>
	<li class="nav-item"><a href="#" class="nav-link px-2 text-light">Conditions générle d'uilisation</a></li>
	</ul>
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <script src="js/gestion_cookie.js"></script>
</footer>
</body>
</html>