<div class="table-responsive w-100" style="height:40vh;border : 4px solid #9FC490;  border-radius: 10px;">
    <table class="table table-striped table-sm" >
        <tr class="text-center fw-bold" style="background:#9FC490;opacity : 0.57; border-bottom: 4px solid #9FC490;">
            <td>ID</td>
            <td>Nom </td>
            <td>N°</td>
            <td>Rue</td>
            <td>Ville</td>
            <td>CP</td>
            <td>Action</td>

        </tr>
        
        <%

        foreach(Local unLocal in lesLocals)
        {   
         chaine += "<tr class='text-center' >";
         chaine += "<td>" + unLocal.Id_local + "</td>";
         chaine += "<td>" + unLocal.Nom + "</td>";
         chaine += "<td>" + unLocal.Numrue + "</td>"; 
         chaine += "<td>" + unLocal.Rue + "</td>";
         chaine += "<td>" + unLocal.Ville + "</td>";
         chaine += "<td>" + unLocal.Cp + "</td>";

         chaine += "<td>";
         chaine += "<a href='Default.aspx?page=15&action=sup&id_local=" + unLocal.Id_local + "'><img src='images/sup.png' height='35' width='35'></br>";
         chaine += "<a href='Default.aspx?page=15&action=edit&id_local=" + unLocal.Id_local + "'><img src='images/edit.png' height='35' width='35'></a>";
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