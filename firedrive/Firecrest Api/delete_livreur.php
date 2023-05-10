<?php
	
	require_once ("controleur/controleur.class.php");
	require_once ("modele/config_bdd.php");

	if (isset($_REQUEST['id_livreur']))
	{

		$where=array("id_livreur"=> $_REQUEST['id_livreur']);

		Controleur::connexion($host, $bdd, $user, $mdp);
		print(Controleur::delete_livreur ($where));
	}
?>


