<%@ Page Language="C#" %>
<%@ Import Namespace="Intranet" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="js/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> 
    <link rel="stylesheet" href="js/style_ambrine.css">
	<link rel="stylesheet" href="js/felix.css">

	<link rel="icon" type="image/png" sizes="16x16" href="images/icon.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> FireCrest - Intranet</title>
</head>

    <%
    if (Request.Form["seConnecter"] != null)
    {
        Intranet.Employe unEmploye = null;
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
            chaineconnect += " Bienvenue " + Session["prenom"]+" "+ Session["nom"];
        }
        Response.Write(chaineconnect);
    }
    %>

<body class="">

    <header class="d-flex flex-wrap align-items-center justify-content-around justify-content-md-around py-2 " style="background: #9FC490;">
        <a href="Default.aspx?page=0" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none" >
          <img src="images/logo1.png" class="bi me-2 img" style="width: 10vw;" role="img" alt="">
        </a>
        
      
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <li><a href="Default.aspx?page=5" class="px-2 btn text-light ">Demande RH</a></li> 
            <li><a href="Default.aspx?page=4" class="px-2 btn text-light ">Demande Autre</a></li> 
        </ul>
      
      
        <ul class="nav col-12 col-md-auto mb-2 justify-content-end mb-md-0" style="padding-left: 17%;">
            <%
                string chaineConnect = "";
                if (Session["email"] != null) {
                    chaineConnect += "<li><a href='Default.aspx?page=11' class='px-2 btn text-light'>Se Déconnecter</a></li>";                  
                }
                else
                {
                    chaineConnect += "<li><a href='Default.aspx?page=0' class='px-2 btn text-light'>Se Connecter</a></li>";
                }
            %>
            <%= chaineConnect %>
                      
        </ul>
        
    </header>
<center>


    <%
    int page = 0;
    string message = "";
    List<string> cars = new List<string>() {"Volvo", "BMW", "Ford", "Mazda"};
    List<string> testtab = new List<string>();
    Dictionary<string, string> testdict = new Dictionary<string, string>(){
            {"email", "felix.millon@test.fr"},
            {"mdp", "null"},
            {"nom", "Millon"},
            {"prenom", "Felix"},
            {"tel", "0123456789"},
            {"rue", "rue du test"},
            {"numrue", "14"},
            {"ville", "Paris"},
            {"cp", "75018"},
            {"fonction", "Testeur"},
            {"salaire", "2300"},
            {"niveau_diplome", "5"},
            {"date_embauche", "2021-01-01"},
            {"date_depart", "null"},
            {"droits", "developpeur"},
            {"id_planning", "1"},
            {"id_manager", "null"},
            {"id_local", "null"}
    };
    Controleur.InsertUniversel(testdict,"employe",true);
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
        case 0: %> <!-- #include file="Login.aspx --> <%  break;
        case 1: %> <!-- #include file="Employe.aspx --> <% break;
        case 2: %> <!-- #include file="Article.aspx --> <% break;
        case 3: %> <!-- #include file="Emploi.aspx --> <% break;
        case 4: %> <!-- #include file="Demande_autre.aspx --> <% break;
        case 5: %> <!-- #include file="Demande_rh.aspx --> <% break;
        case 6: %> <!-- #include file="Moncompte.aspx --> <% break;
        case 7: %> <!-- #include file="Ticketing.aspx --> <% break;
        case 8: %> <!-- #include file="Modification.aspx --> <% break;
        case 9: %> <!-- #include file="Planning.aspx --> <% break;
        case 10: %> <!-- #include file="Dashboard.aspx --> <% break;
        case 11 : Session.RemoveAll(); %> <!-- #include file="Login.aspx --> <%  break;
     }

    %>
</center>    

    

    <footer class="d-flex flex-wrap align-items-center justify-content-around justify-content-md-around py-4" style="background : #9FC490;" id="footer" >
        <p class="col-md-4 mb-0 text-light" style="padding-left: 6%; white-space: nowrap;" >©Copyright 2022 FireCrest</p>
    
        <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
        </a>
    
        <ul class="nav col-md-4 justify-content-end" style="padding-right: 6%; white-space: nowrap;">
        <li class="nav-item"><a href="#" class="nav-link px-2 text-light">Mentions légales</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-light">Conditions générle d'uilisation</a></li>
        </ul>
      <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
      <script src="js/gestion_cookie.js"></script>
    </footer>
    </body>
    </html>