<%@ Import Namespace="Depannage" %>
<%@ Import Namespace="System.Collections.Generic" %>


<h2>Gestion des Intervention</h2>


<%
    Intervention Linter = null;

    if (Request["page"] != null && Request["action"] != null && Request["idinter"] != null)
    {
    string action = Request["action"];
    int idInter = int.Parse(Request["idinter"]);

    switch(action)
        {
            case "sup" : Depannage.Controleur.DeleteIntervention(idInter); break;
            case "edit" : Linter = Depannage.Controleur.SelectWhereIntervention(idInter); break;
        }
    }



%>

<%
    List<Depannage.Client> lesClients2 = Depannage.Controleur.SelectAllClient();
    List<Depannage.Technicien> lesTechniciens2 = Depannage.Controleur.SelectAllTechnicien();
%>


<h4>Insertion d'une intervention</h4>

<!-- #include file="vue/vue_insert_intervention.aspx"-->


<% 

    if(Request.Form["valider"] != null){
    string materiel = Request.Form["materiel"];
    string prix = Request.Form["prix"];
    string dateinter = Request.Form["dateinter"];
    int idclient = int.Parse(Request["idclient"]);
    int idtechnicien = int.Parse(Request["idtechnicien"]);

    //instanicer la classe Technicien    
    Depannage.Intervention uneIntervention = new Intervention(materiel, prix, dateinter, idclient, idtechnicien);

    //Insertion dans la base de donnees 
    Depannage.Controleur.InsertIntervention(uneIntervention);
    message = "<br/> Insertion reussie d'une intervention";
    }


    if(Request.Form["modifier"] != null ){
    string materiel = Request.Form["materiel"];
    string prix = Request.Form["prix"];
    string dateinter = Request.Form["dateinter"];
    int idclient = int.Parse(Request["idclient"]);
    int idtechnicien = int.Parse(Request["idtechnicien"]);

    int idInter = int.Parse(Request["idinter"]);

    Depannage.Intervention uneIntervention = new Intervention(idInter, materiel, prix, dateinter, idclient, idtechnicien);

    Depannage.Controleur.UpdateIntervention(uneIntervention);
    message = "<br> Modification reussie";
    Response.Redirect("Default.aspx?page=3");   
    }



%>

<%= message %>

<% 
    List<Depannage.Intervention> lesInterventions = Depannage.Controleur.SelectAllIntervention();
%>

 <!-- #include file="vue/vue_les_Interventions.aspx"-->
