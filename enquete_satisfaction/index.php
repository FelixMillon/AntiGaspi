<?php
  session_start();
  ob_start();
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
    
</head>
<body>
<?php
      $unControleur->setTable("utilisateur"); 
      $lesUtilisateurs = $unControleur->selectAll();
      $unControleur->setTable("employe"); 
      $lesEmployes = $unControleur->selectAll();
      $lesID = [];

      foreach($lesEmployes as $unEmploye){
        $lesID[count($lesID)]=$unEmploye['email'];
      }


			if(isset($_SESSION['email']) && in_array($_SESSION['email'], $lesID, true))
			{
				require_once ("header/header_admin.php");
			}else{
        require_once ("header/header_prospec.php");
			}

		?>

	<center>

		<?php
			if(isset($_GET['page']))
			{
				$page = $_GET['page'];
			}else{
				$page = 0;
			}
    switch ($page) {

      case 0: require_once ("vue/home.php"); break;
      
      case 1: require_once ("vue/collaborateur.php"); break;
      case 2: require_once ("vue/assistance.php"); break;
      case 3: require_once ("vue/a_propos.php"); break;
      case 4: require_once ("gestion_page_choix_enquete.php"); break;
      case 5: require_once ("vue/mention_legale.php"); break;
      case 6: require_once ("vue/condition_generale.php"); break;
      case 7: require_once ("vue/pre_inscription.php"); break;
      case 8: require_once ("vue/inscription.php"); break;
      case 9: require_once ("gestion_insert_enquete.php"); break;
      case 10: require_once ("gestion_insert_question.php"); break;
      case 11: require_once ("gestion_question_perso.php"); break;
      case 12: require_once ("gestion_page_enquete.php"); break;
      case 13: require_once ("gestion_remerciement.php"); break;
      case 14: require_once ("gestion_dashboard.php"); break;
      case 15: require_once ("gestion_connexion.php"); break;
      case 16: require_once ("gestion_gestion_enquete.php"); break;
      case 100: unset($_SESSION);
      session_destroy();
      header("Location: index.php");

      default : require_once("vue/home.php");  break;

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