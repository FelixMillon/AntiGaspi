<?php
	class Singleton 
	{
		private static $instance = null, $unPdo = null ; 

		private function __construct ($host, $bdd, $user, $mdp)
		{
			try{
			Singleton::$unPdo =new PDO ("mysql:host=".$host.";dbname=".$bdd, $user, $mdp); 
			}
			catch (PDOException $exp)
			{
				Singleton::$unPdo = null;
				Singleton :: $instance = null;
				echo "erreur".$exp->getMessage (); 
			}
		}
		public static function getConnexion ($host, $bdd, $user, $mdp)
		{
			if (is_null(Singleton::$instance)) //s'il n'y a pas de connexion. 
			{
				Singleton::$instance = new Singleton($host, $bdd, $user, $mdp); //appel de __construct
			}
			return Singleton::$unPdo; 
		}

	}
?>
