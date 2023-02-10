<form method="post" action="">
    <div class="container" >
            <div class="col p-4 d-flex flex-column position-static">

                    <div class="row g-3">
                    
                        <div class="col-6">
                            <input type="text" name="libelle" placeholder="Libelle" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (leMetier!= null) ? leMetier.Libelle : "" %>" > 
                        </div>	

                        <div class="col-6">
                            <input type="number" name="niveau_salaire" placeholder="Niveau salaire" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (leMetier!= null) ? leMetier.Niveau_salaire : "" %>" > 
                        </div>	


                        <div class="col-6">
                            <select class="inscricase form-select text-center fw-bold" name="id_cat_met " style="border:3px solid #9FC490"> 
                                <option value="">Catégorie</option>
                                <%
                                    String chaineCatMetier = ""; 
                                foreach(Employe uneCategorie_metier in lesCategorie_metier)
                                {
                                    chaineCatMetier += "<option value='" + uneCategorie_metier.Id_cat_met  + "'>"; 
                                    chaineCatMetier += uneCategorie_metier.Libelle; 
                                    chaineCatMetier += "</option>";
                                }
                                
                                %>
                            <%= chaineCatMetier %>
                             </select>
                        </div>

                                      
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-danger btn-small w-75 fw-bold" type="reset" name="Annuler" value="Annuler">
                        </div>
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-success btn-small w-75 fw-bold" type="submit"  <%= (leMetier!= null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />

                        </div>
                    </div>       
            </div>
    </div>
</form>

</div>
<div class="col-6" style="padding-left:3%"> 