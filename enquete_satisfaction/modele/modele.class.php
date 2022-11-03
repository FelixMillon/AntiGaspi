<?php
	class Modele
	{
		private $unPdo, $uneTable ;

		public function __construct ($serveur, $bdd, $user,$mdp)
		{
			$this->unPdo = null;
			try{
				$this->unPdo = new PDO("mysql:host=".$serveur.";dbname=".$bdd,$user,$mdp);
			}
			catch(PDOException $exp)
			{
				echo "Erreur de connexion : ".$exp->getMessage();
			}
		}

		public function setTable($uneTable)
		{
			$this->uneTable = $uneTable;
		}

		public function selectAll()
		{
			$requete="select * from ".$this->uneTable." ; ";
			$select= $this->unPdo->prepare($requete);
			$select->execute();
			return $select->fetchAll();
		}
		public function insert ($tab)
		{
			$champs =array();
			$donnees=array();
			foreach ($tab as $cle => $valeur)
			{
				$champs[] = ":".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineChamps = implode(",",$champs);
			$requete ="insert into ".$this->uneTable." values (null,".$chaineChamps.");";
			$insert = $this->unPdo->prepare($requete);
			$insert->execute($donnees);
		}
		public function insertnonull ($tab)
		{
			$champs =array();
			$donnees=array();
			foreach ($tab as $cle => $valeur)
			{
				$champs[] = ":".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineChamps = implode(",",$champs);
			$requete ="insert into ".$this->uneTable." values (".$chaineChamps.");";
			$insert = $this->unPdo->prepare($requete);
			$insert->execute($donnees);
		}
		public function selectSearch($tab,$mot)
		{
			$donnees = array(":mot"=>"%".$mot."%");
			$champs=array();
			foreach($tab as $cle)
			{
				$champs[] = $cle." like :mot";
			}
			$chaineWhere = implode(" or ", $champs);
			$requete="select * from ".$this->uneTable." where ".$chaineWhere.";";
			$select= $this->unPdo->prepare($requete);
			$select->execute($donnees);
			return $select->fetchAll();
		}
		public function delete($where)
		{
			$donnees=array();
			$champs=array();
			foreach($where as $cle => $valeur)
			{
				$champs[] = $cle." = :".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineWhere = implode(" and ", $champs);
			$requete ="delete from ".$this->uneTable." where ".$chaineWhere;
			$delete = $this->unPdo->prepare($requete);
			$delete->execute($donnees);
		}
		public function count()
		{
			$requete = "select count(*) as nb from ".$this->uneTable;
			$select = $this->unPdo->prepare($requete);
			$select->execute();
			return $select->fetch();
		}

		public function countWhere($where)
		{
			$donnees = array();
			$champs=array();
			foreach($where as $cle => $valeur)
			{
				$champs[] = $cle." = :".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineWhere = implode(" and ", $champs);
			$requete="select count(*) as nb from ".$this->uneTable." where ".$chaineWhere;
			$select=$this->unPdo->prepare($requete);
			$select->execute($donnees);
			return $select->fetch();
		}

		public function selectWhere($where)
		{
			$donnees = array();
			$champs=array();
			foreach($where as $cle => $valeur)
			{
				$champs[] = $cle." = :".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineWhere = implode(" and ", $champs);
			$requete="select * from ".$this->uneTable." where ".$chaineWhere;
			$select=$this->unPdo->prepare($requete);
			$select->execute($donnees);
			return $select->fetch();
		}
		public function update($tab,$where)
		{
			$donnees=array();
			$champs2=array();
			foreach ($tab as $cle => $valeur)
			{
				$champs2[] = $cle." = :".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineChamps = implode(",",$champs2);
			$champs=array();
			foreach($where as $cle => $valeur)
			{
				$champs[] = $cle." = :".$cle;
				$donnees[":".$cle] = $valeur;
			}
			$chaineWhere = implode(" and ", $champs);
			$requete ="update ".$this->uneTable." set ".$chaineChamps." where ".$chaineWhere;
			$update = $this->unPdo->prepare($requete);
			$update->execute($donnees);
		}
		public function callproc($nom,$tab)
		{
			if($tab!=null)
			{
				$chaine="'".implode("','", $tab)."'";
				$requete ='call '.$nom.'('.$chaine.');';
			}else
			{
				$requete ='call '.$nom.'();';
			}
			$proc = $this->unPdo->prepare($requete);
			$proc->execute();
		}
	}
?>