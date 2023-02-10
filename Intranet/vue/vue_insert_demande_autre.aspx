<form method="post" action="">
    <div class="container" >
            <div class="col p-4 d-flex flex-column position-static">

                    <div class="row g-3">
                    
                        <div class="col-6">
                            <input type="text" name="libelle" placeholder="Libelle" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laDemande_autre!= null) ? laDemande_autre.Libelle : "" %>" > 
                        </div>	

                        <div class="col-6">
                            <input type="text" name="description" placeholder="Description" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laDemande_autre!= null) ? laDemande_autre.Description : "" %>" > 
                        </div>	

                        <div class="col-6">Date demande</div> <div class="col-6">Date résoltion</div>

                        <div class="col-6">
                            <input type="datetime-local" name="date_demande" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" > 
                        </div>

                        <div class="col-6">
                            <input type="datetime-local" name="date_resolution" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" > 
                        </div>
                        <div class='col-12'>
                        <%
                        string chaineEtat = "";
                        if (laDemande_autre != null){
                            chaineEtat += "<select class='inscricase form-Select text-center fw-bold w-100' name='etat' style='border:3px solid #9FC490'>"; 
                                chaineEtat += "<option value = 'attente' > État</option>";
                                chaineEtat += "<option value = 'attente' > Attente</option>";
                                chaineEtat += "<option value = 'refuse' > Réfuser</option>";
                                chaineEtat += "<option value = 'accepte' > Accepter</option>";
                             chaineEtat += "</select>";
                                }
                            %>

                         <%= chaineEtat %>
                        </div>

                        <div class="col-6">
                            <select class="inscricase form-select text-center fw-bold" name="id_employe" style="border:3px solid #9FC490"> 
                                <option value="">Employé</option>
                                <%
                                    string chaineEmploye = ""; 
                                foreach(Employe unEmploye in lesEmploye_autres)
                                {
                                    chaineEmploye += "<option value='" + unEmploye.Id_employe + "'>"; 
                                        chaineEmploye += unEmploye.Nom + " " + unEmploye.Prenom; 
                                        chaineEmploye += "</option>";
                                }
                                
                                %>
                            <%= chaineEmploye %>
                             </select>
                        </div>

                        <div class="col-6">
                            <select class="inscricase form-select text-center fw-bold" name="id_manager" style="border:3px solid #9FC490"> 
                                <option value="">Manager</option>
                                <%
                                    string chaineManager = ""; 
                                    foreach(Manager unManager in lesManager_autres)
                                    {
                                        chaineManager += "<option value='" + unManager.Id_manager + "'>"; 
                                            chaineManager += unManager.Nom + " " + unManager.Prenom; 
                                            chaineManager += "</option>";
                                    }
                                    
                                    %>
                                <%= chaineManager %>
                             </select>
                        </div>
                                      
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-danger btn-small w-75 fw-bold" type="reset" name="Annuler" value="Annuler">
                        </div>
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-success btn-small w-75 fw-bold" type="submit"  <%= (laDemande_autre!= null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />

                        </div>
                    </div>       
            </div>
    </div>
</form>

</div>
<div class="col-6" style="padding-left:3%"> 