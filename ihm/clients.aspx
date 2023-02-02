<%@ Import Namespace="Depannage" %>
<%@ Import Namespace="System.Collections.Generic" %>

<h2>Gestion des clients</h2>



<%
    Client leClient =  null;

    if(Request["page"] != null && Request["action"] != null && Request["idclient"] != null)
    {
    string action = Request["action"];
    int idclient = int.Parse(Request["idclient"]);

    switch(action)
        {
            case "sup" : Depannage.Controleur.DeleteClient(idclient); break;
            case "edit": leClient = Depannage.Controleur.SelectWhereClient(idclient); break;
        }
    }
%>

<h4>Insertion d'un client</h4>
<!-- #include file="vue/vue_insert_client.aspx"-->


<%

    if (Request.Form["valider"] != null){
        string nom = Request.Form["nom"];
        string prenom = Request.Form["prenom"];
        string adresse = Request.Form["adresse"];
        string email = Request.Form["email"];
        string mdp = Request.Form["mdp"];

        //instancier la classe Client
        Depannage.Client unClient = new Client(nom, prenom, email, mdp, adresse);

        //insertion dans la base de donnees
        Depannage.Controleur.InsertClient(unClient);
        message = "<br> Insertion reussie du client";
    }

    if(Request.Form["modifier"] != null ){
        string nom = Request.Form["nom"];
        string prenom = Request.Form["prenom"];
        string adresse = Request.Form["adresse"];
        string email = Request.Form["email"];
        int idPers = int.Parse(Request["idclient"]);

        Depannage.Client unClient = new Client(idPers, nom, prenom, email, adresse);

        Depannage.Controleur.UpdateClient(unClient);
        message = "<br> Modification reussie";
        Response.Redirect("Default.aspx?page=1");
        
    }



%>

<%= message %>

<% 
    List<Depannage.Client> lesClients = Depannage.Controleur.SelectAllClient();
    %>

 <!-- #include file="vue/vue_les_clients.aspx"-->