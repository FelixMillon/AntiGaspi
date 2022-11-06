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
			$_COOKIE['session_email'] = $unUser['email'];
			$_COOKIE['session_nom'] = $unUser['nom'];
			$_COOKIE['session_prenom'] = $unUser['prenom'];
			$_COOKIE['session_id'] = $unUser['id'];
			$unControleur->setTable("employe");
			$unEmploye = $unControleur->selectWhere($where);
			if(isset($unEmploye['email']))
			{
				$_COOKIE['session_droits'] = $unEmploye['droits'];
			}
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