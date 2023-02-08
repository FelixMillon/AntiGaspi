
<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion Demande autre </h2>
<div class="d-flex justifiy-content-center" style="padding-top:8%">
    <div class="col-1"></div>
    <div class="col-4" style="padding-right:3%;"> 



<%
    Demande_autre laDemande_autre =  null;

    if(Request["page"] != null && Request["action"] != null && Request["id_demande_autre"] != null)
    {
    string action = Request["action"];
    int id_demande_autre = int.Parse(Request["id_demande_autre"]);

    switch(action)
        {
            case "sup" : Intranet.Controleur.DeleteDemande_autre(id_demande_autre); break;
            case "edit": laDemande_autre = Intranet.Controleur.SelectWhereDemande_autre(id_demande_autre); break;
        }
    }

    List<Intranet.Employe> lesEmploye_autres = Intranet.Controleur.SelectAllEmploye();
    List<Intranet.Manager> lesManager_autres = Intranet.Controleur.SelectAllManager();
%>

<h4>Insertion d'une demande autre</h4>
<!-- #include file="vue/vue_insert_demande_autre.aspx"-->


<%

    if(Request.Form["valider"] != null){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("description",Request.Form["description"]);
        valeurs.Add("date_demande",Request.Form["date_demande"]);
        valeurs.Add("date_resolution",Request.Form["date_resolution"]);
        valeurs.Add("etat","attente");
        valeurs.Add("id_employe",Request.Form["id_employe"]);
        valeurs.Add("id_manager",Request.Form["id_manager"]);
        Controleur.InsertUniversel(valeurs,"demande_autre",true);
        message = "<br> Insertion reussie";
    }

    if(Request.Form["modifier"] != null ){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("description",Request.Form["description"]);
        valeurs.Add("date_demande",Request.Form["date_demande"]);
        valeurs.Add("date_resolution",Request.Form["date_resolution"]);
        valeurs.Add("etat","attente");
        valeurs.Add("id_employe",Request.Form["id_employe"]);
        valeurs.Add("id_manager",Request.Form["id_manager"]);
        where.Clear();
        where.Add("id_demande_autre",Request["id_demande_autre"]);
        Controleur.UpdateUniversel(valeurs,"demande_autre",where,true);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=5");
        
    }



%>

<%= message %>

<% 
    List<Intranet.VDemande_autre> lesDemande_autres = Intranet.Controleur.SelectAllVDemande_autre();
%>

 <!-- #include file="vue/vue_les_demandes_autres.aspx"-->