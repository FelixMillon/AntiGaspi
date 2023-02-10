<div class="table-responsive w-100" style="height:40vh;border : 4px solid #9FC490;  border-radius: 10px;">
    <table class="table table-striped table-sm" >
        <tr class="text-center fw-bold" style="background:#9FC490;opacity : 0.57; border-bottom: 4px solid #9FC490; ">
            <td>ID</td>
            <td>Libelle</td>
            <td>Description</td>
            <td>Actions</td>
        </tr>
        
        <%

    foreach(Categorie_metier uneCategorie_metier in lesCategorie_metiers)
    {   
         chaine += "<tr class='text-center' >";
         chaine += "<td>"+uneCategorie_metier.Id_cat_met+"</td>";
         chaine += "<td>"+uneCategorie_metier.Libelle+"</td>";
         chaine += "<td>"+uneCategorie_metier.Description+"</td>";

         chaine += "<td>";
         chaine += "<a href='Default.aspx?page=12&action=sup&id_cat_met=" + uneDemande_autre.id_cat_met + "'><img src='images/sup.png' height='35' width='35'></br>";
         chaine += "<a href='Default.aspx?page=12&action=edit&id_cat_met=" + uneDemande_autre.id_cat_met + "'><img src='images/edit.png' height='35' width='35'></a>";
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