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
                           <option value='delete'> Suppression d'un employé </option>

                        </select>
                        </div>
                        
          
                        <div id="casegauche"></div>

                        <div class='col-12'>
                        <%
                            string idsession = Session["id"].ToString();
                        string chaineEtat2 = "";
                        if (laDemande_rh!= null && Session["droits"].ToString() == "administrateur_rh"){
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
                        string chaineManagerh = "";
                        foreach(Manager unManager in lesManager_rhs)
                        {
                            chaineManagerh += "<option value='" + unManager.Id_manager + "'>"; 
                                chaineManagerh += unManager.Nom + " " + unManager.Prenom; 
                                chaineManagerh += "</option>";
                        }
                        string chainePlanningh = "";
                        foreach(Planning unPlanning in lesPlanning_rhs)
                        {
                            chainePlanningh += "<option value='" + unPlanning.Id_planning + "'>"; 
                                chainePlanningh += unPlanning.Libelle; 
                                chainePlanningh += "</option>";
                        }
                        string chaineLocalh = "";
                        foreach(Local unLocal in lesLocal_rhs)
                        {
                            chaineLocalh += "<option value='" + unLocal.Id_local + "'>"; 
                                chaineLocalh += unLocal.Nom + " " + unLocal.Ville; 
                                chaineLocalh += "</option>";
                        }
                        %>
                        <%
                            if(leEmploye_rhs!=null)
                            {
                                leEmploye_rhs_email = leEmploye_rhs.Email;
                                leEmploye_rhs_nom = leEmploye_rhs.Nom;
                                leEmploye_rhs_prenom = leEmploye_rhs.Prenom;
                                leEmploye_rhs_tel = leEmploye_rhs.Tel;
                                leEmploye_rhs_numrue = leEmploye_rhs.Numrue;
                                leEmploye_rhs_rue = leEmploye_rhs.Rue;
                                leEmploye_rhs_ville = leEmploye_rhs.Ville;
                                leEmploye_rhs_cp = leEmploye_rhs.Cp;
                                leEmploye_rhs_fonction = leEmploye_rhs.Fonction;
                                leEmploye_rhs_salaire = leEmploye_rhs.Salaire.ToString();
                                leEmploye_rhs_droits = leEmploye_rhs.Droits;
                                leEmploye_rhs_id_planning = leEmploye_rhs.Id_planning.ToString();
                                leEmploye_rhs_niveau_diplome = leEmploye_rhs.Niveau_diplome;
                                leEmploye_rhs_id_manager = leEmploye_rhs.Id_manager.ToString();
                                leEmploye_rhs_id_local = leEmploye_rhs.Id_local.ToString();
                                
                            }
                        %>

                                      
                        <div class="col-6" > 
                            <input class="btn btn-outline-danger btn-small w-75 fw-bold" type="submit" name="Annuler" value="Annuler" onclick="clearcases()">
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
    var url = window.location.href;
    let choix = document.getElementById("type_op").value;
    let lesattributs=["email","nom","prenom","tel","fonction","salaire","niveau_diplome","id_planning","id_manager","id_local"];
    let n;
    let chaine = '';
    document.getElementById("casegauche").innerHTML = "";
    if(
        document.getElementById("email").checked == true
        || document.getElementById("nom").checked == true
        || document.getElementById("prenom").checked == true
        || document.getElementById("tel").checked == true
        || document.getElementById("fonction").checked == true
        || document.getElementById("salaire").checked == true
        || document.getElementById("niveau_diplome").checked == true
        || document.getElementById("id_planning").checked == true
        || document.getElementById("id_manager").checked == true
        || document.getElementById("id_local").checked == true
        || document.getElementById("droits").checked == true
        || document.getElementById("adresse").checked == true
    )
    {
        if(choix == "update")
        {

            chaine += '<div class="row py-2" style="overflow-y :scroll; overflow-x :hidden; height : 30vh; border : 3px #9FC490 solid">';
            //email
            if(document.getElementById("email").checked == true)
            {
                chaine+='<div class="col-6">';
                chaine+='<input type="text" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="email" ';
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+='value="'+"<%= leEmploye_rhs_email %>"+'">';
                }else{
                    chaine+='placeholder="Email">';
                }
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="email" value="">';
            }
            //nom
            if(document.getElementById("nom").checked == true)
            {
                chaine+='<div class="col-6">';
                chaine+='<input type="text" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="nom" ';
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+='value="'+"<%= leEmploye_rhs_nom %>"+'">';
                }else{
                    chaine+='placeholder="Nom">';
                }
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="nom" value="">';
            }
            //prenom
            if(document.getElementById("prenom").checked == true)
            {
                chaine+='<div class="col-6">';
                chaine+='<input type="text" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="prenom" ';
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+='value="'+"<%= leEmploye_rhs_prenom %>"+'">';
                }else{
                    chaine+='placeholder="Prenom">';
                }
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="prenom" value="">';
            }
            //tel
            if(document.getElementById("tel").checked == true)
            {
                chaine+='<div class="col-6">';
                chaine+='<input type="text" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="tel" ';
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+='value="'+"<%= leEmploye_rhs_tel %>"+'">';
                }else{
                    chaine+='placeholder="Telephone">';
                }
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="tel" value="">';
            }
            //fonction
            if(document.getElementById("fonction").checked == true)
            {
                chaine+='<div class="col-6">';
                chaine+='<input type="text" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="fonction" ';
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+='value="'+"<%= leEmploye_rhs_fonction %>"+'">';
                }else{
                    chaine+='placeholder="Fonction">';
                }
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="fonction" value="">';
            }
            //salaire
            if(document.getElementById("salaire").checked == true)
            {
                chaine+='<div class="col-6">';
                chaine+='<input type="text" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="salaire" ';
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+='value="'+"<%= leEmploye_rhs_salaire %>"+'">';
                }else{
                    chaine+='placeholder="Salaire">';
                }
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="salaire" value="">';
            }
            //niveau_diplome
            if(document.getElementById("niveau_diplome").checked == true)
            {
                chaine+='<div class="col-6">';
                chaine+='<input type="text" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="niveau_diplome" ';
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+='value="'+"<%= leEmploye_rhs_niveau_diplome %>"+'">';
                }else{
                    chaine+='placeholder="Niveau_diplome">';
                }
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="niveau_diplome" value="">';
            }
            //id_planning
            if(document.getElementById("id_planning").checked == true)
            {
                chaine+='<div class="col-6">';
                chaine +='<select class="inscricase form-select text-center fw-bold" name="id_planning" style="border:3px solid #9FC490; margin-top : 3%">';
                chaine+="<option value='";
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+="<%= leEmploye_rhs_id_planning %>";
                }
                chaine+="'>Planning</option>";
                chaine+="<%= chainePlanningh %>";
                chaine+='</select>';
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="id_planning" value="">';
            }
            //id_manager
            if(document.getElementById("id_manager").checked == true)
            {

                chaine+='<div class="col-6">';
                chaine +='<select class="inscricase form-select text-center fw-bold" name="id_manager" style="border:3px solid #9FC490; margin-top : 3%">';
                chaine+="<option value='";
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+="<%= leEmploye_rhs_id_manager %>";
                }
                chaine+="'>Manager</option>";
                chaine+="<%= chaineManagerh %>";
                chaine+='</select>';
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="id_manager" value="">';
            }
            //id_local
            if(document.getElementById("id_local").checked == true)
            {
                chaine+='<div class="col-6">';
                chaine +='<select class="inscricase form-select text-center fw-bold" name="id_local" style="border:3px solid #9FC490; margin-top : 3%">';
                chaine+="<option value='";
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+="<%= leEmploye_rhs_id_local %>";
                }
                chaine+="'>Local</option>";
                chaine+="<%= chaineLocalh %>";
                chaine+='</select>';
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="id_local" value="">';
            }
            //adresse (rue,numrue,ville,cp)
            if(document.getElementById("adresse").checked == true)
            {
                chaine+='<div class="col-6">';
                chaine += '<input type="text"  class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="rue" ';
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+='value="'+"<%= leEmploye_rhs_rue %>"+'">';
                }else{
                    chaine+='placeholder="Rue">';
                }
                chaine+='</div>';
                chaine+='<div class="col-6">';
                chaine += '<input type="text"  class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="numrue" ';
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+='value="'+"<%= leEmploye_rhs_numrue %>"+'">';
                }else{
                    chaine+='placeholder="Numero de rue">';
                }
                chaine+='</div>';
                chaine+='<div class="col-6">';
                chaine += '<input type="text"  class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="ville" ';
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+='value="'+"<%= leEmploye_rhs_ville %>"+'">';
                }else{
                    chaine+='placeholder="Ville">';
                }
                chaine+='</div>';
                chaine+='<div class="col-6">';
                chaine += '<input type="text"  class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="cp" ';
                if(url.indexOf('&id_employe=') != -1)
                {
                    chaine+='value="'+"<%= leEmploye_rhs_cp %>"+'">';
                }else{
                    chaine+='placeholder="Code Postal">';
                }
                chaine+='</div>';
            }else{
                chaine += '<input type="hidden"  class="form-control" name="rue" value="">';
                chaine += '<input type="hidden"  class="form-control" name="numrue" value="">';
                chaine += '<input type="hidden"  class="form-control" name="ville" value="">';
                chaine += '<input type="hidden"  class="form-control" name="cp" value="">';
            }
            if(document.getElementById("droits").checked == true)
            {
                chaine +='<div class="col-12" style="width:100%">';
                chaine += '<select class="inscricase form-Select text-center fw-bold w-100" style="border:3px solid #9FC490; margin-top: 3%"   name="droits" >';
                    if(url.indexOf('&id_employe=') != -1)
                    {
                        chaine += '<option value="'+"<%= leEmploye_rhs_droits %>"+'" selected disabled hidden>Droits:'+"<%= leEmploye_rhs_droits %>"+'</option>';
                    }else{
                        chaine += '<option value="" selected disabled hidden> ---- Droits ----</option>';
                    }
                    
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
            if("<%= lesEmploye_rhs.Count %>"=="1")
            {
                chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="id_employe" value="'+"<%= idsession %>"+'">';
            }else{
                chaine+='<div class="col-12" style="width:100%">';
                    chaine+='<select class="inscricase form-Select text-center fw-bold w-100" style="border:3px solid #9FC490"  name="id_employe">';
                    chaine+="<option value=''>Selectionner l'employé</option>";
                    chaine+="<%= chaineEmployerh %>";
                    chaine+='</select>';
                chaine+='</div>';
            }
            chaine += '<div>';
        }
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
        let lesattributs=["email","nom","prenom","tel","fonction","salaire","niveau_diplome"];
        chaine += '<div class="row py-3" style="overflow-y :scroll; overflow-x :hidden; height : 30vh; border : 3px #9FC490 solid">'; 
        for(let i=0; i<=6; i++)
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
        //id_planning
        chaine+='<div class="col-6">';
        chaine +='<select class="inscricase form-select text-center fw-bold" name="id_planning" style="border:3px solid #9FC490; margin-top : 3%">';
        chaine+="<option value='";
        chaine+="'>Planning</option>";
        chaine+="<%= chainePlanningh %>";
        chaine+='</select>';
        chaine+='</div>';
        //id_manager
        chaine+='<div class="col-6">';
        chaine +='<select class="inscricase form-select text-center fw-bold" name="id_manager" style="border:3px solid #9FC490; margin-top : 3%">';
        chaine+="<option value='";
        chaine+="'>Manager</option>";
        chaine+="<%= chaineManagerh %>";
        chaine+='</select>';
        chaine+='</div>';
        //id_local
        chaine+='<div class="col-6">';
        chaine +='<select class="inscricase form-select text-center fw-bold" name="id_local" style="border:3px solid #9FC490; margin-top : 3%">';
        chaine+="<option value='";
        chaine+="'>Local</option>";
        chaine+="<%= chaineLocalh %>";
        chaine+='</select>';
        chaine+='</div>';
        //droits
        chaine += '<div>';
        chaine+='<div class="col-12" style="width: 100%">';
        chaine += '<select class="inscricase form-Select text-center fw-bold w-100" name="droits" style="border:3px solid #9FC490; margin-top : 3%;">';
            chaine += '<option value="">Droits</option>';
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

    }else if(choix=="delete"){
        if("<%= lesEmploye_rhs.Count %>"=="1")
        {
            chaine += '<input type="hidden" class="form-control" style="border:3px solid #9FC490; margin-top: 3%" name="id_employe" value="'+"<%= idsession %>"+'">';
        }else{
            chaine+='<div class="col-12" style="width:100%">';
                chaine+='<select class="inscricase form-Select text-center fw-bold w-100" style="border:3px solid #9FC490"  name="id_employe">';
                chaine+="<option value=''>Selectionner l'employé</option>";
                chaine+="<%= chaineEmployerh %>";
                chaine+='</select>';
            chaine+='</div>';
        }
        document.getElementById("casegauche").innerHTML = chaine;
    }
}

</script>