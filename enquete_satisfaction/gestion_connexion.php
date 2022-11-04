<?php
	$unControleur->setTable("utilisateur");
	$lesUtilisateurs = $unControleur->selectAll();




	if (isset($_POST['SeConnecter'])) {
		$_SESSION['email'] = $_POST['email'];
		$where = array('email'=>$_POST['email']);
		$unUtilisateurs = $unControleur->selectWhere($where);
		$_SESSION['nom'] = $unUtilisateurs['nom'];
		$_SESSION['prenom'] = $unUtilisateurs['prenom'];
		header("Location: index.php");
	}

?>

<form method="post">
	<input type="text" name="email" placeholder="email">
	<input type="password" name="mdp" placeholder="mdp">
	<input type="submit" name="SeConnecter">
</form>