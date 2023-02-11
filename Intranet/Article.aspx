<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion article </h2>
<div class="d-flex justifiy-content-center" style="padding-top:8%">
    <div class="col-1"></div>
    <div class="col-4" style="padding-right:3%;"> 



<%
   VArticle lArticle = null;
    if(Request["page"] != null && Request["action"] != null && Request["id_article"] != null)
    {
    string action = Request["action"];
    int id_article = int.Parse(Request["id_article"]);
    switch(action)
        {
            case "sup" : 
                where.Clear();
                where.Add("id_article",Request["id_article"]);
                Controleur.DeleteUniversel("article", where, true);
                break;
            case "edit": lArticle = Intranet.Controleur.SelectWhereVArticle(id_article); break;
        }
    }
    List<Intranet.Employe> lesEmployes_articles = Intranet.Controleur.SelectAllEmploye();
    List<Intranet.Categorie_article> lesCategories_articles2 = Intranet.Controleur.SelectAllCategorie_article();
%>

<h4>Insertion d'un Article</h4>
<!-- #include file="vue/vue_insert_article.aspx"-->


<%
    if(Request.Form["valider"] != null){
        valeurs.Clear();
        valeurs.Add("titre",Request.Form["titre"]);
        valeurs.Add("sous_titre",Request.Form["sous_titre"]);
        valeurs.Add("contenu",Request.Form["contenu"]);
        valeurs.Add("id_cat_art",Request.Form["id_cat_art"]);
        valeurs.Add("id_auteur",Request.Form["id_employe"]);
        Controleur.InsertUniversel(valeurs,"article",true);
        message = "<br> Insertion reussie";
    }
    if(Request.Form["modifier"] != null ){
        valeurs.Clear();
        valeurs.Add("titre",Request.Form["titre"]);
        valeurs.Add("sous_titre",Request.Form["sous_titre"]);
        valeurs.Add("contenu",Request.Form["contenu"]);
        valeurs.Add("id_cat_art",Request.Form["id_cat_art"]);
        valeurs.Add("id_auteur",Request.Form["id_employe"]);

        where.Clear();
        where.Add("id_article",Request["id_article"]);
        Controleur.UpdateUniversel(valeurs,"article",where,true);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=13");
        
    }
%>

<%= message %>

<% 
    List<Intranet.VArticle> lesArticles = Intranet.Controleur.SelectAllVArticle();
%>

 <!-- #include file="vue/vue_les_articles.aspx"-->