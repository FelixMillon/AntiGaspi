<?php
	require_once ("controleur/controleur.class.php");
	require_once ("modele/config_bdd.php");

	if (isset($_REQUEST['immatriculation']))
	{

	$where=array("immatriculation"=> $_REQUEST['immatriculation']);

	Controleur::connexion($host, $bdd, $user, $mdp);
	print(Controleur::selectAllVehiculesWhere($where));

	}
?>
