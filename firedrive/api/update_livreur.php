<?php
	
	require_once ("controleur/controleur.class.php");
	require_once ("modele/config_bdd.php");

	if (isset($_REQUEST['email']) && isset($_REQUEST['mdp']) && isset($_REQUEST['nom'])  && isset($_REQUEST['prenom'])  && isset($_REQUEST['tel']))
	{

		$where=array("id"=> $_REQUEST['id_livreur']);
		$tab=array(
		"email"=>$_REQUEST['email'],
		"mdp"=>$_REQUEST['mdp'], 
		"nom"=>$_REQUEST['nom'], 
		"prenom"=>$_REQUEST['prenom'], 
		"tel"=>$_REQUEST['tel']);

		Controleur::connexion($host, $bdd, $user, $mdp);
		Controleur::update_livreur ($tab,$where);
		print(Controleur::get_livreur ($_REQUEST['id_livreur']));
	}
?>


