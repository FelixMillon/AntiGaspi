<?php
    $unControleur->setTable ("enquete");
    $lesEnquetes = $unControleur->selectAll();
    
    if (isset($_POST['Commencer']) and isset($_POST['id_enquete']))
    {
        $where=array('id_enquete'=>$_POST["id_enquete"]);
        $_SESSION['id_enquete']= $_POST["id_enquete"];
        $uneEnquete = $unControleur->selectWhere($where);
        $_SESSION['enquete']= $uneEnquete['libelle'];

        header("location: index.php?page=10");
    }
    require_once("vue/gestion_enquete.php");
?>