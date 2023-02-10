<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion catégorie metier</h2>
<div class="d-flex justifiy-content-center" style="padding-top:8%">
    <div class="col-1"></div>
    <div class="col-4" style="padding-right:3%;"> 



<%
    Categorie_metier laCategorie_metier =  null;
    if(Request["page"] != null && Request["action"] != null && Request["id_cat_met"] != null)
    {
    string action = Request["action"];
    int id_cat_met = int.Parse(Request["id_cat_met"]);
    switch(action)
        {
            case "sup" : 
                where.Clear();
                where.Add("id_cat_met",Request["id_cat_met"]);
                Controleur.DeleteUniversel("categorie_metier", where, true);
                break;
            case "edit": laCategorie_metier = Intranet.Controleur.SelectWhereCategorie_metier(id_cat_met); break;
        }
    }

%>

<h4>Insertion d'une catégorie de métier</h4>
<!-- #include file="vue/vue_insert_categorie_metier.aspx"-->


<%
    if(Request.Form["valider"] != null){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("description",Request.Form["description"]);

        Controleur.InsertUniversel(valeurs,"categorie_metier",true);
        message = "<br> Insertion reussie";
    }
    if(Request.Form["modifier"] != null ){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("description",Request.Form["description"]);

        where.Clear();
        where.Add("id_cat_met",Request["id_cat_met"]);
        Controleur.UpdateUniversel(valeurs,"categorie_metier",where,true);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=12");
        
    }
%>

<%= message %>

<% 
    List<Intranet.Categorie_metier> lesCategories_metiers = Intranet.Controleur.SelectAllCategorie_metier();
%>

 <!-- #include file="vue/vue_les_cat_metiers.aspx"-->