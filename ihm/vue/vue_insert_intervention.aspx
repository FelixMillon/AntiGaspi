

<form method="post">
    <div class="container row g-2 w-25">

        <label> Matériel</label>
        <input type="text" name="materiel" value="<%= (Linter!= null) ? Linter.Materiel : "" %>" /><br />
        <label> Prix</label>
        <input type="text" name="prix" value="<%= (Linter != null) ? Linter.Prix : "" %>" /><br />
        <label> Date intervention</label>
        <input type="date" name="dateinter" value="<%= (Linter != null) ? Linter.Dateinter : "" %>" /><br />

        <select class="inscricase form-select" name="idclient" style="border-color:#80aaff"> 
            <option value=""> Selectionner un Client</option>
		<%
			string chaineClient = ""; 
            foreach(Client unClient in lesClients2)
			{
				chaineClient += "<option value='" + unClient.IdPers + "'>"; 
				chaineClient += unClient.Nom + " " + unClient.Prenom; 
				chaineClient += "</option>";
			}
			
		%>
            <%= chaineClient %>
	    </select>

        <select class="inscricase form-select" name="idtechnicien" style="border-color:#80aaff"> 
            <option value="">Selectionner un Technicien</option>
		<%
            string chaineTechnicien = ""; 
            foreach(Technicien unTechnicien in lesTechniciens2)
			{
				chaineTechnicien += "<option value='" + unTechnicien.IdPers + "'>"; 
				chaineTechnicien += unTechnicien.Nom + " " + unTechnicien.Prenom; 
				chaineTechnicien += "</option>";
			}
			
		%>
            <%= chaineTechnicien %>
	    </select>

    </div> <br />

    <input type="submit" <%= (Linter != null) ? "name = 'modifier' value='Modifier'" : "name = 'valider' value='Valider'" %> />
    <input type="reset" value="Annuler" />

</form>
