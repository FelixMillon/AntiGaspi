<div class="table-responsive w-100" style="height:40vh;border : 4px solid #9FC490;  border-radius: 10px;">
    <table class="table table-striped table-sm" >
        <tr class="text-center fw-bold" style="background:#9FC490;opacity : 0.57; border-bottom: 4px solid #9FC490; ">
            <td>ID</td>

            <td>Libelle</td>
            <td>Description</td>

            <td>Action</td>
        </tr>
        
        <%

            foreach(Categorie_article uneCategorie_article in lesCategories_articles)
    {   
         chaine += "<tr class='text-center' >";
         chaine += "<td>" + uneCategorie_article.Id_cat_art + "</td>";
         chaine += "<td>" + uneCategorie_article.Libelle + "</td>";
         chaine += "<td>" + uneCategorie_article.Description + "</td>";


         chaine += "<td>";
         chaine += "<a href='Default.aspx?page=14&action=sup&id_cat_art=" + uneCategorie_article.Id_cat_art + "'><img src='images/sup.png' height='35' width='35'></br>";
         chaine += "<a href='Default.aspx?page=14&action=edit&id_cat_art=" + uneCategorie_article.Id_cat_art + "'><img src='images/edit.png' height='35' width='35'></a>";
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