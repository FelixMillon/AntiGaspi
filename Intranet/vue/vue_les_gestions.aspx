<div class="table-responsive w-100" style="height:40vh;border : 4px solid #9FC490;  border-radius: 10px;">
    <table class="table table-striped table-sm" >
        <tr class="text-center fw-bold" style="background:#9FC490;opacity : 0.57; border-bottom: 4px solid #9FC490; ">
            <td>Libelle de l'action</td>
            <td>Description</td>
            <td>Date et heure</td>
            <td>Id employe</td>
            <td>Nom & Prénom employe</td>
            <td>Id utilisateur</td>
            <td>Nom & Prénom de l'utilisateur</td>
            <td>Action</td>
        </tr>
        
        <%

    foreach(VGerer uneGestion in lesGestions)
    {   
         chaine += "<tr class='text-center'>";
         chaine += "<td>" + uneGestion.Libelle_action + "</td>";
         chaine += "<td>" + uneGestion.Description_action + "</td>";
         chaine += "<td>" + uneGestion.Dateheure_action + "</td>";
         chaine += "<td>" + uneGestion.Id_employe + "</td>";
         chaine += "<td>" + uneGestion.Nom_emp + " " + uneGestion.Prenom_emp + "</td>";
         chaine += "<td>" + uneGestion.Id_utilisateur + "</td>";
         chaine += "<td>" + uneGestion.Nom_user + " " + uneGestion.Prenom_user + "</td>";

         chaine += "<td>";
         chaine += "<a href='Default.aspx?page=12&action=sup&id_utilisateur=" + uneGestion.Id_utilisateur + "&id_employe=" + uneGestion.Id_employe + "&dateheure_action=" + uneGestion.Dateheure_action + "'><img src='images/sup.png' height='35' width='35'></br>";
         chaine += "<a href='Default.aspx?page=12&action=edit&id_utilisateur=" + uneGestion.Id_utilisateur + "&id_employe=" + uneGestion.Id_employe + "&dateheure_action=" + uneGestion.Dateheure_action + "'><img src='images/edit.png' height='35' width='35'></a>";
         chaine += "</td>";

         chaine += "</tr>";
    }
    chaine += "</table>"; 
%>
    
<%= chaine %>

</div>


    
</div>

<div class="col-2"></div>

</div>