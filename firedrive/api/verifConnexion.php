<?php
	require_once ("controleur/controleur.class.php");
	require_once ("modele/config_bdd.php");


	if (isset($_REQUEST['email']) && isset($_REQUEST['mdp']))
	{
		$emailLivreur = $_REQUEST['email'];
		$mdpLivreur = $_REQUEST['mdp'];

		Controleur::connexion($host, $bdd, $user, $mdp);
		print(Controleur::verifConnexion ($emailLivreur, $mdpLivreur));
	}
?>