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
                        <select class='inscricase form-select text-center fw-bold w-100' style='border:3px solid #9FC490' name="type_operation" id="type_op" onchange="choixcases();">
                            <option value="" selected disabled hidden> ---- Type d'opération ----</option>
                            <option value="insert"> Ajout d'un employé </option>
                            <option value="update"> Modification d'un employé </option>
                            <option value="delete"> Suppression d'un employé </option>
                        </select>
                        </div>
                        
          
                        <div id="casegauche"></div>

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

                                      
                        <div class="col-6" > 
                            <input class="btn btn-outline-danger btn-small w-75 fw-bold" type="reset" name="Annuler" value="Annuler" onclick="clearcases()">
                        </div>
                        <div class="col-6"> 
                            <input class="btn btn-outline-success btn-small w-75 fw-bold" type="submit"  <%= (laDemande_rh!= null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider' " %> />
                        </div>
                    </div>       
            </div>
    </div>
</form>

</div>
<div class="col-6" style="padding-left:3% ;padding-top:6%"> 
<script>
function PlaceLesAttributs()
{
    let choix = document.getElementById("type_op").value;


    let lesattributs=["email","nom","prenom","tel","fonction","salaire","niveau_diplome","id_planning","id_manager","id_local"];
    let n;
    let chaine = '';
    document.getElementById("casegauche").innerHTML = "";
    if(choix == "update")
    {
        chaine += '<div class="row py-2" style="overflow-y :scroll; overflow-x :hidden; height : 30vh; border : 3px #9FC490 solid">'; 
        for(let i=0; i<=9; i++)
        {
            if(document.getElementById(lesattributs[i]).checked == true)
            {
                chaine+='<div class="col-6">';
                chaine += '<input type="text" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="'+lesattributs[i]+'" placeholder="'+lesattributs[i]+'">';
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="'+lesattributs[i]+'" value="">';
            }
        }
        if(document.getElementById("adresse").checked == true)
        {
            chaine+='<div class="col-6">';
            chaine += '<input type="text"  class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="rue" placeholder="rue">';
            chaine+='</div>';
            chaine+='<div class="col-6">';
            chaine += '<input type="text"  class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="numrue" placeholder="numero de rue">';
            chaine+='</div>';
            chaine+='<div class="col-6">';
            chaine += '<input type="text"  class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="ville" placeholder="ville">';
            chaine+='</div>';
            chaine+='<div class="col-6">';
            chaine += '<input type="text"  class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="cp" placeholder="Code postal">';
            chaine+='</div>';
        }else{
            chaine += '<input type="hidden"  class="form-control" name="rue" value="">';
            chaine += '<input type="hidden"  class="form-control" name="numrue" value="">';
            chaine += '<input type="hidden"  class="form-control" name="ville" value="">';
            chaine += '<input type="hidden"  class="form-control" name="cp" value="">';
        }
        if(document.getElementById("droits").checked == true)
        {
            chaine +='<div class="col-12">';
            chaine += '<select class="inscricase form-Select text-center fw-bold w-100" style="border:3px solid #9FC490;"  name="droits" >';
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
        chaine+='</div>';
        chaine+='<div class="col-12" style="width:100%">';
        chaine +='<select class="inscricase form-select text-center fw-bold" name="id_employe" style="border:3px solid #9FC490; margin-top : 3%">';
            chaine+="<option value=''>Selectionner l'employé</option>";
            chaine+="<%= chaineEmployerh %>";
            chaine+='</select>';
        chaine+='</div>';
        chaine += '<div>';
    }
    document.getElementById("casegauche").innerHTML = chaine;
}
//Code Javascript

function jetestemestrucs(){

let e = document.getElementById("mon-select");
let value = e.value;
let text = e.options[e.selectedIndex].text;

alert("la value est :"+value);
alert(text);

    }

function clearcases()
{
    document.getElementById("casedroite").innerHTML = "";
    document.getElementById("casegauche").innerHTML = "";
}

function choixcases()
{
    document.getElementById("casedroite").innerHTML = "";
    document.getElementById("casegauche").innerHTML = "";
    let choix = document.getElementById("type_op").value;
    let chaine= "";
    if(choix == "insert"){
        let lesattributs=["email","nom","prenom","tel","fonction","salaire","niveau_diplome","id_planning","id_manager","id_local"];
        chaine += '<div class="row py-3" style="overflow-y :scroll; overflow-x :hidden; height : 30vh; border : 3px #9FC490 solid">'; 
        for(let i=0; i<=9; i++)
        {
            chaine += '<div class="col-6">';
            chaine += '<input type="text"  class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490; margin-top: 3%" name="'+lesattributs[i]+'" placeholder="'+lesattributs[i]+'">';
            chaine += '</div>';
        }
        chaine += '<div class="col-6">';
        chaine += '<input type="text" class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490; margin-top: 3%" name="rue" placeholder="rue">';
        chaine += '</div>';
        chaine += '<div class="col-6">';
        chaine += '<input type="text"  class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490; margin-top: 3%" name="numrue" placeholder="numero de rue">';
        chaine += '</div>';
        chaine += '<div class="col-6">';
        chaine += '<input type="text"  class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490; margin-top: 3%" name="ville" placeholder="ville">';
        chaine += '</div>';
        chaine += '<div class="col-6">';
        chaine += '<input type="text"  class="inscricase form-control text-center fw-bold" style="border:3px solid #9FC490; margin-top: 3%" name="cp" placeholder="Code postal">';
        chaine += '</div>';
        chaine+='<div class="col-12" style="width:100%">';
        chaine += '<select class="inscricase form-Select text-center fw-bold w-100" style="border:3px solid #9FC490 ; margin-top: 3%"  name="droits" >';
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
        document.getElementById("casegauche").innerHTML = chaine;
    }else if(choix == "update"){
        chaine += '<center> Attributs à modifier :</center>';
        chaine += '<div class="row row-cols-2 row-cols-lg-4 g-2 g-lg-3">';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="email" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Email</label>';
        chaine += '</div>';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="nom" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Nom</label>';
        chaine += '</div>';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="prenom" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Prénom</label>';
        chaine += '</div>';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="tel" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Téléphone</label>';
        chaine += '</div>';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="adresse" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Adresse</label>';
        chaine += '</div>';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="fonction" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Fonction</label>';
        chaine += '</div>';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="salaire" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Salaire</label>';
        chaine += '</div>';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="droits" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Droits</label>';
        chaine += '</div>';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="id_planning" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Planning</label>';
        chaine += '</div>';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="niveau_diplome" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Niveau diplome</label>';
        chaine += '</div>';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="id_manager" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Manager</label>';
        chaine += '</div>';

        chaine += '<div class="col-3 form-check form-switch">';
        chaine += '<input class="form-check-input" type="checkbox" id="id_local" onchange="PlaceLesAttributs()"/>';
        chaine += '<label class="form-check-label" for="flexSwitchCheckDefault">Local</label>';
        chaine += '</div>';

        document.getElementById("casedroite").innerHTML = chaine;

    }else if(choix=="delete" ){
        chaine+='<div class="col-12" style="width:100%">';
            chaine+='<select class="inscricase form-Select text-center fw-bold w-100" style="border:3px solid #9FC490"  name="id_employe">';
            chaine+="<option value=''>Selectionner l'employé</option>";
            chaine+="<%= chaineEmployerh %>";
            chaine+='</select>';
        chaine+='</div>';
        document.getElementById("casegauche").innerHTML = chaine;
    }
}

</script>