<form method="post">
    <div class="row" style="width: 100%; ">
        <div class="col-md-6">
            <div class="row box_question d-flex justify-content-center" style="width: 80%;">
                <div class="question">
                    <h3 >Ajouter une nouvelle question</h3>
                </div>
                <img class="image" src="img/quizz.jpg">
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
        </div>
        <div class="col-md-6">
            <div class="row box_question d-flex justify-content-center" style="width: 80%; ">
                <div class="question" >
                    <h3>Ajouter une nouvelle enquete</h3>
                </div>
                <img class="image" src="img/quizz.jpg">
                <div style="height: 80px;"></div>
                <a type="button" class="btn btn-lg btn-outline-secondary question" href="index.php?page=9" style="width: 50%;">  Commencer </a>
            </div>
        </div>
    </div>
</form>
