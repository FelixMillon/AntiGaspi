<form method="post" action="">
    <div class="container" >
            <div class="col p-4 d-flex flex-column position-static">

                    <div class="row g-3">
                    
                        <div class="col-12">
                            <input type="text" name="nom" placeholder="Nom" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (leLocal!= null) ? leLocal.Nom : "" %>" > 
                        </div>	

                        <div class="col-6">
                            <input type="text" name="numrue" placeholder="Numrue" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (leLocal!= null) ? leLocal.Numrue : "" %>" > 
                        </div>	

                        <div class="col-6">
                            <input type="text" name="rue" placeholder="Rue" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (leLocal!= null) ? leLocal.Rue : "" %>" > 
                        </div>	
                        <div class="col-6">
                            <input type="text" name="ville" placeholder="Ville" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (leLocal!= null) ? leLocal.Ville : "" %>" > 
                        </div>
                        <div class="col-6">
                            <input type="text" name="cp" placeholder="Cp" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (leLocal!= null) ? leLocal.Cp : "" %>" > 
                        </div>
                        
                                      
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-danger btn-small w-75 fw-bold" type="reset" name="Annuler" value="Annuler">
                        </div>
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-success btn-small w-75 fw-bold" type="submit"  <%= (leLocal!= null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />

                        </div>
                    </div>       
            </div>
    </div>
</form>

</div>
<div class="col-6" style="padding-left:3%"> 