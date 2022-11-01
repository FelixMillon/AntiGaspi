<h2>Insertion d'une nouvelle enquête</h2>

<form method="post">
	<table border="0">
		<tr>
				<td>libellé de l'enquête</td>
				<td><input type="text" name="libelle" value="<?php if($uneEnquete != null) echo $uneEnquete['libelle']; ?>">
				</td>
		</tr>
		<tr>
				<td>description de l'enquête</td>
				<td><input type="text" name="description_enquete" value="<?php if($uneEnquete != null) echo $uneEnquete['description_enquete']; ?>">
				</td>
		</tr>
		
		<tr>
				<td><input type="reset" name="Annuler" value="Annuler"></td>
				<td><input type="submit" 
				<?php 
				if (/*$uneEnquete != null*/ 1==1)
					echo ' name ="Modifier" value="Modifier">'; 
				else
					echo ' name="Valider" value="Valider">';
				?>
				</td>
		</tr>		
	</table>
</form>

<?php
    $unControleur->setTable ("enquete");   
    if(isset($_POST['Modifier']))
    {   
        $uneEnquete = $unControleur->selectWhere("*", array("id_enquete"=>$_GET['id_enquete']));

        $where = array("id_enquete"=>$_GET['id_enquete']);
		$tab=array(           
            "libelle"=>$_POST["libelle"], 
            "description_enquete"=>$_POST["description_enquete"]
			);
		$unControleur->update ($tab, $where); 
    }

    if (isset($_POST['Valider']))
    {
        $tab=array(           
            "libelle"=>$_POST["libelle"], 
            "description_enquete"=>$_POST["description_enquete"]
			);

		$unControleur->insert ($tab); 
    }
    
?>