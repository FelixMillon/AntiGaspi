<form method="post" action="">
    <div class="container" >
            <div class="col p-4 d-flex flex-column position-static">

                    <div class="row g-3">
                    
                        <div class="col-6">
                            <input type="text" name="libelle" placeholder="Libelle" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laDemande_rh != null) ? laDemande_rh.Libelle : "" %>" > 
                        </div>	

                        <div class="col-6">
                            <input type="text" name="objet" placeholder="Objet" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laDemande_rh != null) ? laDemande_rh.Objet : "" %>" > 
                        </div>	
                        
                        <div class="col-12">
                            <input type="text" name="requete_sql" placeholder="Requete SQL" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490" value="<%= (laDemande_rh!= null) ? laDemande_rh.Requete_sql : "" %>" > 
                        </div>	
                        <div class="col-12" >
                            <div class="row">
                                <label class="reponse" > Attributs à modifier :</label>
                                <div class="col-md-3 reponse">
                                  <input type="radio" id="email" onchange="PlaceLesAttributs()"/> Email
                                </div>
  
                                <div class="col-md-3 reponse">
                                  <input type="radio" id="nom" onchange="PlaceLesAttributs()"/> Nom
                                </div>
  
                                <div class="col-md-3 reponse">
                                  <input type="radio" id="prenom" onchange="PlaceLesAttributs()"/> Prenom
                                </div>
  
                                <div class="col-md-3 reponse">
                                  <input class="reponse" type="radio" id="tel" onchange="PlaceLesAttributs()"/> Tel
                                </div>
                                <div class="col-md-3 reponse">
                                    <input class="reponse" type="radio" id="adresse" onchange="PlaceLesAttributs()"/> Adresse
                                </div>
                                <div class="col-md-3 reponse">
                                    <input class="reponse" type="radio" id="fonction" onchange="PlaceLesAttributs()"/> Fonction
                                </div>
                                <div class="col-md-3 reponse">
                                    <input class="reponse" type="radio" id="salaire" onchange="PlaceLesAttributs()"/> Salaire
                                </div>
                                <div class="col-md-3 reponse">
                                    <input class="reponse" type="radio" id="niveau_diplome" onchange="PlaceLesAttributs()"/> Niveau du diplome
                                </div>
                                <div class="col-md-3 reponse">
                                    <input class="reponse" type="radio" id="droits" onchange="PlaceLesAttributs()"/> Droits
                                </div>
                                <div class="col-md-3 reponse">
                                    <input class="reponse" type="radio" id="id_planning" onchange="PlaceLesAttributs()"/> Planning
                                </div>
                                <div class="col-md-3 reponse">
                                    <input class="reponse" type="radio" id="id_manager" onchange="PlaceLesAttributs()"/> Manager
                                </div>
                                <div class="col-md-3 reponse">
                                    <input class="reponse" type="radio" id="id_local" onchange="PlaceLesAttributs()"/> Locaux
                                </div>
                              </div>
                            
                        </div>
                        <div id="attributschoisis"></div> 
                        <div class='col-12'>
                        <%
                        string chaineEtat2 = "";
                        if (laDemande_rh != null){
                            chaineEtat2 += "<select class='inscricase form-Select text-center fw-bold w-100' name='etat' style='border:3px solid #9FC490'>"; 
                                chaineEtat2 += "<option value = '' > État</option>";
                                chaineEtat2 += "<option value = 'attente' > Attente</option>";
                                chaineEtat2 += "<option value = 'refuse' > Réfuser</option>";
                                chaineEtat2 += "<option value = 'accepte' > Accepter</option>";
                             chaineEtat2 += "</select>";
                                }
                            %>

                         <%= chaineEtat2 %>
                        </div>

                        <div class="col-6">
                            <select class="inscricase form-select text-center fw-bold" name="id_employe" style="border:3px solid #9FC490"> 
                                <option value="">Selectionner un employé</option>
                                <%
                                    string chaineEmployerh = ""; 
                                foreach(Employe unEmploye in lesEmploye_rhs)
                                {
                                    chaineEmployerh += "<option value='" + unEmploye.Id_employe + "'>"; 
                                        chaineEmployerh += unEmploye.Nom + " " + unEmploye.Prenom; 
                                        chaineEmployerh += "</option>";
                                }
                                
                                %>
                            <%= chaineEmployerh %>
                             </select>
                        </div>

                        <div class="col-6">
                            <select class="inscricase form-select text-center fw-bold" name="id_manager" style="border:3px solid #9FC490"> 
                                <option value="">Selectionner un manager</option>
                                <%
                                    string chaineManagerrh = ""; 
                                    foreach(Manager unManager in lesManager_rhs)
                                    {
                                        chaineManagerrh += "<option value='" + unManager.Id_manager + "'>"; 
                                            chaineManagerrh += unManager.Nom + " " + unManager.Prenom; 
                                            chaineManagerrh += "</option>";
                                    }
                                    
                                    %>
                                <%= chaineManagerrh %>
                             </select>
                        </div>
                                      
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-danger btn-small w-75 fw-bold" type="reset" name="Annuler" value="Annuler">
                        </div>
                        <div class="col-6" style="padding-top: 6%"> 
                            <input class="btn btn-outline-success btn-small w-75 fw-bold" type="submit"  <%= (laDemande_rh!= null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />
                        </div>
                    </div>       
            </div>
    </div>
</form>

</div>
<div class="col-6" style="padding-left:3%"> 
<script>
function PlaceLesAttributs()
{
    let lesattributs=["email","nom","prenom","tel","fonction","salaire","niveau_diplome","droits","id_planning","id_manager","id_local"];
    let n;
    let chaine ='';
    for(let i=0; i<=10; i++)
    {
        if(document.getElementById(lesattributs[i]).checked == true)
        {
            console.log(lesattributs[i]);
            console.log("est checké");
            chaine += '<div class="col-12" style="width:100%">';
			chaine += '<input type="text"  class="form-control" name="'+lesattributs[i]+'" placeholder="'+lesattributs[i]+'">';
			chaine += '</div>';
        }else{
            chaine += '<input type="hidden"  class="form-control" name="'+lesattributs[i]+'" value="">';
        }
        
    }
    if(document.getElementById("adresse").checked == true)
    {
        chaine += '<div class="col-12" style="width:100%">';
		chaine += '<input type="text"  class="form-control" name="rue" placeholder="rue">';
        chaine += '<input type="text"  class="form-control" name="numrue" placeholder="numero de rue">';
        chaine += '<input type="text"  class="form-control" name="ville" placeholder="ville">';
        chaine += '<input type="text"  class="form-control" name="cp" placeholder="Code postal">';
		chaine += '</div>';
    }else{
        chaine += '<input type="hidden"  class="form-control" name="rue" value=""></br>';
        chaine += '<input type="hidden"  class="form-control" name="numrue" value=""></br>';
        chaine += '<input type="hidden"  class="form-control" name="ville" value=""></br>';
        chaine += '<input type="hidden"  class="form-control" name="cp" value="">';
    }
    document.getElementById("attributschoisis").innerHTML = chaine;
}
//Code Javascript

function jetestemestrucs(){

let e = document.getElementById("mon-select");
let value = e.value;
let text = e.options[e.selectedIndex].text;

alert("la value est :"+value);
alert(text);

}

</script>



<!-- HTML -->
<!-- Appel des feuilles de styles scripts Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
<!-- Inclusion des feuilles de styles et script pour le composant Bootstrap-select -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>

<!-- Select à utiliser -->
