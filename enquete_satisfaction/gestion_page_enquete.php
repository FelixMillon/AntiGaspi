<?php
	$unControleur->setTable("sujet");//se mettre sur la bonne table
	$tab=null;
	if(!isset($_COOKIE['moyenne']))
	{
		setcookie('moyenne', 0, time()+3600*24, '/');
	}
	if(!isset($_COOKIE['numquestion']))
	{
		setcookie('numquestion', 1, time()+3600*24, '/');
	}
	if(!isset($_COOKIE['id_enquete']))
	{
		setcookie('id_enquete', 1, time()+3600*24, '/');
	}
	$where = array('numquestion'=>$_COOKIE['numquestion'],'id_enquete'=>$_COOKIE['id_enquete']);
	$laQuestion=$unControleur->selectWhere($where);
	$where2 = array('id_enquete'=>$_COOKIE['id_enquete']);
	$nbrQuestions=$unControleur->countWhere($where2);
	//$lesEnquetes = $unControleur->selectAll();

    require_once("vue/page_enquete.php");//appel ta page

?>