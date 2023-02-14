<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div style="display: flex; flex-direction: column;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Les articles </h2>

<%
    List<Intranet.Employe> lesEmployes_articles2 = Intranet.Controleur.SelectAllEmploye();
    List<Intranet.Categorie_article> lesCategories_articles3 = Intranet.Controleur.SelectAllCategorie_article();
%>

<% 
    List<Intranet.VArticle> lesArticles3 = Intranet.Controleur.SelectAllVArticle();
%>


<div class="container">
    <div class='row mb-2' style="padding-bottom: 8%; padding-top : 3%;">

 <%
    foreach(VArticle unArticle in lesArticles3)
    {

    chaineList+="<div class='col-6' style='padding-top: 3%;'>";
    chaineList+="<a class='btn' href='Default.aspx?page=3&id_article="+unArticle.Id_article+"'>";
    chaineList+="<div class='card'>";
    chaineList+="<div class='row g-0'>";
    chaineList+="<div class='col-md-4'>";
    chaineList+="<img src='images/worker.jpg' width='100%' height='100%'> ";
    chaineList+="</div>";
    chaineList+="<div class='col-md-8'>";
    chaineList+="<div class='card-body'>";
    chaineList+="<h5 class='card-title text-start'>"+unArticle.Titre+"</h5></br>";
    chaineList+="<h6 class='card-text text-start text-truncate' style='max-width: 150px;'>"+unArticle.Sous_titre+"</h6>";
    chaineList+="<p class='card-text'>"+unArticle.Contenu+"</p></br>";
    chaineList+="<p class='fst-italic text-end'><small class='text-muted'>Par "+unArticle.Auteur+" </small></p>";
    chaineList+="</div>";
    chaineList+="</div>";
    chaineList+="</div>";
    chaineList+="</div></a>";
    chaineList+="</div>";


    }
%>
 <%= chaineList %>




  </div>
</div>
