<?php
	require_once("controleur/config_bdd.php");
	require_once("controleur/controleur.class.php");
	$unControleur = new Controleur($serveur,$bdd,$user,$mdp);
?>


<!DOCTYPE html>
<html>
<head>
	<title>test bdd</title>
</head>
<body>
	<center>

		<?php
		require_once("gestion_page_enquete.php");
		?>
	</center>
</body>
</html>