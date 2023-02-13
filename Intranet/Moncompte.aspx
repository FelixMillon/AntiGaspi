
<%@ Import Namespace="Intranet" %>


<div class="d-flex flex-column bd-highlight mb-3 container py-4" style="margin-top:3%" >

<div class="p-2 mb-2" style="border:solid gray 2px; border-radius: 15px; background-color: #ebf8e6; ">
  <div class="row gx-2" style="padding-top : 5%;">
    <div class="text-end fw-bold col-3" style="padding-left : 5%; padding-right : 5%;">
        <p>  Nom : </p>
        <p>  Prénom : </p>
        <p>  Numéro de téléphone :  </p>
        <p>  É-mail : </p>
        <p>  Adresse : </p>
    </div>
    <div class="text-start fw-bold col-3" >
        <p style="text-transform: uppercase;">  <% Response.Write(Session["nom"]);  %> </p>
        <p style="text-transform: uppercase;">   <% Response.Write(Session["prenom"]);  %> </p>
        <p>   <% Response.Write(Session["tel"]);  %>  </p>
        <p> 	<% Response.Write(Session["email"]);  %> </p>
        <p>  <% string chaineadresse = Session["numrue"]+" "+Session["rue"]+" ,"+ Session["ville"] +" "+ Session["cp"];
                Response.Write(chaineadresse);  %> </p>
    </div>
    <div class="col-1"></div>
    <div class="col-5">
        <img src='img/user.png' width='50%' alt=''>
    </div>
  </div>
  <br>
  <a href="Default.aspx?page=5" class='btn text-light fw-bold' style="background: #9FC490; border-radius: 10px;">Demande de <br> modification d'information</a>
</div>





<div class="row align-items-md-stretch" style="padding-bottom : 5%;" >
  <div class="col-md-6" style="padding-right:3%; ">
    <div class="h-100 p-3 text-white" style="border:solid gray 2px; background:#9FC490; border-radius: 15px;">
      <h2>Mon emploi</h2>
      <div class="row" style="padding-top : 4%;" >
        <div class="text-end fw-bold fs-4 col-3" style="padding-left : 5%">
            Poste : 
            <br>
            Pôle :
            <br>
            Rôle :
        </div>
        <div class="col-1"></div>
        
        <div class="text-start fw-bold fs-4 col" >
            <div style='text-transform: capitalize;'><% Response.Write(Session["fonction"]);  %></div>
            <div style='text-transform: capitalize;'><% Response.Write(Session["nom_local"]);  %></div>
            <div style='text-transform: capitalize;'><% Response.Write(Session["droits"]);  %></div>
        </div>         
      </div>
    </div>
  </div>
  <div class="col-md-6" style="padding-left:3%;">
    <div class="p-3" style="border:solid gray 2px; background:#ebf8e6 ; border-radius: 15px;">
        <h2 class="fw-bold">Service</h2>
      <a href="Default.aspx?page=4" class="btn w-75 fw-bold text-light" style="background:#9FC490;">Demande Ticketing</a> <br> <br>
      <a href="Default.aspx?page=11" class="btn w-75 fw-bold text-light" style="background:#9FC490;">Badgeage</a> <br> <br>
    </div>
  </div>
</div>


</div>


