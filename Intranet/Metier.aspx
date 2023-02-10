<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion métier </h2>
<div class="d-flex justifiy-content-center" style="padding-top:8%">
    <div class="col-1"></div>
    <div class="col-4" style="padding-right:3%;"> 



<%
    Metier leMetier =  null;
    if(Request["page"] != null && Request["action"] != null && Request["id_met"] != null)
    {
    string action = Request["action"];
    int id_met = int.Parse(Request["id_met"]);
    switch(action)
        {
            case "sup" : 
                where.Clear();
                where.Add("id_met",Request["id_met"]);
                Controleur.DeleteUniversel("metier", where, true);
                break;
            case "edit": leMetier = Intranet.Controleur.SelectWhereMetier(id_met); break;
        }
    }
    List<Intranet.Categorie_metier> lesEmploye_autres = Intranet.Controleur.SelectAllCatMetier();

%>

<h4>Insertion d'un métier</h4>
<!-- #include file="vue/vue_insert_metier.aspx"-->


<%
    if(Request.Form["valider"] != null){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("niveau_salaire",Request.Form["niveau_salaire"]);
        valeurs.Add("id_cat_met",Request.Form["id_cat_met"]);

        Controleur.InsertUniversel(valeurs,"metier",true);
        message = "<br> Insertion reussie";
    }
    if(Request.Form["modifier"] != null ){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("niveau_salaire",Request.Form["niveau_salaire"]);
        valeurs.Add("id_cat_met",Request.Form["id_cat_met"]);

        where.Clear();
        where.Add("id_met",Request["id_met"]);
        Controleur.UpdateUniversel(valeurs,"metier",where,true);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=16");
        
    }
%>

<%= message %>

<% 
    List<Intranet.VMetier> lesMetiers = Intranet.Controleur.SelectAllVMetier();
%>

 <!-- #include file="vue/vue_les_demandes_autres.aspx"-->