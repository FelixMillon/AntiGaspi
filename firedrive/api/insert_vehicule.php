<?php
	
	require_once ("controleur/controleur.class.php");
	require_once ("modele/config_bdd.php");

	if (isset($_REQUEST['immatriculation']) && isset($_REQUEST['annee_fabrication']) && isset($_REQUEST['poids_max'])  && isset($_REQUEST['volume'])  && isset($_REQUEST['energie']) && isset($_REQUEST['cons_100_km']) && isset($_REQUEST['id_type_vehicule']))
	{


		$tab=array(
		"immatriculation"=>$_REQUEST['immatriculation'],
		"poids_max"=>$_REQUEST['poids_max'], 
		"annee_fabrication"=>$_REQUEST['annee_fabrication'], 
		"volume"=>$_REQUEST['volume'], 
		"energie"=>$_REQUEST['energie'],
		"cons_100_km"=>$_REQUEST['cons_100_km'], 
		"id_type_vehicule"=>$_REQUEST['id_type_vehicule']);

		Controleur::connexion($host, $bdd, $user, $mdp);
		print(Controleur::insert_vehicule ($tab));
	}
?>