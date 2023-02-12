<div class="table-responsive w-100" style="height:40vh;border : 4px solid #9FC490;  border-radius: 10px;">
    <table class="table table-striped table-sm" >
        <tr class="text-center fw-bold" style="background:#9FC490;opacity : 0.57; border-bottom: 4px solid #9FC490; ">
            <td>ID</td>
            <td>Libelle</td>
            <td>Objet</td>
            <td>Requete SQL</td>
            <td>Date demande</td>
            <td>Date resolution</td>
            <td>Etat</td>
            <td>Employe</td>
            <td>Manager</td>
            <td>Action</td>
        </tr>
        
        <%
            string le_id_de_la_requete = "";
    foreach(VDemande_rh uneDemande_rh in lesDemande_rhs)
    {   
        if (uneDemande_rh.Requete_sql.Split('|')[0] =="update")
        {
            le_id_de_la_requete = "&id_employe=" + uneDemande_rh.Requete_sql.Split('|')[2];
        }
        if (uneDemande_rh.Requete_sql.Split('|')[0] =="delete")
        {
            le_id_de_la_requete = "&id_employe=" + uneDemande_rh.Requete_sql.Split('|')[1];
        }
         chaine += "<tr class='text-center' >";
         chaine += "<td>" + uneDemande_rh.Id_demande_rh + "</td>";
         chaine += "<td>" + uneDemande_rh.Libelle + "</td>";
         chaine += "<td>" + uneDemande_rh.Objet + "</td>";
         chaine += "<td>" + uneDemande_rh.Requete_sql + "</td>";
         chaine += "<td>" + uneDemande_rh.Date_demande + "</td>";
         chaine += "<td>" + uneDemande_rh.Date_resolution + "</td>";
         chaine += "<td>" + uneDemande_rh.Etat + "</td>";
         chaine += "<td>" + uneDemande_rh.NomE + " " + uneDemande_rh.PrenomE + "</td>";
         chaine += "<td>" + uneDemande_rh.NomM + " " + uneDemande_rh.PrenomM + "</td>";

         chaine += "<td>";
         chaine += "<a href='Default.aspx?page=5&action=sup&id_demande_rh=" + uneDemande_rh.Id_demande_rh + "'><img src='images/sup.png' height='35' width='35'></a>";
         chaine += "<a href='Default.aspx?page=5&action=edit&id_demande_rh=" + uneDemande_rh.Id_demande_rh + le_id_de_la_requete + "'><img src='images/edit.png' height='35' width='35'></a>";
         chaine += "</td>";
         chaine += "</tr>";
    }
    chaine += "</table>"; 
%>
    
<%= chaine %>

</div>
<div  id="casedroite"></div> 

    
</div>

<div class="col-2"></div>

</div>