

<form method="post">
    <div class="container row g-2 w-25">

        <label> Nom</label>
        <input type="text" name="nom" value="<%= (leClient !=null) ? leClient.Nom : "" %>" /><br />
        <label> Prénom</label>
        <input type="text" name="prenom" value="<%= (leClient !=null) ? leClient.Prenom : "" %>" /><br />
        <label> Adresse</label>
        <input type="text" name="adresse" value="<%= (leClient !=null) ? leClient.Adresse : "" %>" /><br />
        <label> Email</label>
        <input type="text" name="email"  value="<%= (leClient !=null) ? leClient.Email : "" %>" /><br />
        <%
           if(leClient ==null){
           chainemdp += "<label> Mot de passe</label>";
           chainemdp += "<input type='password' name='mdp'/><br/>";
           }
        %>
        <%= chainemdp %>

    </div> <br />

    <input type="submit" <%= (leClient !=null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />
    <input type="reset" value="Annuler" />

</form>