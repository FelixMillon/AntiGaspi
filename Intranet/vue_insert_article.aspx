<form method="post" action="">
    <div class="container" >
            <div class="col p-4 d-flex flex-column position-static">

                    <div class="row g-3">
                    
                        <div class="col-6">
                            <input type="text" name="titre" placeholder="Titre" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (lArticle!= null) ? lArticle.Titre : "" %>" > 
                        </div>	

                        <div class="col-6">
                            <input type="text" name="sous_titre" placeholder="Sous-titre" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (lArticle!= null) ? lArticle.Sous_titre : "" %>" > 
                        </div>	


                        <div class="col-6">
                            <select class="inscricase form-select text-center fw-bold" name="id_cat_art" style="border:3px solid #9FC490"> 
                                <option value="">Catégorie</option>
                                <%
                                    String chaineCategorieArt = ""; 
                                foreach(Employe uneCategorie_article in lesEmploye_autres)
                                {
                                    chaineCategorieArt += "<option value='" + uneCategorie_article.Id_cat_art + "'>"; 
                                        chaineCategorieArt += uneCategorie_article.Nom + " " + uneCategorie_article.Prenom; 
                                        chaineCategorieArt += "</option>";
                                }
                                
                                %>
                            <%= chaineCategorieArt %>
                             </select>
                        </div>

                        <div class="col-6">
                            <select class="inscricase form-select text-center fw-bold" name="id_employe" style="border:3px solid #9FC490"> 
                                <option value="">Auteur</option>
                                <%
                                    String chaineEmploye = ""; 
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
                                      
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-danger btn-small w-75 fw-bold" type="reset" name="Annuler" value="Annuler">
                        </div>
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-success btn-small w-75 fw-bold" type="submit"  <%= (lArticle!= null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />

                        </div>
                    </div>       
            </div>
    </div>
</form>

</div>
<div class="col-6" style="padding-left:3%"> 