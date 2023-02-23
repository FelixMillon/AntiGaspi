<%@ Page Language="C#" %>
<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.Text.RegularExpressions" %>

<!DOCTYPE html>
<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> 


	<link rel="icon" type="image/png" sizes="16x16" href="images/icon.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> FireCrest - Intranet</title>
</head>
<style>

body{
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}
footer{
    margin-top: auto;
}

    </style>

    <%
        if (Request.Form["seConnecter"] != null)
        {
            Intranet.Employe unEmploye = null;
            Intranet.Local unLocal = null;
            string email = Request.Form["email"];
            string mdp = Request.Form["mdp"];
            unEmploye = Controleur.SelectWhereEmploye(email,mdp);

            string chaineconnect = "";
            if(unEmploye == null)
            {
                chaineconnect += "veuillez verifier vos identifiants";
            }else{
                Session["id"] = unEmploye.Id_employe;
                Session["prenom"] = unEmploye.Prenom;
                Session["nom"] = unEmploye.Nom;
                Session["email"] = unEmploye.Email;
                Session["tel"] = unEmploye.Tel;
                Session["numrue"] = unEmploye.Numrue;
                Session["rue"] = unEmploye.Rue;
                Session["ville"] = unEmploye.Ville;
                Session["fonction"] = unEmploye.Fonction;
                Session["droits"] = unEmploye.Droits;
                Session["cp"] = unEmploye.Cp;
                Session["lastbadgeage"] ="";
                int id_local = unEmploye.Id_local;
                unLocal = Controleur.SelectWhereLocal(id_local);
                if(unLocal != null)
                {
                    Session["nom_local"] = unLocal.Nom;
                }
                else
                {
                    Session["nom_local"] = "Nomade";
                }


                Response.Redirect("Default.aspx?page=6");
                chaineconnect += " Bienvenue " + Session["prenom"]+" "+ Session["nom"];
            }
            Response.Write(chaineconnect);
        }
    %>

<body class="">

    <header class="d-flex flex-wrap align-items-center justify-content-around justify-content-md-around py-2 " style="background: #9FC490;">

        <a href="Default.aspx?page=1" class="col-6 d-flex align-items-center col-md-1 mb-2 mb-md-0 text-dark text-decoration-none" >
          <img src="images/logo1.png" class="bi me-2 img" style="width: 10vw;" role="img" alt="">
        </a>
        
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
          
                    <%
                        string chaineConnect = "";
                        string chaineDeco = "";
                        if (Session["email"] != null) {
                            chaineConnect += "<li><a href='Default.aspx?page=6' class='px-2 btn text-light'>Mon Compte</a></li>";
                            chaineConnect += "<li><a href='Default.aspx?page=5' class='px-2 btn text-light'>Demande R.H.</a></li>";
                            chaineConnect += "<li><a href='Default.aspx?page=4' class='px-2 btn text-light'>Demande Autre</a></li>";
                            chaineConnect += "<li><a href='Default.aspx?page=11' class='px-2 btn text-light'>Badgeage </a></li>";
                            chaineConnect += "<li><a href='Default.aspx?page=2' class='px-2 btn text-light'>Les articles</a></li>";
                            chaineConnect += "<li><a href='Default.aspx?page=13' class='px-2 btn text-light'>Article</a></li>";
                            chaineConnect += "<li><a href='Default.aspx?page=14' class='px-2 btn text-light'>Cat Article</a></li>";
                            chaineConnect += "<li><a href='Default.aspx?page=15' class='px-2 btn text-light'>Local</a></li>";
                        }  %>
                        <%= chaineConnect %>
        </ul>
        <ul class='nav col-12 col-md-auto mb-2 justify-content-end mb-md-0' >
                   <% if(Session["email"] != null) {
                      chaineDeco += "<form method='post'><li><button name='deconnexion' class='px-2 btn text-light'>Se Déconnecter</button></li></form>";
                      }
                      else
                      {
                        chaineDeco += "<li><a href='Default.aspx?page=0' class='px-2 btn text-light'>Se Connecter</a></li>";
                      }
                    %>
                    <%= chaineDeco %>

        </ul>
        
    </header>
<center>


    <%
        int page = 0;
        string message = "";
        Dictionary<string, string> valeurs = new Dictionary<string, string>();
        Dictionary<string, string> where = new Dictionary<string, string>();
        Dictionary<int, int>correspondance_id_list = new Dictionary<int, int>();
        //Debug.WriteLine(Regex.Replace("J'ai,mis.des,Partout", ",", "."));
        // EXEMPLE INSERT,UPDATE 
        //Dictionary<string, string> valeurs = new Dictionary<string, string>(){
        //    {"email", "felix.millon@test.fr"},
        //    {"mdp", "123"},
        //    {"nom", "Millon"},
        //    {"id_local", "1"}
        //};
        //    Dictionary<string, string> where = new Dictionary<string, string>(){
        //    {"email", "felix.millon@test.fr"},
        //    {"truc", "bidule"}
        //};
        //Controleur.InsertUniversel(valeurs,"employe",true);
        //Controleur.UpdateUniversel(valeurs,"employe",where,false);
        //Controleur.constructeurrequete("insert|nom=toto,prenom=bidule");
        //Controleur.constructeurrequete("update|nom=machin,prenom=truc|id_employe=2");
        //Controleur.constructeurrequete("delete|id_employe=2");
        string chainemdp ="";
        string chaine = "";
        string chaineList = "";
        if (Request["page"] != null)
        {
            page = int.Parse(Request["page"]);
        } else
        {
            page = 0;
        }
        switch(page)
        {
        case 0: %> <!-- #include file="Login.aspx" --> <%  break;
        case 1: %> <!-- #include file="home.aspx" --> <%  break;
        case 2: %> <!-- #include file="List_article.aspx" --> <%  break;
        case 3: %> <!-- #include file="Un_article.aspx" --> <%  break;
        case 4: %> <!-- #include file="Demande_autre.aspx" --> <% break;
        case 5: %> <!-- #include file="Demande_rh.aspx" --> <% break;
        case 6: %> <!-- #include file="Moncompte.aspx" --> <% break;
        case 7: %> <!-- #include file="Ticketing.aspx" --> <% break;
        case 8: %> <!-- #include file="Modification.aspx" --> <% break;
        case 9: %> <!-- #include file="Planning.aspx" --> <% break;
        case 10: %> <!-- #include file="Dashboard.aspx" --> <% break;
        case 11: %> <!-- #include file="Badgeage.aspx" --> <% break;
        case 12: %> <!-- #include file="Gerer.aspx" --> <% break;
        case 13: %> <!-- #include file="Article.aspx" --> <% break;
        case 14: %> <!-- #include file="Cat_Article.aspx" --> <% break;
        case 15: %> <!-- #include file="Local.aspx" --> <% break;

    }

    if (Request.Form["deconnexion"] != null)
    {
       Session.RemoveAll();
       Response.Redirect("Default.aspx?page=0");
    }

    %>
</center>    



    <footer class="d-flex flex-wrap align-items-center justify-content-around justify-content-md-around py-2" style="background : #9FC490; " id="footer" >
        <p class="col-md-4 mb-0 text-light" style="padding-left: 6%; white-space: nowrap;" >©Copyright 2022 FireCrest</p>
    
        <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        </a>
    
        <ul class="nav col-md-4 justify-content-end" style="padding-right: 6%; white-space: nowrap;">
            <li class="nav-item"><a href="#" class="nav-link px-2 text-light">Mentions légales</a></li>
            <li class="nav-item"><a href="#" class="nav-link px-2 text-light">Conditions générle d'uilisation</a></li>
        </ul>

    </footer>
    </body>
    </html>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
