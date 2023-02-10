<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion catégorie d'article</h2>
<div class="d-flex justifiy-content-center" style="padding-top:8%">
    <div class="col-1"></div>
    <div class="col-4" style="padding-right:3%;"> 



<%
    Categorie_article laCategorie_article =  null;
    if(Request["page"] != null && Request["action"] != null && Request["id_cat_art"] != null)
    {
    string action = Request["action"];
    int id_cat_art = int.Parse(Request["id_cat_art"]);
    switch(action)
        {
            case "sup" : 
                where.Clear();
                where.Add("id_cat_art",Request["id_cat_art"]);
                Controleur.DeleteUniversel("categorie_article", where, true);
                break;
            case "edit": laCategorie_article = Intranet.Controleur.SelectWhereCategorie_article(id_cat_art); break;
        }
    }

%>

<h4>Insertion d'une catégorie d'article</h4>
<!-- #include file="vue/vue_insert_categorie_article.aspx"-->


<%
    if(Request.Form["valider"] != null){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("description",Request.Form["description"]);

        Controleur.InsertUniversel(valeurs,"categorie_article",true);
        message = "<br> Insertion reussie";
    }
    if(Request.Form["modifier"] != null ){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("description",Request.Form["description"]);

        where.Clear();
        where.Add("id_cat_art",Request["id_cat_art"]);
        Controleur.UpdateUniversel(valeurs,"categorie_article",where,true);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=14");
        
    }
%>

<%= message %>

<% 
    List<Intranet.Categorie_article> lesCategories_articles = Intranet.Controleur.SelectAllCategorie_article();
%>

 <!-- #include file="vue/vue_les_cat_articles.aspx"-->