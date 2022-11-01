<?php
	$unSujet=NULL;
?>

<div class="col-md-7 col-lg-8">
<h2>Insertion d'une question</h2>
<hr class="my-5">
        <form method="post">
          <div class="row g-3">
			<center>
            <div class="col-12" style="width:50%">
			  <input type="number"  class="form-control" placeholder="Numéro de la question" name="numquestion" value="<?php if($unSujet != null) echo $unSujet['numquestion']; ?>">
            </div>
	

			<div class="col-12" style="width:50%">
              <input type="text" class="form-control" placeholder="Libellé de la question" name="libelle" value="<?php if($unSujet != null) echo $unSujet['libelle']; ?>">
            </div>


			<div class="col-12" style="width:50%">
              <input type="text" class="form-control" placeholder="Question" name="question" value="<?php if($unSujet != null) echo $unSujet['question']; ?>">
            </div>


			<select class="form-select" style="width:50%">
					<option value="" selected disabled hidden> ---- Type de question ----</option>
					<option value="note" <?php if($unSujet != null && $unSujet['type_question']=='note') echo "selected"; ?> > Question à note </option>
					<option value="note_image" <?php if($unSujet != null && $unSujet['type_question']=='note_image') echo "selected"; ?> > Question à note avec image </option>
					<option value="qcm" <?php if($unSujet != null && $unSujet['type_question']=='qcm') echo "selected"; ?> > Question à choix multiple </option>
					<option value="qcm_image" <?php if($unSujet != null && $unSujet['type_question']=='qcm_image') echo "selected"; ?> > Question à choix multiple avec image </option>
                    <option value="qcu" <?php if($unSujet != null && $unSujet['type_question']=='qcu') echo "selected"; ?> > Question à choix unique </option>
                    <option value="qcu_image" <?php if($unSujet != null && $unSujet['type_question']=='qcu_image') echo "selected"; ?> > Question à choix unique avec image </option>
            </select>

			<div class="col-12" style="width:50%">
			  <input type="text"  class="form-control" placeholder="Réponse (séparé de '' | '' )" name="reponse" value="<?php if($unSujet != null) echo $unSujet['reponse']; ?>">
            </div>

			<select class="form-select" name ="id_enquete" style="width:50%">
			<option value="" selected disabled hidden> ---- Enquête concernée ---- </option>
					<?php 
						$unControleur->setTable ("enquete");
						$chaine="*";
						$lesEnquetes=$unControleur->selectAll($chaine);
						foreach($lesEnquetes as $uneEnquete){
							echo "<option value='".$uneEnquete['id_enquete']."'>".$uneEnquete['id_enquete']." ".$uneEnquete['libelle']."</option>";
						}
					 ?>
				</select>

			</center>
          </div>

          <hr class="my-5">
	
		  <input type="submit" class="btn btn-sm btn-outline-success"
				<?php 
				if ($uneEnquete != null)
					echo ' name ="Modifier" value="Modifier">'; 
				else
					echo ' name="Valider" value="Valider">';
				?>
		 <input type="reset" name="Annuler" value="Annuler" class="btn btn-sm btn-outline-danger" > 		 
        </form>
      </div>


<?php

    $unControleur->setTable ("sujet");   
    if(isset($_POST['Modifier']))
    {   
        $unSujet = $unControleur->selectWhere("*", array("id_sujet"=>$_GET['id_sujet']));

        $where = array("id_sujet"=>$_GET['id_sujet']);
		$tab=array(           
            "numquestion"=>$_POST["numquestion"],
            "libelle"=>$_POST["libelle"], 
            "question"=>$_POST["question"], 
            "type_question"=>$_POST["type_question"], 
			"reponse"=>$_POST["reponse"],
            "id_enquete"=>$_POST["id_enquete"]
			);
		$unControleur->update ($tab, $where); 
    }

    if (isset($_POST['Valider']))
    {
        $tab=array(           
            "numquestion"=>$_POST["numquestion"],
            "libelle"=>$_POST["libelle"], 
            "question"=>$_POST["question"], 
            "type_question"=>$_POST["type_question"], 
			"reponse"=>$_POST["reponse"],
            "id_enquete"=>$_POST["id_enquete"]
			);
		$unControleur->insert ($tab); 
    }
    
?>
