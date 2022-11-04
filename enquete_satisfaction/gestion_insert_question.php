<?php
    $unControleur->setTable ("enquete");
    $lesEnquetes = $unControleur->selectAll();
    $unControleur->setTable ("sujet");
    if (isset($_POST['Valider']))
    {
        $reponses='';
        if(isset($_POST['reponse_6']))
        {
            $reponses= $_POST['reponse_1']."|".$_POST['reponse_2']."|".$_POST['reponse_3']."|".$_POST['reponse_4']."|".$_POST['reponse_5']."|".$_POST['reponse_6'];
        }elseif(isset($_POST['reponse_4']))
        {
            $reponses= $_POST['reponse_1']."|".$_POST['reponse_2']."|".$_POST['reponse_3']."|".$_POST['reponse_4'];
        }elseif(isset($_POST['reponse_3']))
        {
            $reponses= $_POST['reponse_1']."|".$_POST['reponse_2']."|".$_POST['reponse_3'];
        }elseif(isset($_POST['reponse_2']))
        {
            $reponses= $_POST['reponse_1']."|".$_POST['reponse_2'];
        }elseif(isset($_POST['reponse_1']))
        {
            $reponses= $_POST['reponse_1'];
        }else{
            $reponses=null;
        }
        $tab=array(           
            "numquestion"=>null,
            "libelle"=>$_POST["libelle"], 
            "question"=>$_POST["question"], 
            "type_question"=>$_POST["type_question"], 
			"reponse"=>$reponses,
            "id_enquete"=>$_SESSION['id_enquete']
			);
		$unControleur->insert ($tab);

    }

    require_once("vue/insert_question.php");
?>
