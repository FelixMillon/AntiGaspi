<form method="post" action="">
    <div class="container" >
            <div class="col p-4 d-flex flex-column position-static">

                    <div class="row g-3">
                    
                        <div class="col-6">
                            <input type="text" name="libelle" placeholder="Libelle" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laCategorie_article!= null) ? laCategorie_article.Libelle : "" %>" > 
                        </div>	

                        <div class="col-6">
                            <input type="text" name="description" placeholder="Description" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laCategorie_article!= null) ? laCategorie_article.Description : "" %>" > 
                        </div>	

                                      
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-danger btn-small w-75 fw-bold" type="reset" name="Annuler" value="Annuler">
                        </div>
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-success btn-small w-75 fw-bold" type="submit"  <%= (laCategorie_article!= null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />
                        </div>
                    </div>       
            </div>
    </div>
</form>

</div>
<div class="col-6" style="padding-left:3%"> 