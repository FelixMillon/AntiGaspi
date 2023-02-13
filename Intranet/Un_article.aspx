<%@ Import Namespace="Intranet" %>
<%@ Import Namespace="System.Collections.Generic" %>
<div style="padding-top: 5%;" >


<% 
    Intranet.VArticle unArticles = null;
    int id_articles = int.Parse(Request["id_article"]);
    unArticles = Controleur.SelectWhereVArticle(id_articles);
    %>


<img src="images/worker.jpg" class="border rounded-3 shadow-lg mb-4" width="450" height="275" >
<div class="px-2 pt-3 my-2 text-center border-bottom">
    <h1 class="display-5 fw-bold"> <%= unArticles.Titre %> </h1>
    <h4 class="display-4 "> <%= unArticles.Sous_titre %> </h4>
    <div class="col-lg-6 mx-auto">

      <p class="lead mb-4"><%= unArticles.Contenu %></p>

    </div>
    <div class="overflow-hidden" style="max-height: 30vh;">
      <div class="container px-5 ">

      </div>
    </div>
  </div>
</div>