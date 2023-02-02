<%@ Import Namespace="Depannage" %>
<%@ Import Namespace="System.Collections.Generic" %>


<h2>Gestion des techniciens</h2>



<%
    Technicien leTechnicien = null;

    if (Request["page"] != null && Request["action"] != null && Request["idtechnicien"] != null)
    {
    string action = Request["action"];
    int idtechnicien = int.Parse(Request["idtechnicien"]);

    switch(action)
        {
            case "sup" : Depannage.Controleur.DeleteTechnicien(idtechnicien); break;
            case "edit" : leTechnicien = Depannage.Controleur.SelectWhereTechnicien(idtechnicien); break;
        }
    }
%>


<h4>Insertion d'un technicien</h4>

<!-- #include file="vue/vue_insert_technicien.aspx"-->

<% 

    if(Request.Form["valider"] != null){
    string nom = Request.Form["nom"];
    string prenom = Request.Form["prenom"];
    string email = Request.Form["email"];
    string mdp = Request.Form["mdp"];
    string qualification = Request.Form["qualification"];

    //instanicer la classe Technicien
    Depannage.Technicien unTechnicien = new Technicien(nom, prenom, email, mdp, qualification);

    //Insertion dans la base de donnees 
    Depannage.Controleur.InsertTechnicien(unTechnicien);
    message = "<br/> Insertion reussie du technicien";
    }


    if(Request.Form["modifier"] != null ){
    string nom = Request.Form["nom"];
    string prenom = Request.Form["prenom"];
    string qualification = Request.Form["qualification"];
    string email = Request.Form["email"];
    int idPers = int.Parse(Request["idtechnicien"]);

    Depannage.Technicien unTechnicien = new Technicien(idPers, nom, prenom, email, qualification);

    Depannage.Controleur.UpdateTechnicien(unTechnicien);
    message = "<br> Modification reussie";
    Response.Redirect("Default.aspx?page=2");
        
    }



%>

<%= message %>

<% 
    List<Depannage.Technicien> lesTechniciens = Depannage.Controleur.SelectAllTechnicien();
%>

 <!-- #include file="vue/vue_les_techniciens.aspx"-->