<h2> Liste des clients </h2>

 
<table border='1'>

    <tr>
        <td>Id Client</td>
        <td>Nom</td>
        <td>Prénom</td>
        <td>Adresse</td>
        <td>Email</td>
        <td>Opération</td>
    </tr>
   
        <%
            foreach(Technicien unTechnicien in lesTechniciens)
        {   
             chaine += "<tr>";
             chaine += "<td>" + unTechnicien.IdPers + "</td>";
             chaine += "<td>" + unTechnicien.Nom + "</td>";
             chaine += "<td>" + unTechnicien.Prenom + "</td>";
             chaine += "<td>" + unTechnicien.Qualification + "</td>";
             chaine += "<td>" + unTechnicien.Email + "</td>";

             chaine += "<td>";
             chaine += "<a href='Default.aspx?page=2&action=sup&idtechnicien=" + unTechnicien.IdPers + "'>Supprimer</a>";
             chaine += "</td>";

             chaine += "<td>";
             chaine += "<a href='Default.aspx?page=2&action=edit&idtechnicien=" + unTechnicien.IdPers + "'>Modifier</a>";
             chaine += "</td>";

             chaine += "</tr>";
        }
        chaine += "</table>"; 
    %>
        
<%= chaine %>
