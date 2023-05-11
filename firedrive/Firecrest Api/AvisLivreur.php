<?php
	require_once ("controleur/controleur.class.php");
	require_once ("modele/config_bdd.php");

	if (isset($_REQUEST['id_livreur']))
	{

	$where=array("id_livreur"=> $_REQUEST['id_livreur'], "id_commande"=> $_REQUEST['id_commande'], "note"=> $_REQUEST['note'], "commentaire"=> $_REQUEST['commentaire']);

	$tab=array(
		"id_commande"=>$_REQUEST['id_commande'],
		"id_livreur"=>$_REQUEST['id_livreur'], 
		"note"=>$_REQUEST['note'], 
		"commentaire"=>$_REQUEST['commentaire']);

	Controleur::connexion($host, $bdd, $user, $mdp);
	print(Controleur::AvisLivreur($tab));

	}

?>
