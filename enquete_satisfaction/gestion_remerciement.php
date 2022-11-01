<?php
$unControleur->setTable("avis_enquete"); //se mettre sur la bonne table

if(isset($_POST['Envoyer']))
{
	for($i=1; $i<=$_COOKIE['numquestion'];$i++)
	{
		$lareponse = str_replace( array( '%', '@', '\'','"', ';', '<', '>' ), '', $_POST['commentaire']);
		$lecookie = 'reponse_'.$_COOKIE['id_enquete'].'_'.$i;
		$tab= array($lareponse,$_COOKIE[$lecookie],$i,$_COOKIE['id_enquete'],0);
		$unControleur->callproc('insertavis',$tab);
	}
}
require_once("vue/remerciement.php");
?>