<h2> Liste des clients </h2>

 
<table border='1'>

    <tr>
        <td>Id Intervention</td>
        <td>Matériel</td>
        <td>Prix</td>
        <td>Date intervention</td>
        <td>Client</td>
        <td>Technicien</td>
        <td>Opération</td>
    </tr>
   
        <%
        foreach(Intervention uneIntervention in lesInterventions)
        {   
             chaine += "<tr>";
             chaine += "<td>" + uneIntervention.IdInter + "</td>";
             chaine += "<td>" + uneIntervention.Materiel + "</td>";
             chaine += "<td>" + uneIntervention.Prix + "</td>";
             chaine += "<td>" + uneIntervention.Dateinter + "</td>";
             chaine += "<td>" + uneIntervention.IdPersC + "</td>";
             chaine += "<td>" + uneIntervention.IdPersT + "</td>";

             chaine += "<td>";
             chaine += "<a href='Default.aspx?page=3&action=sup&idinter=" + uneIntervention.IdInter + "'>Supprimer</a>";
             chaine += "</td>";

             chaine += "<td>";
             chaine += "<a href='Default.aspx?page=3&action=edit&idinter=" + uneIntervention.IdInter + "'>Modifier</a>";
             chaine += "</td>";

             chaine += "</tr>";
        }
        chaine += "</table>"; 
    %>
        
<%= chaine %>