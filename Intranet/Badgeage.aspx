
<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion des Badgeages </h2>
<div class="d-flex justifiy-content-center" style="padding-top:8%">
    <div class="col-1"></div>
    <div class="col-4" style="padding-right:3%;"> 


<%
    VBadgeage leBadgeage =  null;

    if(Request["page"] != null && Request["action"] != null && Request["id_badgeage"] != null)
    {
    string action = Request["action"];
    int id_badgeage = int.Parse(Request["id_badgeage"]);

    switch(action)
        {
            case "sup" :
                where.Clear();
                where.Add("id_badgeage",Request["id_badgeage"]);
                Controleur.DeleteUniversel("badgeage", where, true);
                break;
            case "edit": leBadgeage = Intranet.Controleur.SelectWhereVBadgeage(id_badgeage); break;
        }
    }

    List<Intranet.Employe> lesEmploye_badgeages = Intranet.Controleur.SelectAllEmploye();
%>

<h4>Insertion d'un Badgeage</h4>
<!-- #include file="vue/vue_insert_badgeage.aspx"-->


<%

    if(Request.Form["valider"] != null){
        valeurs.Clear();
        valeurs.Add("date_heure",Request.Form["date_heure"]);
        valeurs.Add("type",Request.Form["type"]);
        valeurs.Add("id_employe",Request.Form["id_employe"]);
        Controleur.InsertUniversel(valeurs,"badgeage",true);
        message = "<br> Insertion reussie";
    }

    if(Request.Form["modifier"] != null ){
        valeurs.Clear();
        if(Request.Form["date_heure"] == ""){
        valeurs.Add("date_heure", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));
        }else{
        valeurs.Add("date_heure", Request.Form["date_heure"]);
        }
        valeurs.Add("date_heure",Request.Form["date_heure"]);
        valeurs.Add("type",Request.Form["type"]);
        valeurs.Add("id_employe",Request.Form["id_employe"]);
        where.Clear();
        where.Add("id_badgeage",Request["id_badgeage"]);
        Controleur.UpdateUniversel(valeurs,"badgeage",where,true);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=11");
        
    }

%>

<%= message %>

<% 
    List<Intranet.VBadgeage> lesBadgeages = Intranet.Controleur.SelectAllVBadgeage();
%>

 <!-- #include file="vue/vue_les_badgeages.aspx"-->