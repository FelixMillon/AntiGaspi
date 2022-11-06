<?php
    $unControleur->setTable("enquete");
    $lesEnquetes = $unControleur->selectAll();
    if (isset($_POST['Valider']))
    {
        $tab=array(     
            "libelle"=>$_POST["libelle"],
            "description_enquete"=>$_POST["description_enquete"]
			);
		$unControleur->insert($tab);
        $lesEnquetes = $unControleur->selectAll();
    }


    
    if (isset($_POST['Commencer']) and isset($_POST['id_enquete']))
    {
        $where=array('id_enquete'=>$_POST["id_enquete"]);
        $_COOKIE['session_id_enquete']= $_POST["id_enquete"];
        $uneEnquete = $unControleur->selectWhere($where);
        $_COOKIE['session_enquete']= $uneEnquete['libelle'];

        header("location: index.php?page=10");
    }
    require_once("vue/insert_enquete.php");
?>