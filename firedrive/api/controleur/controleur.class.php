<?php
	require_once ("modele/modele.class.php");


	class Controleur 
	{
		private static $unModele = null; 

		public static function connexion ($host, $bdd, $user, $mdp)
		{
			Controleur::$unModele = new Modele ($host, $bdd, $user, $mdp); 
		}

		public static function verifConnexion ($email, $mdp)
		{
			
			$unLivreur = Controleur::$unModele->verifConnexion ($email, $mdp) ;
			//on va le parser JSon
			$tab=array(
				"id_livreur"=>$unLivreur['id_livreur'], 
				"email"=>$unLivreur['email'],
				"mdp"=>$unLivreur['mdp'],
				"nom"=>$unLivreur['nom'],
				"prenom"=>$unLivreur['prenom'],
				"tel"=>$unLivreur['tel'],
				"date_inscription"=>$unLivreur['date_inscription'],
				"noteconfemp"=>$unLivreur['noteconfemp'],
				"rue"=>$unLivreur['rue'],
				"numrue"=>$unLivreur['numrue'],
				"ville"=>$unLivreur['ville'],
				"id_vehicule"=>$unLivreur['id_vehicule'],
				"notepublic"=>$unLivreur['notepublic'],
				"valide"=>$unLivreur['valide']
				);
			return "[".json_encode($tab)."]";
		}

		public static function get_livreur ($id_livreur)
		{
			
			$unLivreur = Controleur::$unModele->get_livreur ($id_livreur) ;
			//on va le parser JSon
			$tab=array(
				"id_livreur"=>$unLivreur['id_livreur'], 
				"email"=>$unLivreur['email'],
				"mdp"=>$unLivreur['mdp'],
				"nom"=>$unLivreur['nom'],
				"prenom"=>$unLivreur['prenom'],
				"tel"=>$unLivreur['tel'],
				"date_inscription"=>$unLivreur['date_inscription'],
				"noteconfemp"=>$unLivreur['noteconfemp'],
				"rue"=>$unLivreur['rue'],
				"numrue"=>$unLivreur['numrue'],
				"ville"=>$unLivreur['ville'],
				"id_vehicule"=>$unLivreur['id_vehicule'],
				"notepublic"=>$unLivreur['notepublic'],
				"valide"=>$unLivreur['valide']
				);
			return "[".json_encode($tab)."]";
		}

		public static function selectAllVehicules()
		{
			$lesVehicules = Controleur::$unModele->selectAllVehicules (); 
			//parser les resultats en Json 
			$tab= array(); 
			foreach ($lesVehicules as $unVehicule) {
				$ligne = array(
					"id_vehicule"=>$unVehicule['id_vehicule'],
					"immatriculation"=>$unVehicule['immatriculation'],
					"poids_max"=>$unVehicule['poids_max'],
					"volume"=>$unVehicule['volume'],
					"energie"=>$unVehicule['energie'],
					"cons_100_km"=>$unVehicule['cons_100_km'],
					"id_type_vehicule"=>$unVehicule['id_type_vehicule']
				);
				$tab[] = $ligne ;
			}
			return json_encode($tab);
		}


		public static function selectTypeVehicule()
		{
			$lesTypeVehicules = Controleur::$unModele->selectTypeVehicule (); 
			//parser les resultats en Json 
			$tab= array(); 
			foreach ($lesTypeVehicules as $unTypeVehicules) {
				$ligne = array(
					"id_type_vehicule"=>$unTypeVehicules['id_type_vehicule'],
					"libelle"=>$unTypeVehicules['libelle']
				);
				$tab[] = $ligne ;
			}
			return json_encode($tab);
		}

		public static function selectAllVehiculesWhere($where)
		{
			$lesVehicules = Controleur::$unModele->selectAllVehiculesWhere ($where); 
			//parser les resultats en Json 
			$tab= array(); 
			foreach ($lesVehicules as $unVehicule) {
				$ligne = array(
					"id_vehicule"=>$unVehicule['id_vehicule'],
					"immatriculation"=>$unVehicule['immatriculation'],
					"poids_max"=>$unVehicule['poids_max'],
					"volume"=>$unVehicule['volume'],
					"energie"=>$unVehicule['energie'],
					"cons_100_km"=>$unVehicule['cons_100_km'],
					"id_type_vehicule"=>$unVehicule['id_type_vehicule']
				);
				$tab[] = $ligne ;
			}
			return json_encode($tab);
		}

		
		public static function selectAllProduitsWhere($where)
		{
			$lesVehicules = Controleur::$unModele->selectAllProduitsWhere ($where); 
			//parser les resultats en Json 
			$tab= array(); 
			foreach ($lesVehicules as $unVehicule) {
				$ligne = array(
					"id_produit"=>$unVehicule['id_produit'],
					"libelle"=>$unVehicule['libelle'],
					"description"=>$unVehicule['description'],
					"regime_alim"=>$unVehicule['regime_alim'],
					"numrue_depot"=>$unVehicule['numrue_depot'],
					"rue_depot"=>$unVehicule['rue_depot'],
					"ville_depot"=>$unVehicule['ville_depot'],
					"cp_depot"=>$unVehicule['cp_depot'],
					"prix_base"=>$unVehicule['prix_base'],
					"reduction"=>$unVehicule['reduction'],
					"poids_unite"=>$unVehicule['poids_unite'],
					"note"=>$unVehicule['note'],
					"id_categorie"=>$unVehicule['id_categorie'],
					"id_entreprise"=>$unVehicule['id_entreprise']
				);
				$tab[] = $ligne ;
			}
			return json_encode($tab);
		}
	

		

		public static function selectAllCommandes()
		{
			$lesVehicules = Controleur::$unModele->selectAllCommandes(); 
			//parser les resultats en Json 
			$tab= array(); 
			foreach ($lesVehicules as $unVehicule) {
					$ligne = array(
						"id_commande"=>$unVehicule['id_commande'],
						"id_livreur"=>$unVehicule['id_livreur'],
						"id_client"=>$unVehicule['id_client'],
						"dateheure_debut"=>$unVehicule['dateheure_debut'],
						"dateheure_fin_reel"=>$unVehicule['dateheure_fin_reel'],
						"dateheure_fin_estimee"=>$unVehicule['dateheure_fin_estimee'],
						"numrue_depot"=>$unVehicule['numrue_depot'],
						"rue_depot"=>$unVehicule['rue_depot'],
						"ville_depot"=>$unVehicule['ville_depot'],
						"cp_depot"=>$unVehicule['cp_depot'],
						"poids_total"=>$unVehicule['total'],
						"numrue_dest"=>$unVehicule['numrue_dest'],
						"rue_dest"=>$unVehicule['rue_dest'],
						"ville_dest"=>$unVehicule['ville_dest'],
						"cp_dest"=>$unVehicule['cp_dest']
					);
				$tab[] = $ligne ;
			}
			return json_encode($tab);
		}

		public static function selectHistoCommandes($id_livreur)
		{
			$lesVehicules = Controleur::$unModele->selectHistoCommandes($id_livreur);
			//parser les resultats en Json 
			$tab= array(); 
			foreach ($lesVehicules as $unVehicule) {
					$ligne = array(
						"id_commande"=>$unVehicule['id_commande'],
						"id_livreur"=>$unVehicule['id_livreur'],
						"id_client"=>$unVehicule['id_client'],
						"dateheure_debut"=>$unVehicule['dateheure_debut'],
						"dateheure_fin_reel"=>$unVehicule['dateheure_fin_reel'],
						"dateheure_fin_estimee"=>$unVehicule['dateheure_fin_estimee'],
						"numrue_depot"=>$unVehicule['numrue_depot'],
						"rue_depot"=>$unVehicule['rue_depot'],
						"ville_depot"=>$unVehicule['ville_depot'],
						"cp_depot"=>$unVehicule['cp_depot'],
						"poids_total"=>$unVehicule['total'],
						"numrue_dest"=>$unVehicule['numrue_dest'],
						"rue_dest"=>$unVehicule['rue_dest'],
						"ville_dest"=>$unVehicule['ville_dest'],
						"cp_dest"=>$unVehicule['cp_dest']
					);
				$tab[] = $ligne ;
			}
			return json_encode($tab);
		}

		public static function lesAvisLivreur($id_livreur)
		{
			$lesAvis = Controleur::$unModele->lesAvisLivreur($id_livreur);
			//parser les resultats en Json 
			$tab= array(); 
			foreach ($lesAvis as $unAvis) {
					$ligne = array(
						"id_commande"=>$unAvis['id_commande'],
						"id_livreur"=>$unAvis['id_livreur'],
						"note"=>$unAvis['note'],
						"commentaire"=>$unAvis['commentaire']
					);
				$tab[] = $ligne ;
			}
			return json_encode($tab);
		}
		

		public static function inscription ($tab)
		{
			Controleur::$unModele->inscription($tab); 
		}

		public static function insert_vehicule ($tab)
		{
			Controleur::$unModele->insert_vehicule($tab); 
			return '["ok":"1"]';
		}

		public static function AvisLivreur ($tab)
		{
			Controleur::$unModele->AvisLivreur($tab); 
			return '["ok":"1"]';
		}

		public static function update_livreur ($tab, $where)
		{
			foreach ($tab as $key => $value) {
				if ($value === 'null') {
					unset($tab[$key]);
				}
			}
			
			Controleur::$unModele->update_livreur($tab, $where); 
		}

		public static function update_vehicule ($tab, $where)
		{
			Controleur::$unModele->update_vehicule($tab, $where); 
			return '["ok":"1"]';
		}
		
		public static function Affectation_livraison ($tab, $where)
		{
			Controleur::$unModele->Affectation_livraison($tab, $where); 
			return '["ok":"1"]';
		}

		public static function Abandonner_livraison ($where)
		{
			Controleur::$unModele->Abandonner_livraison($where); 
			return '["ok":"1"]';
		}

		public static function Terminer_livraison ($where)
		{
			Controleur::$unModele->Terminer_livraison($where); 
			return '["ok":"1"]';
		}

		public static function delete_livreur ( $where)
		{
			Controleur::$unModele->delete_livreur($where); 
			return '["ok":"1"]';
		}

		public static function delete_vehicule ( $where)
		{
			Controleur::$unModele->delete_vehicule($where); 
			return '["ok":"1"]';
		}

	}
?>











