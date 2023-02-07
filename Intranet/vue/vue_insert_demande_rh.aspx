<form method="post" action="">
    <div class="container" >
            <div class="col p-4 d-flex flex-column position-static">

                    <div class="row g-3">
                    
                        <div class="col-6">
                            <input type="text" name="libelle" placeholder="Libelle" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laDemande_rh != null) ? laDemande_rh.Libelle : "" %>" > 
                        </div>	

                        <div class="col-6">
                            <input type="text" name="objet" placeholder="Objet" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laDemande_rh != null) ? laDemande_rh.Objet : "" %>" > 
                        </div>	

                        <div class="col-12">
                            <input type="text" name="requete_sql" placeholder="Requete SQL" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laDemande_rh!= null) ? laDemande_rh.Requete_sql : "" %>" > 
                        </div>	



                        <div class="col-6">Date demande</div> <div class="col-6">Date résoltion</div>

                        <div class="col-6">
                            <input type="datetime-local" name="date_demande" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="" > 
                        </div>

                        <div class="col-6">
                            <input type="datetime-local" name="date_resolution" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="" > 
                        </div>

                        <div class='col-12'>
                        <%
                        string chaineEtat2 = "";
                        if (laDemande_rh != null){
                            chaineEtat2 += "<select class='inscricase form-Select text-center fw-bold w-100' name='etat' style='border:3px solid #9FC490'>"; 
                                chaineEtat2 += "<option value = 'attente' > État</option>";
                                chaineEtat2 += "<option value = 'attente' > Attente</option>";
                                chaineEtat2 += "<option value = 'refuse' > Réfuser</option>";
                                chaineEtat2 += "<option value = 'accepte' > Accepter</option>";
                             chaineEtat2 += "</select>";
                                }
                            %>

                         <%= chaineEtat2 %>
                        </div>

                        <div class="col-6">
                            <select class="inscricase form-select text-center fw-bold" name="id_employe" style="border:3px solid #9FC490"> 
                                <option value="">Selectionner un employé</option>
                                <%
                                    String chaineEmployerh = ""; 
                                foreach(Employe unEmploye in lesEmploye_rhs)
                                {
                                    chaineEmployerh += "<option value='" + unEmploye.Id_employe + "'>"; 
                                        chaineEmployerh += unEmploye.Nom + " " + unEmploye.Prenom; 
                                        chaineEmployerh += "</option>";
                                }
                                
                                %>
                            <%= chaineEmployerh %>
                             </select>
                        </div>

                        <div class="col-6">
                            <select class="inscricase form-select text-center fw-bold" name="id_manager" style="border:3px solid #9FC490"> 
                                <option value="">Selectionner un manager</option>
                                <%
                                    string chaineManagerrh = ""; 
                                    foreach(Manager unManager in lesManager_rhs)
                                    {
                                        chaineManagerrh += "<option value='" + unManager.Id_manager + "'>"; 
                                            chaineManagerrh += unManager.Nom + " " + unManager.Prenom; 
                                            chaineManagerrh += "</option>";
                                    }
                                    
                                    %>
                                <%= chaineManagerrh %>
                             </select>
                        </div>
                                      
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-danger btn-small w-75 fw-bold" type="reset" name="Annuler" value="Annuler">
                        </div>
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-success btn-small w-75 fw-bold" type="submit"  <%= (laDemande_rh!= null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />

                        </div>
                    </div>       
            </div>
    </div>
</form>

</div>
<div class="col-6" style="padding-left:3%"> 