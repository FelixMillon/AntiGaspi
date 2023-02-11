<form method="post" action="">
    <div class="container" >
            <div class="col p-4 d-flex flex-column position-static">

                    <div class="row g-3">
                    
                        <div class="col-6">
                            <input type="text" name="titre" placeholder="Titre" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (lArticle!= null) ? lArticle.Titre : "" %>" > 
                        </div>	

                        <div class="col-6">
                            <input type="text" name="sous_titre" placeholder="Sous-titre" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%=(lArticle!= null) ? lArticle.Sous_titre : "" %>" > 
                        </div>	
                        <div class="col-12">
                            <textarea type="text" name="contenu" maxlength="5000" cols="40" rows="5" style="height: 200px;" placeholder="<%=(lArticle!= null) ? lArticle.Sous_titre : "" %>" value="<%=(lArticle!= null) ? lArticle.Sous_titre : "" %>"></textarea>
                        </div>
                        <div class="col-6">
                            <select class="inscricase form-select text-center fw-bold" name="id_cat_art" style="border:3px solid #9FC490"> 
                                <option value="">Catégorie</option>
                                    <%
                                        string chaineCatArt = ""; 
                                        foreach(Categorie_article uneCategorie_article in lesCategories_articles2)
                                        {
                                            chaineCatArt += "<option value='" + uneCategorie_article.Id_cat_art + "'>"; 
                                            chaineCatArt += uneCategorie_article.Libelle; 
                                            chaineCatArt += "</option>";
                                        }
                                    
                                    %>
                                    <%= chaineCatArt %>
                             </select>
                        </div>

                        <div class="col-6">
                            <select class="inscricase form-select text-center fw-bold" name="id_employe" style="border:3px solid #9FC490"> 
                                <option value="">Auteur</option>
                                    <%
                                        string chaineEmployeArticle = ""; 
                                        foreach(Employe unEmploye in lesEmployes_articles)
                                        {
                                            chaineEmployeArticle += "<option value='" + unEmploye.Id_employe + "'>"; 
                                            chaineEmployeArticle += unEmploye.Nom + " " + unEmploye.Prenom; 
                                            chaineEmployeArticle += "</option>";
                                        }                               
                                    %>
                                    <%= chaineEmployeArticle %>
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