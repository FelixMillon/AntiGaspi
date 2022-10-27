<h3> Liste des clients </h3>

<table border="1"> 
<tr>
<td> id client </td>
<td> prenom et nom</td>
<td> tel </td>
<td> email </td>
<td> date d'inscription </td>
<td> adresse </td>
</tr>

<?php  
foreach ($lesClients as $unCLient){
	echo "<tr>
        <td>".$unCLient['id_client']."</td>
		<td>".$unCLient['prenom']." ".$unCLient['nom']."</td>
		<td>".$unCLient['tel']."</td>
		<td>".$unCLient['email']."</td>
		<td>".$unCLient['date_inscription']."</td>
		<td>".$unCLient['numrue']." ".$unCLient['rue']." , ".$unCLient['cp']." , ".$unCLient['ville']."</td>
        </tr>";
}
?>
</table>