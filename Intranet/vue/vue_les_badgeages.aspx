<div class="table-responsive w-100" style="height:40vh;border : 4px solid #9FC490;  border-radius: 10px;">
    <table class="table table-striped table-sm" >
        <tr class="text-center fw-bold" style="background:#9FC490;opacity : 0.57; border-bottom: 4px solid #9FC490; ">
            <td>Date et heure</td>
            <td>Type</td>
            <td>Nom & Prénom Employe</td>
            <td>Action</td>
        </tr>
        
        <%

    foreach(VBadgeage unBadgeage in lesBadgeages)
    {   
         chaine += "<tr class='text-center'>";
         chaine += "<td>" + unBadgeage.Date_heure + "</td>";
         chaine += "<td>" + unBadgeage.Type + "</td>";
         chaine += "<td>" + unBadgeage.Nom + " " + unBadgeage.Prenom + "</td>";
         chaine += "<td>";
         chaine += "<a href='Default.aspx?page=11&action=sup&id_badgeage=" + unBadgeage.Id_badgeage + "'><img src='images/sup.png' height='35' width='35'></br>";
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