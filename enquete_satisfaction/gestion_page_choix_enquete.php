<head>
    <title>FireCrest | Participation</title>
</head>

<?php
	$unControleur->setTable("enquete"); //se mettre sur la bonne table
	
	$nbrEnquetes=$unControleur->count();
	setcookie('numquestion', 1, time()+3600*24, '/');

	$lesEnquetes = $unControleur->selectAll();
	
    require_once("vue/page_choix_enquete.php");//appel ta page

?>