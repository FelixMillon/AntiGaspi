<h2>Insertion d'une question</h2>

<form method="post">
	<table border="0">
		<tr>
				<td>Numéro de la question : </td>
				<td><input type="number" name="numquestion" value="<?php if($unSujet != null) echo $unSujet['numquestion']; ?>">
				</td>
		</tr>
		<tr>
				<td>Libellé de la question : </td>
				<td><input type="text" name="libelle" value="<?php if($unSujet != null) echo $unSujet['libelle']; ?>">
				</td>
		</tr>
		<tr>
				<td>Question : </td>
				<td><input type="text" name="question" value="<?php if($unSujet != null) echo $unSujet['question']; ?>">
				</td>
		</tr>
		<tr>
				<td>Type de question : </td>
				<td><select name="type_question">
					<option value="note" <?php if($unSujet != null && $unSujet['type_question']=='note') echo "selected"; ?> > Question à note </option>
					<option value="note_image" <?php if($unSujet != null && $unSujet['type_question']=='note_image') echo "selected"; ?> > Question à note avec image </option>
					<option value="qcm" <?php if($unSujet != null && $unSujet['type_question']=='qcm') echo "selected"; ?> > Question à choix multiple </option>
					<option value="qcm_image" <?php if($unSujet != null && $unSujet['type_question']=='qcm_image') echo "selected"; ?> > Question à choix multiple avec image </option>
                    <option value="qcu" <?php if($unSujet != null && $unSujet['type_question']=='qcu') echo "selected"; ?> > Question à choix unique </option>
                    <option value="qcu_image" <?php if($unSujet != null && $unSujet['type_question']=='qcu_image') echo "selected"; ?> > Question à choix unique avec image </option>
				</select></td>
		</tr>
		<tr>
				<td>Réponse (séparé de " | "): </td>
				<td><input type="text" name="reponse" value="<?php if($unSujet != null) echo $unSujet['reponse']; ?>">
				</td>
		</tr>
		
		<tr>
				<td>Enquête concernée</td>
				<td><select name ="id_enquete">
					<?php 
						$unControleur->setTable ("enquete");
						$chaine="*";
						$lesEnquetes=$unControleur->selectAll($chaine);
						foreach($lesEnquetes as $uneEnquete){
							echo "<option value='".$uneEnquete['id_enquete']."'>".$uneEnquete['id_enquete']." ".$uneEnquete['libelle']."</option>";
						}
					 ?>
				</select>
				</td>
		</tr>
		<tr>
				<td><input type="reset" name="Annuler" value="Annuler"></td>
				<td><input type="submit" 
				<?php 
				if (/*$unSujet != null*/ 1==1)
					echo ' name ="Modifier" value="Modifier">'; 
				else
					echo ' name="Valider" value="Valider">';
				?>
				</td>
		</tr>		
	</table>
</form>

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
