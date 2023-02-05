
<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion Demande rh </h2>
<div class="d-flex justifiy-content-center" style="padding-top:8%">
    <div class="col-2"></div>
    <div class="col-4" style="padding-right:3%;"> 



<%
    Demande_rh laDemande_rh = null;

    if (Request["page"] != null && Request["action"] != null && Request["id_demande_rh"] != null)
    {
    string action = Request["action"];
    int id_demande_rh = int.Parse(Request["id_demande_rh"]);

    switch(action)
        {
            case "sup" : Intranet.Controleur.DeleteDemande_rh(id_demande_rh); break;
            case "edit" : laDemande_rh = Intranet.Controleur.SelectWhereDemande_rh(id_demande_rh); break;
        }
    }

    List<Intranet.Employe> lesEmploye_rhs = Intranet.Controleur.SelectAllEmploye();
    List<Intranet.Manager> lesManager_rhs = Intranet.Controleur.SelectAllManager();
%>

<h4>Insertion d'une demande rh</h4>
<!-- #include file="vue/vue_insert_demande_rh.aspx"-->


<%

    if(Request.Form["valider"] != null){
        string libelle = Request.Form["libelle"];
        string objet = Request.Form["objet"];
        string requete_sql = Request.Form["requete_sql"];
        string date_demande = Request.Form["date_demande"];
        string date_resolution = Request.Form["date_resolution"];
        string etat = Request.Form["etat"];
        int id_employe = int.Parse(Request["id_employe"]);
        int id_manager = int.Parse(Request["id_manager"]);

        Intranet.Demande_rh uneDemande_rh = new Demande_rh(libelle, objet, requete_sql, date_demande, date_resolution, etat, id_employe, id_manager);
        
        

        Intranet.Controleur.InsertDemande_rh(uneDemande_rh);
        message = "<br> Insertion reussie";
    }

    if(Request.Form["modifier"] != null ){
        int id_demande_rh = int.Parse(Request["id_demande_rh"]);
        string libelle = Request.Form["libelle"];
        string objet = Request.Form["objet"];
        string requete_sql = Request.Form["requete_sql"];
        string date_demande = Request.Form["date_demande"];
        string date_resolution = Request.Form["date_resolution"];
        string etat = Request.Form["etat"];
        int id_employe = int.Parse(Request["id_employe"]);
        int id_manager = int.Parse(Request["id_manager"]);

       Intranet.Demande_rh uneDemande_rh = new Demande_rh(id_demande_rh, libelle, objet, requete_sql, date_demande, date_resolution, etat, id_employe, id_manager);

        Intranet.Controleur.UpdateDemande_rh(uneDemande_rh);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=4");
        
    }



%>

<%= message %>

<% 
    List<Intranet.VDemande_rh> lesDemande_rhs = Intranet.Controleur.SelectAllVDemande_rh();
%>

 <!-- #include file="vue/vue_les_demandes_rhs.aspx"-->