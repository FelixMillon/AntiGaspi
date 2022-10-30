<?php
	$unControleur->setTable("enquete"); //se mettre sur la bonne table
	
	$nbrEnquetes=$unControleur->count();


	$lesEnquetes = $unControleur->selectAll();

    require_once("vue/page_choix_enquete.php");//appel ta page

?>