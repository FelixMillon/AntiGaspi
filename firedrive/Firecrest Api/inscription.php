<?php
	
	require_once ("controleur/controleur.class.php");
	require_once ("modele/config_bdd.php");

	if (isset($_REQUEST['email']) && isset($_REQUEST['mdp']) && isset($_REQUEST['nom'])  && isset($_REQUEST['prenom'])  && isset($_REQUEST['tel']) )
	{


		$tab=array(
		"email"=>$_REQUEST['email'],
		"mdp"=>$_REQUEST['mdp'], 
		"nom"=>$_REQUEST['nom'], 
		"prenom"=>$_REQUEST['prenom'], 
		"date_inscription"=>null, 
		"noteconfemp"=>null, 
		"tel"=>$_REQUEST['tel'], 
		"numrue"=>'numrue', 
		"rue"=>'rue', 
		"ville"=>'ville', 
		"cp"=>'cp',
		"id_vehicule"=>null,
		"notepublic"=>5,
		"valide"=>null);

		Controleur::connexion($host, $bdd, $user, $mdp);
		print(Controleur::inscription ($tab));
	}
?>
