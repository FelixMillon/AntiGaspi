
<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>

<div style="display: flex; flex-direction: column; height: 87vh;"> 
    <h2 class="d-flex align-items-center text-light fw-bold text-start" style="padding-left : 10%;background: #C6ECB7; height:7vh" >Gestion</h2>
<div class="d-flex justifiy-content-center" style="padding-top:8%">
    <div class="col-1"></div>
    <div class="col-4" style="padding-right:3%;"> 


<%
    VGerer laGestion =  null;

    if(Request["page"] != null && Request["action"] != null && Request["id_employe"] != null && Request["id_utilisateur"] != null && Request["dateheure_action"] != null)
    {
    string action = Request["action"];
    int id_employe = int.Parse(Request["id_employe"]);
    int id_utilisateur = int.Parse(Request["id_utilisateur"]);
    string dateheure_action = Request["dateheure_action"];

    switch(action)
        {
            case "sup" :
                where.Clear();
                where.Add("id_employe",Request["id_employe"]);
                where.Add("id_utilisateur",Request["id_utilisateur"]);
                where.Add("dateheure_action",Request["dateheure_action"]);
                Controleur.DeleteUniversel("gerer", where, true);
                break;
            case "edit": laGestion = Intranet.Controleur.SelectWhereGerer(id_employe, id_utilisateur, dateheure_action); break;
        }
    }

    List<Intranet.Employe> lesEmploye_gestions = Intranet.Controleur.SelectAllEmploye();
    List<Intranet.Utilisateur> lesUtilisateur_gestions = Intranet.Controleur.SelectAllUtilisateur();
%>

<h4>Insertion gestion</h4>
<!-- #include file="vue/vue_insert_gestion.aspx"-->


<%

    if(Request.Form["valider"] != null){
        valeurs.Clear();
        valeurs.Add("id_employe",Request.Form["id_employe"]);
        valeurs.Add("dateheure_action",Request.Form["dateheure_action"]);
        valeurs.Add("id_utilisateur",Request.Form["id_utilisateur"]);
        valeurs.Add("libelle_action",Request.Form["libelle_action"]);
        valeurs.Add("description_action",Request.Form["description_action"]);
        Controleur.InsertUniversel(valeurs,"gerer",true);
        message = "<br> Insertion reussie";
    }

    if(Request.Form["modifier"] != null ){
        valeurs.Clear();
        valeurs.Add("dateheure_action",Request.Form["dateheure_action"]);
        valeurs.Add("libelle_action",Request.Form["libelle_action"]);
        valeurs.Add("description_action",Request.Form["description_action"]);
        where.Clear();
        valeurs.Add("id_employe",Request.Form["id_employe"]);
        valeurs.Add("id_utilisateur",Request.Form["id_utilisateur"]);
        Controleur.UpdateUniversel(valeurs,"gerer",where,true);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=12");
        
    }

%>

<%= message %>

<% 
    List<Intranet.VGerer> lesGestions = Intranet.Controleur.SelectAllVGestion();
%>

 <!-- #include file="vue/vue_les_gestions.aspx"-->