<?php
	$uneEnquete = NULL;
?>




<div class="col-md-7 col-lg-8">
<h2>Insertion d'une nouvelle enquête</h2>
<hr class="my-5">
        <form method="post">
          <div class="row g-3">
			<center>
            <div class="col-12" style="width:50%">
              <label class="form-label">Libellé de l'enquête</label>
              <input type="text" class="form-control" name="libelle" value="<?php if($uneEnquete != null) echo $uneEnquete['libelle']; ?>">
            </div>
	

			<div class="col-12" style="width:50%">
              <label class="form-label">description de l'enquête</label>
              <input type="text" class="form-control" name="description_enquete" value="<?php if($uneEnquete != null) echo $uneEnquete['description_enquete']; ?>">
            </div>
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
    $unControleur->setTable("enquete");   

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

		$unControleur->insert($tab); 
    }
    
?>