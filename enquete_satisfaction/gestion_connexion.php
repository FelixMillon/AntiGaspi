<?php
	$unControleur->setTable("utilisateur");
	$lesUtilisateurs = $unControleur->selectAll();

	if(isset($_POST['SeConnecter']))
	{
		$mdp= hash('sha256',$_POST['mdp']);
		$where = array('email'=>$_POST['email'] ,'mdp'=>$mdp);
		$unControleur->setTable("utilisateur");
		$unUser = $unControleur->selectWhere($where);
		if(isset($unUser['email']))
		{
			$_SESSION['email'] = $unUser['email'];
			$_SESSION['nom'] = $unUser['nom'];
			$_SESSION['prenom'] = $unUser['prenom'];
			$_SESSION['id'] = $unUser['id'];
			header("Location: index.php");
		}else{
			echo "<br/> Vérifiez vos identifiants";
		}
	}

?>

<form method="post">
	<input type="text" name="email" placeholder="email">
	<input type="password" name="mdp" placeholder="mdp">
	<input type="submit" name="SeConnecter">
</form>