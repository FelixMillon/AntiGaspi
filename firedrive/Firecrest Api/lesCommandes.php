<?php
	require_once ("controleur/controleur.class.php");
	require_once ("modele/config_bdd.php");
	Controleur::connexion($host, $bdd, $user, $mdp);
	print(Controleur::selectAllCommandes());
?>
