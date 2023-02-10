<div class="table-responsive w-100" style="height:40vh;border : 4px solid #9FC490;  border-radius: 10px;">
    <table class="table table-striped table-sm" >
        <tr class="text-center fw-bold" style="background:#9FC490;opacity : 0.57; border-bottom: 4px solid #9FC490; ">
            <td>ID</td>
            <td>Libelle</td>
            <td>Salaire</td>
            <td>Catégorie</td>

            <td>Action</td>
        </tr>
        
        <%

    foreach(VMetier unMetier in lesMetiers)
    {   
         chaine += "<tr class='text-center' >";
         chaine += "<td>"+unMetier.Id_met+"</td>";
         chaine += "<td>"+unMetier.Libelle+"</td>";
         chaine += "<td>"+unMetier.Niveau_salaire+"</td>";
         chaine += "<td>"+unMetier.Nomcatmet"</td>";

         chaine += "<td>";
         chaine += "<a href='Default.aspx?page=16&action=sup&id_met=" + unMetier.Id_met + "'><img src='images/sup.png' height='35' width='35'></br>";
         chaine += "<a href='Default.aspx?page=16&action=edit&id_met=" + unMetier.Id_met + "'><img src='images/edit.png' height='35' width='35'></a>";
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