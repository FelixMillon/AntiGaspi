


<%
    // Dictionary<string, int> tab = new Dictionary<string, string>();
    int Total = 0;
    foreach(VBadgeage unBadgeage in lesBadgeagesCal)
    {   
       // if (unBadgeage.Date_heure)
       // Total += unBadgeage.Date_heure;
    }


    %>





<div class="table-responsive w-100" style="height:40vh;border : 4px solid #9FC490;  border-radius: 10px;">
    <table class="table table-striped table-sm" >
        <tr class="text-center fw-bold" style="background:#9FC490;opacity : 0.57; border-bottom: 4px solid #9FC490; ">
            <td>Jours</td>
            <td>Durée</td>
        </tr>
       <tr class="text-center fw-bold">
            <td>Jours</td>
            <td><%= Total  %></td>
        </tr>

    </table>
</div>

