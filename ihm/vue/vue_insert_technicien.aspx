
<form method="post">
    <div class="container row g-2 w-25">

        <label> Nom</label>
        <input type="text" name="nom" value="<%= (leTechnicien !=null) ? leTechnicien.Nom : "" %>" /><br />
        <label> Prénom</label>
        <input type="text" name="prenom" value="<%= (leTechnicien !=null) ? leTechnicien.Prenom : "" %>" /><br />
        <label> Qualification</label>
        <input type="text" name="qualification" value="<%= (leTechnicien !=null) ? leTechnicien.Qualification : "" %>" /><br />
        <label> Email</label>
        <input type="text" name="email"  value="<%= (leTechnicien !=null) ? leTechnicien.Email : "" %>" /><br />
        <%
 
           if(leTechnicien ==null){
           chainemdp += "<label> Mot de passe</label>";
           chainemdp += "<input type='password' name='mdp'/><br/>";
           }
        %>
        <%= chainemdp %>

    </div> <br />

    <input type="submit" <%= (leTechnicien !=null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />
    <input type="reset" value="Annuler" />

</form>