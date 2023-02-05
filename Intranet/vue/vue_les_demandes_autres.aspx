<div class="table-responsive w-100" style="height:40vh;border : 4px solid #9FC490;  border-radius: 10px;">
    <table class="table table-striped table-sm" >
        <tr class="text-center fw-bold" style="background:#9FC490;opacity : 0.57; border-bottom: 4px solid #9FC490; ">
            <td>ID</td>
            <td>Libelle</td>
            <td>Description</td>
            <td>Date demande</td>
            <td>Date resolution</td>
            <td>Etat</td>
            <td>Employe</td>
            <td>Manager</td>
        </tr>
        
        <%

    foreach(VDemande_autre uneDemande_autre in lesDemande_autres)
    {   
         chaine += "<tr>";
         chaine += "<td>"+uneDemande_autre.Id_demande_autre+"</td>";
         chaine += "<td>"+uneDemande_autre.Libelle+"</td>";
         chaine += "<td>"+uneDemande_autre.Description+"</td>";
         chaine += "<td>"+uneDemande_autre.Date_demande+"</td>";
         chaine += "<td>"+uneDemande_autre.Date_resolution+"</td>";
         chaine += "<td>"+uneDemande_autre.Etat+"</td>";
         chaine += "<td>"+uneDemande_autre.NomE+" "+uneDemande_autre.PrenomE+"</td>";
         chaine += "<td>"+uneDemande_autre.NomM+" "+uneDemande_autre.PrenomM+"</td>";

         chaine += "<td>";
         chaine += "<a href='Default.aspx?page=4&action=sup&id_demande_autre="+ uneDemande_autre.Id_demande_autre+"'>Supprimer</a>";
         chaine += "</td>";

         chaine += "<td>";
         chaine += "<a href='Default.aspx?page=4&action=edit&id_demande_autre="+uneDemande_autre.Id_demande_autre+"'>Modifier</a>";
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