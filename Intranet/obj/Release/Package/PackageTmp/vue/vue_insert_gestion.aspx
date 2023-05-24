<form method="post" action="">
    <div class="container" >
            <div class="col p-4 d-flex flex-column position-static">

                    <div class="row g-3">
                    
                        <%
                            string chaineEmployeGestion = "";
                            if (laGestion == null)                                
                                {
                                    chaineEmployeGestion += "<div class='col-12'> "; 
                                    chaineEmployeGestion += "<select class='inscricase form-select text-center fw-bold' name='id_employe' style='border:3px solid #9FC490'> "; 
                                    chaineEmployeGestion += "<option value=''>Employé</option>"; 
                                foreach(Employe unEmploye in lesEmploye_gestions)
                                {

                                    chaineEmployeGestion += "<option value='" + unEmploye.Id_employe + "'>"; 
                                    chaineEmployeGestion += unEmploye.Nom + " " + unEmploye.Prenom; 

                                }
                                    chaineEmployeGestion += "</option>";
                                    chaineEmployeGestion += "</select>";
                                    chaineEmployeGestion += "</div>";
                            }
                                
                                %>
                            <%= chaineEmployeGestion %>

                            <%
                                string chaineUtilisateurGestion = "";
                            if (laGestion == null) 
                                    {   

                                    chaineUtilisateurGestion += "<div class='col-12'> "; 
                                    chaineUtilisateurGestion += "<select class='inscricase form-select text-center fw-bold' name='id' style='border:3px solid #9FC490'> "; 
                                    chaineUtilisateurGestion += "<option value=''>Utilisateur</option>"; 
                                foreach(Utilisateur unUtilisateur in lesUtilisateur_gestions)
                                {

                                    chaineUtilisateurGestion += "<option value='" + unUtilisateur.Id + "'>"; 
                                    chaineUtilisateurGestion += unUtilisateur.Nom + " " + unUtilisateur.Prenom; 

                                }
                                    chaineUtilisateurGestion += "</option>";
                                    chaineUtilisateurGestion += "</select>";
                                    chaineUtilisateurGestion += "</div>";
                            }
                                
                                %>
                            <%= chaineUtilisateurGestion %>

                        <div class="col-12">
                            <input type="text" name="libelle_action" placeholder="Libelle de l'action" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laGestion!= null) ? laGestion.Libelle_action : "" %>" > 
                        </div>	

                       <div class="col-12">
                            <input type="text" name="description_action" placeholder="Description" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laGestion!= null) ? laGestion.Description_action : "" %>" > 
                        </div>


    
                                  
                       <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-danger btn-small w-75 fw-bold" type="reset" name="Annuler" value="Annuler">
                        </div>
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-success btn-small w-75 fw-bold" type="submit"  <%= (laGestion!= null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />

                        </div>
                    </div>       
            </div>
    </div>
</form>

</div>
<div class="col-6" style="padding-left:3%"> 