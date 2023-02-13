﻿<div class="table-responsive w-100" style="height:40vh;border : 4px solid #9FC490;  border-radius: 10px;">
    <table class="table table-striped table-sm" >
        <tr class="text-center fw-bold" style="background:#9FC490;opacity : 0.57; border-bottom: 4px solid #9FC490; ">
            <td>ID</td>

            <td>Titre</td>
            <td>Sous-titre</td>
            <td>Contenu</td>
            <td>Catégorie</td>
            <td>Auteur</td>
            <td>Action</td>
        </tr>        


        <%
            foreach(VArticle unArticle in lesArticles)
    {   
         chaine += "<tr class='text-center' >";
         chaine += "<td>" + unArticle.Id_article + "</td>";
         chaine += "<td class='text-truncate' style='max-width: 150px;' >" + unArticle.Titre + "</td>";
         chaine += "<td class='text-truncate' style='max-width: 150px;'>" + unArticle.Sous_titre + "</td>";
         chaine += "<td class='text-truncate' style='max-width: 150px;'>" + unArticle.Contenu + "</td>";
         chaine += "<td>"+unArticle.Categorie+"</td>";
         chaine += "<td>"+unArticle.Auteur+"</td>";

         chaine += "<td>";
         chaine += "<a href='Default.aspx?page=13&action=sup&id_article=" + unArticle.Id_article + "'><img src='images/sup.png' height='35' width='35'></br>";
         chaine += "<a href='Default.aspx?page=13&action=edit&id_article=" + unArticle.Id_article + "'><img src='images/edit.png' height='35' width='35'></a>";
         chaine += "</td>";

         chaine += "</tr>";
    }
    chaine += "</table>"; 
%>
    
<%= chaine %>

</div>


    
</div>

<div class="col-1"></div>

</div>