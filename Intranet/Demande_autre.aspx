
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
        string libelle = Request.Form["libelle"];
        string description = Request.Form["description"];
        DateTime date_demande = DateTime.Parse(Request.Form["date_demande"]);
        DateTime date_resolution = DateTime.Parse(Request.Form["date_resolution"]);
        string etat = "attente";
        int id_employe = int.Parse(Request["id_employe"]);
        int id_manager = int.Parse(Request["id_manager"]);

        Intranet.Demande_autre uneDemande_autre = new Demande_autre(libelle, description, date_demande, date_resolution, etat, id_employe, id_manager);
        
        

        Intranet.Controleur.InsertDemande_autre(uneDemande_autre);
        message = "<br> Insertion reussie";
    }

    if(Request.Form["modifier"] != null ){
        int id_demande_autre = int.Parse(Request["id_demande_autre"]);
        string libelle = Request.Form["libelle"];
        string description = Request.Form["description"];
        DateTime date_demande = DateTime.Parse(Request.Form["date_demande"]);
        DateTime date_resolution = DateTime.Parse(Request.Form["date_resolution"]);
        string etat = Request.Form["etat"];
        int id_employe = int.Parse(Request["id_employe"]);
        int id_manager = int.Parse(Request["id_manager"]);

        Intranet.Demande_autre uneDemande_autre = new Demande_autre(id_demande_autre, libelle, description, date_demande, date_resolution, etat, id_employe, id_manager);

        Intranet.Controleur.UpdateDemande_autre(uneDemande_autre);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=5");
        
    }



%>

<%= message %>

<% 
    List<Intranet.VDemande_autre> lesDemande_autres = Intranet.Controleur.SelectAllVDemande_autre();
%>

 <!-- #include file="vue/vue_les_demandes_autres.aspx"-->