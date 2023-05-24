﻿
<%@ Import Namespace="Intranet" %>



<style>
input::placeholder {
    font-weight: bold;
    opacity: .5;
    color: #ffffff;
}

body{
    overflow-x: hidden;
}

</style>


<%
    if(Session["id"] != null){
    Response.Redirect("Default.aspx?page=1");
    }

    %>

<div class="row" style="height: 84vh;" >
  					
  <div class="col-2" > </div>
  <div class="col-2" style="background : #9FC490; opacity : 0.57;">  </div>
  <div class="col-4 text-light" style="background : #9FC490;"> 
	  <form method="post" class="d-flex flex-column bd-highlight mb-3">
	   <div class="p-2 bd-highlight" style="margin-top : 10%">
	   		<img src="images/icon_connexionn.png" class="bi me-2 img" style="width: 10vw;" role="img" alt=""> <br>
	   		<img src="images/logo1.png" class="bi me-2 img" style="width: 13vw;" role="img" alt="">
	   </div>
	  	<div class="p-2 bd-highlight">
	  		<div class="container" style="width: 75%; padding: 5% 10% 5% 10%;  
	  			 background:#C4F2B1; border-radius:25px; margin-top : 4%;"> 
	  			<input type="text" class="form-control text-center" name="email" placeholder="IDENTIFIANT"
	  			style="background : #9FC490;">  <br>
	  			<input type="password" class="form-control text-center" name="mdp" placeholder="MOT DE PASSE"
	  			style="background : #9FC490;"> 
	  			<div class="d-flex justify-content-between align-items-center" style="padding-top: 5%">
            <div class="col-5">
              <input type="checkbox" class="form-check-input" id="same-address">
              <label class="form-check-label text-dark" for="same-address">
                <small>Se souvenir de moi</small> 
              </label>
            </div>
            <div class="col-7">
              <a href="index.jsp?page=1" class="nav-link link-dark"> <small>  Mot de passe oublié ? </small></a> 
            </div>
            
          	   </div>
	  		</div>
	  	</div>
	  	<div class="p-2 bd-highlight"  style="margin-top : 4%">
	  		<div class="container" style="width: 75%; padding: 0px 15% 0px 15% ;"> 
	 			<input type="submit" class="text-light btn btn-outline-light w-100" name="seConnecter" value="Se Connecter"> <br><br>
	 			<input type="reset" class="text-light btn btn-outline-light w-100" value="Annuler"> <br>
			</div>
	  	</div>
        <br/><br/>
	</form>
  </div>
  <div class="col-2" style="background : #9FC490; opacity : 0.57;">  </div>

</div>
</div>