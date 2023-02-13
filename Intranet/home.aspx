<%@ Import Namespace="Intranet" %>



  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class="active" aria-current="true"></button>
    </div>
    <div class="carousel-inner">

      <div class="carousel-item">
          <img style="opacity: 0.8;" src="images/infos.png" width="100%" height="500" />

        <div class="container">
          <div class="carousel-caption text-start">
            <h1>Consulter vos demandes</h1>
            <p><a class="btn btn-lg btn-primary" href="Default.aspx?page=0">Faire une demande</a></p>
          </div>
        </div>
      </div>



      <div class="carousel-item active" style="background: rgba(black, 0.5);" >
          <img style="opacity: 0.8;" src="images/offices.jpg" width="100%" height="500" />

        <div class="container">
          <div class="carousel-caption text-start">
            <h1>Bienvenue sur l'intranet de FireCrest</h1>
            <p>Gérer votre compte et consulter votre planning</p>
            <p><a class="btn btn-lg btn-primary" href="Default.aspx?page=0">Se connecter</a></p>
          </div>
        </div>
      </div>

    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

<% 
    List<Intranet.VArticle> lesArticles4 = Intranet.Controleur.SelectAllVArticle();
%>



 



  <div class="container marketing" style="padding-top : 2%;">

    <!-- Three columns of text below the carousel -->
    <div class="row">

     <%
         string chainehomearticle = "";
        int lebreak = 0;
        foreach(VArticle unArticle in lesArticles4)
        {  
        chainehomearticle +="<div class='col-lg-6'>";
        chainehomearticle+="<img class='bd-placeholder-img rounded-circle' src='images/worker.jpg' width='140' height='140'> ";
        chainehomearticle +="<h2 class='text-truncate' style='max-width: 150px;'>"+unArticle.Titre+"</h2>";
        chainehomearticle +="<p class='text-truncate w-50' style='max-width: 75%;'>"+unArticle.Sous_titre+"</p>";
        chainehomearticle +="<p><a class='btn btn-secondary' href='Default.aspx?page=3&id_article="+unArticle.Id_article+"'>Lire l'article</a></p>";
        chainehomearticle +="</div>";
        if(lebreak >= 1){
        break;
        }
        lebreak++;
        }
    %>

<%= chainehomearticle %>
    </div>
      