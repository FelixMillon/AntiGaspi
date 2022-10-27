<?php
	$unControleur->setTable("client");
	$lesClients = $unControleur->selectAll();
	$tab=null;

    require_once("vue/page_enquete.php");

?>