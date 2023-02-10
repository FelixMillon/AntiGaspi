<form method="post" action="">
    <div class="container" >
            <div class="col p-4 d-flex flex-column position-static">

                    <div class="row g-3">
                    
                        <%
                            string chaineDate = "";
                            if(leBadgeage != null)
                             {
                                chaineDate += "<div Class='col-12'>";
                                chaineDate += "<input type = 'datetime-local' name='date_heure' class='inscricase form-control text-center fw-bold' style='border:3px solid #9FC490'>";
                                chaineDate += "</div>";
                                }
                            %>
                        <%= chaineDate %>

                        <div class="col-12">
                            <select class="inscricase form-select text-center fw-bold" name="id_employe" style="border:3px solid #9FC490"> 
                                <option value="">Type</option>
                                <option value="entree">Entrée</option>
                                <option value="sortie">Sortie</option>
                            </select>
                        </div>	

                       
                        <div class="col-12">
                            <select class="inscricase form-select text-center fw-bold" name="id_employe" style="border:3px solid #9FC490"> 
                                <option value="">Employé</option>
                                <%
                                string chaineEmploye2 = ""; 
                                foreach(Employe unEmploye in lesEmploye_badgeages)
                                {
                                    chaineEmploye2 += "<option value='" + unEmploye.Id_employe + "'>"; 
                                    chaineEmploye2 += unEmploye.Nom + " " + unEmploye.Prenom; 
                                    chaineEmploye2 += "</option>";
                                }
                                
                                %>
                            <%= chaineEmploye2 %>
                             </select>
                        </div>
                                  
                       <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-danger btn-small w-75 fw-bold" type="reset" name="Annuler" value="Annuler">
                        </div>
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-success btn-small w-75 fw-bold" type="submit"  <%= (leBadgeage != null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />

                        </div>
                    </div>       
            </div>
    </div>
</form>

</div>
<div class="col-6" style="padding-left:3%"> 