
<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion Demande rh </h2>
<div class="d-flex justifiy-content-center">
    <div class="col-1"></div>
    <div class="col-4" style="padding-right:3%;"> 



<%
    Demande_rh laDemande_rh = null; 

    if (Request["page"] != null && Request["action"] != null && Request["id_demande_rh"] != null)
    {
    string action = Request["action"];
    int id_demande_rh = int.Parse(Request["id_demande_rh"]);

    switch(action)
        {
            case "sup" :
                where.Clear();
                where.Add("id_demande_rh",Request["id_demande_rh"]);
                Controleur.DeleteUniversel("demande_rh", where, true);
                break;
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
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("objet",Request.Form["objet"]);
        valeurs.Add("requete_sql",Request.Form["requete_sql"]);
        valeurs.Add("date_demande","sysdate");
        valeurs.Add("date_resolution","null");
        valeurs.Add("etat","attente");
        valeurs.Add("id_employe",Request.Form["id_employe"]);
        valeurs.Add("id_manager",Request.Form["id_manager"]);

        Controleur.InsertUniversel(valeurs,"demande_rh",true);

        message = "<br> Insertion reussie";
    }

    if(Request.Form["modifier"] != null ){
        valeurs.Clear();
        valeurs.Add("libelle",Request.Form["libelle"]);
        valeurs.Add("objet",Request.Form["objet"]);
        valeurs.Add("requete_sql",Request.Form["requete_sql"]);
        valeurs.Add("etat",Request.Form["etat"]);
        valeurs.Add("id_employe",Request.Form["id_employe"]);
        valeurs.Add("id_manager",Request.Form["id_manager"]);

        where.Clear();
        where.Add("id_demande_rh",Request["id_demande_rh"]);

        Controleur.UpdateUniversel(valeurs,"demande_rh",where,true);

        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=5");
    }
%>

<%= message %>

<% 
    List<Intranet.VDemande_rh> lesDemande_rhs = Intranet.Controleur.SelectAllVDemande_rh();
%>

 <!-- #include file="vue/vue_les_demandes_rhs.aspx"-->