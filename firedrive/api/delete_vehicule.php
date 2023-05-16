<?php
	
	require_once ("controleur/controleur.class.php");
	require_once ("modele/config_bdd.php");

	if (isset($_REQUEST['id_vehicule']))
	{

		$where=array("id_vehicule"=> $_REQUEST['id_vehicule']);

		Controleur::connexion($host, $bdd, $user, $mdp);
		print(Controleur::delete_vehicule ($where));
	}
?>


