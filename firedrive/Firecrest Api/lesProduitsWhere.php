<?php
	require_once ("controleur/controleur.class.php");
	require_once ("modele/config_bdd.php");

	if (isset($_REQUEST['libelle']))
	{

	$where=array("libelle"=> $_REQUEST['libelle']);

	Controleur::connexion($host, $bdd, $user, $mdp);
	print(Controleur::selectAllProduitsWhere($where));

	}
?>
