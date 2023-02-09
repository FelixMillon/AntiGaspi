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
                        <div class="col-12">
                        <select class='inscricase form-Select text-center fw-bold w-100' style='border:3px solid #9FC490' name="type_operation" id="type_op" onchange="choixcases();">
                            <option value="" selected disabled hidden> ---- Type d'opération ----</option>
                            <option value="insert"> Ajout d'un employé </option>
                            <option value="update"> Modification d'un employé </option>
                            <option value="delete"> Suppression d'un employé </option>
                        </select>
                        </div>
                        <div id="casechoisis"></div> 
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


                                <%
                                    string chaineEmployerh = ""; 
                                foreach(Employe unEmploye in lesEmploye_rhs)
                                {
                                    chaineEmployerh += "<option value='" + unEmploye.Id_employe + "'>"; 
                                        chaineEmployerh += unEmploye.Nom + " " + unEmploye.Prenom; 
                                        chaineEmployerh += "</option>";
                                }
                                
                                %>
                                <%
                                    string chaineManagerrh = ""; 
                                    foreach(Manager unManager in lesManager_rhs)
                                    {
                                        chaineManagerrh += "<option value='" + unManager.Id_manager + "'>"; 
                                            chaineManagerrh += unManager.Nom + " " + unManager.Prenom; 
                                            chaineManagerrh += "</option>";
                                    }
                                    
                                    %>

                                      
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
    let choix = document.getElementById("type_op").value;


    let lesattributs=["email","nom","prenom","tel","fonction","salaire","niveau_diplome","id_planning","id_manager","id_local"];
    let n;
    let chaine = '';
    document.getElementById("attributschoisis").innerHTML = "";
    if(choix == "update")
    {
        chaine += '<div class="row">';
        for(let i=0; i<=9; i++)
        {
            if(document.getElementById(lesattributs[i]).checked == true)
            {
                chaine+='<div class="col-6">';
                chaine += '<input type="text"  class="form-control" name="'+lesattributs[i]+'" placeholder="'+lesattributs[i]+'">';
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden"  class="form-control" name="'+lesattributs[i]+'" value="">';
            }
        }
        if(document.getElementById("adresse").checked == true)
        {
            chaine+='<div class="col-6">';
            chaine += '<input type="text"  class="form-control" name="rue" placeholder="rue">';
            chaine+='</div>';
            chaine+='<div class="col-6">';
            chaine += '<input type="text"  class="form-control" name="numrue" placeholder="numero de rue">';
            chaine+='</div>';
            chaine+='<div class="col-6">';
            chaine += '<input type="text"  class="form-control" name="ville" placeholder="ville">';
            chaine+='</div>';
            chaine+='<div class="col-6">';
            chaine += '<input type="text"  class="form-control" name="cp" placeholder="Code postal">';
            chaine+='</div>';
        }else{
            chaine += '<input type="hidden"  class="form-control" name="rue" value="">';
            chaine += '<input type="hidden"  class="form-control" name="numrue" value="">';
            chaine += '<input type="hidden"  class="form-control" name="ville" value="">';
            chaine += '<input type="hidden"  class="form-control" name="cp" value="">';
        }
        if(document.getElementById("droits").checked == true)
        {
            chaine+='<div class="col-12" style="width:100%">';
            chaine += '<select class="inscricase form-Select text-center fw-bold w-100" style="border:3px solid #9FC490"  name="droits" >';
                chaine += '<option value="" selected disabled hidden> ---- Droits ----</option>';
                chaine += '<option value="administrateur"> Administrateur </option>';
                chaine += '<option value="developpeur"> Developpeur </option>';
                chaine += '<option value="collaborateur"> Collaborateur </option>';
                chaine += '<option value="consultant"> Consultant </option>';
                chaine += '<option value="invite"> Invite </option>';
                chaine += '<option value="client"> Client </option>';
                chaine += '<option value="administrateur_rh"> Administrateur_rh </option>';
                chaine += '<option value="rh"> Rh </option>';
            chaine += '</select>';
            chaine+='</div>';
            
        }else{
            chaine += '<input type="hidden"  class="form-control" name="droits" value="">';
        }
        chaine += '<div>';
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

function choixcases()
{
    document.getElementById("casechoisis").innerHTML = "";
    document.getElementById("attributschoisis").innerHTML = "";
    let choix = document.getElementById("type_op").value;
    let chaine= "";
    if(choix == "insert")
    {
        let lesattributs=["email","nom","prenom","tel","fonction","salaire","niveau_diplome","id_planning","id_manager","id_local"];
        chaine += '<div class="row">';
        for(let i=0; i<=9; i++)
        {
            chaine += '<div class="col-6">';
            chaine += '<input type="text"  class="form-control" name="'+lesattributs[i]+'" placeholder="'+lesattributs[i]+'">';
            chaine += '</div>';
        }
        chaine += '<div class="col-6">';
        chaine += '<input type="text"  class="form-control" name="rue" placeholder="rue">';
        chaine += '</div>';
        chaine += '<div class="col-6">';
        chaine += '<input type="text"  class="form-control" name="numrue" placeholder="numero de rue">';
        chaine += '</div>';
        chaine += '<div class="col-6">';
        chaine += '<input type="text"  class="form-control" name="ville" placeholder="ville">';
        chaine += '</div>';
        chaine += '<div class="col-6">';
        chaine += '<input type="text"  class="form-control" name="cp" placeholder="Code postal">';
        chaine += '</div>';
        chaine+='<div class="col-12" style="width:100%">';
        chaine += '<select class="inscricase form-Select text-center fw-bold w-100" style="border:3px solid #9FC490"  name="droits" >';
            chaine += '<option value="" selected disabled hidden> ---- Droits ----</option>';
            chaine += '<option value="administrateur"> Administrateur </option>';
            chaine += '<option value="developpeur"> Developpeur </option>';
            chaine += '<option value="collaborateur"> Collaborateur </option>';
            chaine += '<option value="consultant"> Consultant </option>';
            chaine += '<option value="invite"> Invite </option>';
            chaine += '<option value="client"> Client </option>';
            chaine += '<option value="administrateur_rh"> Administrateur_rh </option>';
            chaine += '<option value="rh"> Rh </option>';
        chaine += '</select>';
        chaine += '</div>';
        chaine += '</div>';
    }else if(choix == "update")
    {
        chaine+='<div class="row">';
        chaine+='<label class="reponse" > Attributs à modifier :</label>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input type="radio" id="email" onchange="PlaceLesAttributs()"/> Email';
        chaine+='</div>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input type="radio" id="nom" onchange="PlaceLesAttributs()"/> Nom';
        chaine+='</div>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input type="radio" id="prenom" onchange="PlaceLesAttributs()"/> Prenom';
        chaine+='</div>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input class="reponse" type="radio" id="tel" onchange="PlaceLesAttributs()"/> Tel';
        chaine+='</div>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input class="reponse" type="radio" id="adresse" onchange="PlaceLesAttributs()"/> Adresse';
        chaine+='</div>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input class="reponse" type="radio" id="fonction" onchange="PlaceLesAttributs()"/> Fonction';
        chaine+='</div>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input class="reponse" type="radio" id="salaire" onchange="PlaceLesAttributs()"/> Salaire';
        chaine+='</div>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input class="reponse" type="radio" id="niveau_diplome" onchange="PlaceLesAttributs()"/> Niveau du diplome';
        chaine+='</div>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input class="reponse" type="radio" id="droits" onchange="PlaceLesAttributs()"/> Droits';
        chaine+='</div>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input class="reponse" type="radio" id="id_planning" onchange="PlaceLesAttributs()"/> Planning';
        chaine+='</div>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input class="reponse" type="radio" id="id_manager" onchange="PlaceLesAttributs()"/> Manager';
        chaine+='</div>';
        chaine+='<div class="col-md-3 reponse">';
        chaine+='<input class="reponse" type="radio" id="id_local" onchange="PlaceLesAttributs()"/> Locaux';
        chaine+='</div>';
        chaine+='</div>';
        chaine+='<div class="col-12" style="width:100%">';
            chaine+='<select class="inscricase form-select text-center fw-bold" name="id_employe" style="border:3px solid #9FC490">';
            chaine+="<option value=''>Selectionner l'employé</option>";
            chaine+="<%= chaineEmployerh %>";
            chaine+='</select>';
        chaine+='</div>';
    }else if(choix=="delete" )
    {
        chaine+='<div class="col-12" style="width:100%">';
            chaine+='<select class="inscricase form-Select text-center fw-bold w-100" style="border:3px solid #9FC490"  name="id_employe">';
            chaine+="<option value=''>Selectionner l'employé</option>";
            chaine+="<%= chaineEmployerh %>";
            chaine+='</select>';
        chaine+='</div>';
    }
    document.getElementById("casechoisis").innerHTML = chaine;
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
