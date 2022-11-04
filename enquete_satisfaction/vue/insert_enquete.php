<div class="col-md-7 col-lg-8">
<h2>Insertion d'une nouvelle enquête</h2>
<form method="post">
  <hr class="my-5">
    <div class="row g-3">
      <div class="col-12" style="width:50%">
        <label class="form-label">Libellé de l'enquête</label>
        <input type="text" class="form-control" name="libelle">
      </div>
      <div class="col-12" style="width:50%">
        <label class="form-label">description de l'enquête</label>
        <input type="text" class="form-control" name="description_enquete">
      </div>
    </div>
  <hr class="my-5">
	
	<input type="submit" class="btn btn-sm btn-outline-success" name="Valider" value="Valider">
	<input type="reset" name="Annuler" value="Annuler" class="btn btn-sm btn-outline-danger" > 		 
  <div class="question"></div>
      <h2>Insertion d'une nouvelle question</h2>
      <div class="question">
        <select class="form-select btn btn-lg btn-outline-secondary" name="id_enquete" style="width:50%">
            <option value="" selected disabled hidden> ---- Enquête concernée ---- </option>
            <?php 
                foreach($lesEnquetes as $uneEnquete){
                    echo "<option value='".$uneEnquete['id_enquete']."'>".$uneEnquete['libelle']." ".$uneEnquete['description']."</option>";
                }
            ?>
        </select>
      </div>
          <input type="submit" class="btn btn-lg btn-outline-secondary question" value="Commencer" name="Commencer" style="width: 50%;">
      </div>
    </form>