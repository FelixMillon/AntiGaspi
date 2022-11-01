<?php
$unControleur->setTable("avis_enquete"); //se mettre sur la bonne table

require_once("vue/remerciement.php");
if(isset($_POST['Envoyer']))
{
	for($i=1; $i<=$_COOKIE['numquestion'];$i++)
	{
		$lecookie = 'reponse_'.$_COOKIE['id_enquete'].'_'.$i;
		$tab= array($_COOKIE[$lecookie],$i,$_COOKIE['id_enquete'],0);
		$unControleur->callproc('insertavis',$tab);
	}
	$lareponse = str_replace( array( '%', '@', '\'','"', ';', '<', '>' ), '', $_POST['commentaire']);
	$tab= array(
		'reponse'=>$lareponse,
		'ville'=>$_COOKIE['villepers'],
		'tranche_age'=>$_COOKIE['agepers'],
		'civilite'=>$_COOKIE['civil'],
		'note'=>$_COOKIE['moyenne'],
		'id_enquete'=>$_COOKIE['id_enquete'],
		'id_consommateur'=>0
	);
	$unControleur->insert($tab);
	header("location: index.php?page=4");
}

?>