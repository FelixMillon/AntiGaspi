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

            foreach(Client unClient in lesClients)
        {   
             chaine += "<tr>";
             chaine += "<td>"+unClient.IdPers+"</td>";
             chaine += "<td>"+unClient.Nom+"</td>";
             chaine += "<td>"+unClient.Prenom+"</td>";
             chaine += "<td>"+unClient.Adresse+"</td>";
             chaine += "<td>"+unClient.Email+"</td>";

             chaine += "<td>";
             chaine += "<a href='Default.aspx?page=1&action=sup&idclient="+ unClient.IdPers+"'>Supprimer</a>";
             chaine += "</td>";

             chaine += "<td>";
             chaine += "<a href='Default.aspx?page=1&action=edit&idclient="+unClient.IdPers+"'>Modifier</a>";
             chaine += "</td>";

             chaine += "</tr>";
        }
        chaine += "</table>"; 
    %>
        
<%= chaine %>
