<?php
require_once ("singleton.class.php");
class Modele 
{
	private $pdo ; 
	public function __construct ($host, $bdd, $user, $mdp)
	{
		$this->pdo = Singleton :: getConnexion ($host, $bdd, $user, $mdp);//toujours une connexion unique 
	}
	public function verifConnexion ($email, $mdp)
	{
		if ($this->pdo != null)
		{
			$requete = "select * from livreur where email =:email and mdp = :mdp ;";
			$select = $this->pdo->prepare($requete); 
			$donnees = array(":email"=>$email, 
					":mdp"=>$mdp); 
			$select->execute ($donnees);
			return  $select->fetch (); 

		}
	}
	public function get_livreur ($id_livreur)
	{
		if ($this->pdo != null)
		{
			$requete = "select * from livreur where id_livreur =:id_livreur ;";
			$select = $this->pdo->prepare($requete); 
			$donnees = array(":id_livreur"=>$id_livreur); 
			$select->execute ($donnees);
			return  $select->fetch (); 

		}
	}
	public function selectAllVehicules()
	{
		if ($this->pdo != null)
		{
			$requete = "select * from vehicule; ";
			$select = $this->pdo->prepare($requete); 
			$select->execute ();
			return  $select->fetchAll(); 

		}
	}

	public function selectAllCommandes()
	{
		if ($this->pdo != null)
		{
			$requete = "select * from commande_complete where id_livreur is null;"; 
			$select = $this->pdo->prepare($requete); 
			$select->execute ();
			return  $select->fetchAll(); 

		}
	}

	public function selectTypeVehicule()
	{
		if ($this->pdo != null)
		{
			$requete = "select * from type_vehicule;"; 
			$select = $this->pdo->prepare($requete); 
			$select->execute ();
			return  $select->fetchAll(); 

		}
	}

	public function selectAllVehiculesWhere($where)
	{
		$donnees = array();
		$champs=array();
		foreach($where as $cle => $valeur)
		{
			$champs[] = $cle." = :".$cle;
			$donnees[":".$cle] = $valeur;
		}
		$chaineWhere = implode(" and ", $champs);
		$requete="select * from vehicule where ".$chaineWhere;
		$select=$this->pdo->prepare($requete);
		$select->execute($donnees);
		return $select->fetchAll();
	}

	public function selectAllProduitsWhere($where)
	{
		$donnees = array();
		$champs=array();
		foreach($where as $cle => $valeur)
		{
			$champs[] = $cle." = :".$cle;
			$donnees[":".$cle] = $valeur;
		}
		$chaineWhere = implode(" and ", $champs);
		$requete="select * from produit where ".$chaineWhere;
		$select=$this->pdo->prepare($requete);
		$select->execute($donnees);
		return $select->fetchAll();
	}
	

	public function selectHistoCommandes($id_livreur)
	{
		if ($this->pdo != null)
		{
			$requete = "select * from commande_complete where id_livreur = :id_livreur ;"; 
			$select = $this->pdo->prepare($requete);
			$donnees = array(":id_livreur"=>$id_livreur); 
			$select->execute($donnees);
			return  $select->fetchAll(); 

		}
	}

	public function lesAvisLivreur($id_livreur)
	{
		if ($this->pdo != null)
		{
			$requete = "select * from commenter where id_livreur = :id_livreur ;"; 
			$select = $this->pdo->prepare($requete);
			$donnees = array(":id_livreur"=>$id_livreur); 
			$select->execute($donnees);
			return  $select->fetchAll(); 

		}
	}

	public function inscription ($tab)
	{
		if ($this->pdo != null)
		{
			$requete ="insert into livreur values (null, :email, :mdp, :nom, :prenom, :date_inscription, :noteconfemp, :tel, :rue, :numrue, :ville, :cp, :id_vehicule, :notepublic, :valide );";
			$donnees=array(":email"=>$tab["email"], ":mdp"=>$tab["mdp"], ":nom"=>$tab["nom"], ":prenom"=>$tab["prenom"], ":date_inscription"=>$tab["date_inscription"], ":noteconfemp"=>$tab["noteconfemp"], ":tel"=>$tab["tel"], 
			":rue"=>$tab["rue"], ":numrue"=>$tab["numrue"], ":ville"=>$tab["ville"], ":cp"=>$tab["cp"], ":id_vehicule"=>$tab["id_vehicule"], ":notepublic"=>$tab["notepublic"], ":valide"=>$tab["valide"]);
			$insert = $this->pdo->prepare($requete); 
			$insert->execute ($donnees);
			 
		}
	}

	public function insert_vehicule ($tab)
	{
		if ($this->pdo != null)
		{
			$requete ="insert into vehicule values (2, :immatriculation, :poids_max, :annee_fabrication, :volume, :energie, :cons_100_km, :id_type_vehicule);";
			$donnees=array(":immatriculation"=>$tab["immatriculation"], ":poids_max"=>$tab["poids_max"], ":annee_fabrication"=>$tab["annee_fabrication"], ":volume"=>$tab["volume"], ":energie"=>$tab["energie"], 
			":cons_100_km"=>$tab["cons_100_km"], ":id_type_vehicule"=>$tab["id_type_vehicule"]);
			$insert = $this->pdo->prepare($requete); 
			$insert->execute ($donnees);
			 
		}
	}

	

	public function AvisLivreur ($tab)
	{
		if ($this->pdo != null)
		{
			$requete ="insert into commenter values (:id_commande, :id_livreur, :note, :commentaire);";
			$donnees=array(":id_commande"=>$tab["id_commande"], ":id_livreur"=>$tab["id_livreur"], ":note"=>$tab["note"], ":commentaire"=>$tab["commentaire"]);
			$insert = $this->pdo->prepare($requete); 
			$insert->execute ($donnees);
			 
		}
	}


	public function update_livreur($tab,$where)
	{
		if ($this->pdo != null)
		{
			$donnees=array();
			$champs2=array();
			foreach ($tab as $cle => $valeur)
			{
				if($valeur!="null" and $valeur !== null){
					$champs2[] = $cle." = :".$cle;
					$donnees[":".$cle] = $valeur;
				}        
			}
			$chaineChamps = implode(",",$champs2);
			$champs=array();
			foreach($where as $cle => $valeur)
			{
				$champs[] = $cle." = :".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineWhere = implode(" and ", $champs);
			$requete ="update utilisateur set ".$chaineChamps." where ".$chaineWhere;

			$update = $this->pdo->prepare($requete);
			$update->execute($donnees);

		}
	}

	public function update_vehicule($tab,$where)
	{
		if ($this->pdo != null)
		{
			$donnees=array();
			$champs2=array();
			foreach ($tab as $cle => $valeur)
			{
				if($valeur != "" or $valeur=="0000-00-00"){
					$champs2[] = $cle." = :".$cle;
					$donnees[":".$cle] = $valeur;
				}        
			}
			$chaineChamps = implode(",",$champs2);
			$champs=array();
			foreach($where as $cle => $valeur)
			{
				$champs[] = $cle." = :".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineWhere = implode(" and ", $champs);
			$requete ="update vehicule set ".$chaineChamps." where ".$chaineWhere;

			$update = $this->pdo->prepare($requete);
			$update->execute($donnees);

		}
	}

	public function Affectation_livraison($tab, $where)
	{
		if ($this->pdo != null)
		{
			$donnees=array();
			$champs2=array();
			foreach ($tab as $cle => $valeur)
			{
				if($valeur != "" or $valeur=="0000-00-00"){
					$champs2[] = $cle." = :".$cle;
					$donnees[":".$cle] = $valeur;
				}        
			}
			$chaineChamps = implode(",",$champs2);
			$champs=array();
			foreach($where as $cle => $valeur)
			{
				$champs[] = $cle." = :".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineWhere = implode(" and ", $champs);
			$requete ="update commande set ".$chaineChamps." where ".$chaineWhere;

			$update = $this->pdo->prepare($requete);
			$update->execute($donnees);

		}
	}



	public function Abandonner_livraison($where)
	{
		if ($this->pdo != null)
		{
			$donnees=array();
			$champs2=array();

			$chaineChamps = implode(",",$champs2);
			$champs=array();
			foreach($where as $cle => $valeur)
			{
				$champs[] = $cle." = :".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineWhere = implode(" and ", $champs);
			$requete ="update commande set id_livreur = null where ".$chaineWhere;

			$update = $this->pdo->prepare($requete);
			$update->execute($donnees);

		}
	}
	
	public function Terminer_livraison($where)
	{
		if ($this->pdo != null)
		{
			$donnees=array();
			$champs2=array();

			$chaineChamps = implode(",",$champs2);
			$champs=array();
			foreach($where as $cle => $valeur)
			{
				$champs[] = $cle." = :".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineWhere = implode(" and ", $champs);
			$requete ="update commande set  dateheure_fin_reel = sysdate() where ".$chaineWhere;

			$update = $this->pdo->prepare($requete);
			$update->execute($donnees);

		}
	}
	public function delete_livreur($where)
	{
		$donnees=array();
		$champs=array();
		foreach($where as $cle => $valeur)
		{
			$champs[] = $cle." = :".$cle;
			$donnees[":".$cle] = $valeur;
		}
		$chaineWhere = implode(" and ", $champs);
		$requete ="delete from livreur where ".$chaineWhere;
		$delete = $this->pdo->prepare($requete);
		$delete->execute($donnees);
	}


	public function delete_vehicule($where)
	{
		$donnees=array();
		$champs=array();
		foreach($where as $cle => $valeur)
		{
			$champs[] = $cle." = :".$cle;
			$donnees[":".$cle] = $valeur;
		}
		$chaineWhere = implode(" and ", $champs);
		$requete ="delete from vehicule where ".$chaineWhere;
		$delete = $this->pdo->prepare($requete);
		$delete->execute($donnees);
	}

	


}
?>



