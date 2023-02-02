<%@ Page Language="C#" %>
<%@ Import Namespace="Depannage" %>

<!DOCTYPE html>
<html>
<head>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <meta charset="utf-8" />
    <title>Depannage</title>
</head>
<body>
    <center>
        <h1>Site de depannage materiel</h1>
        <%
            string chainetest = Depannage.Controleur.coucou();
            string chainetest2 = Depannage.Controleur.coucou(1);
            %><%= chainetest %><%
            %><%= chainetest2 %><%
            if(Request.Form["seConnecter"] != null)
            {
                string email = Request.Form["email"];
                string mdp = Request.Form["mdp"];
                Depannage.Technicien unTechnicien = Depannage.Controleur.SelectWhereTechnicien(email,mdp);
                string chaineconnect="";
                if(unTechnicien == null)
                {
                    chaineconnect="veuillez verifier vos identifiants";
                }else{
                    Session["id"]=unTechnicien.IdPers;
                    Session["nom"]=unTechnicien.Nom;
                    Session["prenom"]=unTechnicien.Prenom;
                    Session["email"]=unTechnicien.Email;
                    chaineconnect+="Bienvenue "+Session["prenom"]+" "+Session["nom"];
                }
            %><%= chaineconnect %><%
          }
        %>
        <br>
  <div class="container">
    <header class="d-flex justify-content-center py-3">
      <ul class="nav nav-pills">
        
        
        <li class="nav-item"><a href="Default.aspx?page=0" class="nav-link active" aria-current="page">Accueil</a></li>
        <%
        string chainehead="";
        if(Session["id"] != null)
        {
          chainehead+="<li class='nav-item'><a href='Default.aspx?page=1' class='nav-link'> Gestion des clients</a></li>";
          chainehead+="<li class='nav-item'><a href='Default.aspx?page=2' class='nav-link'> Gestion des techniciens</a></li>";
          chainehead+="<li class='nav-item'><a href='Default.aspx?page=3' class='nav-link'> Gestion des interventions</a></li>";
          chainehead+="<li class='nav-item'><a href='Default.aspx?page=4' class='nav-link'> Deconnexion</a></li>";
        }
        %>
        <%= chainehead %>
      </ul>
    </header>
  </div>
  <%
  if(Session["id"] == null)
  {
    %><!-- #include file="vue/vue_connexion.aspx --><%
  }
    %>
    <%
        int page = 0;
        string message = "";
        string chainemdp ="";
        string chaine = "";
        if (Request["page"] != null)
        {
            page = int.Parse(Request["page"]);
        } else
        {
            page = 0;
        }
        switch(page)
        {
            case 0:  break;
            case 1: %> <!-- #include file="clients.aspx --> <% break;
            case 2: %> <!-- #include file="techniciens.aspx --> <% break;
            case 3: %> <!-- #include file="interventions.aspx --> <% break;
            case 4: break;
         }

        %>

    </center>
</body>
</html>