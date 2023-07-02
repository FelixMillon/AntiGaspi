import { Injectable } from '@angular/core';
import {HttpClient, HttpParams} from '@angular/common/http';
import { Observable, catchError } from 'rxjs';
import { ServeurService } from '../serveur.service';

@Injectable({
  providedIn: 'root'
})
export class HomeService extends ServeurService{


  constructor(private http: HttpClient) {
    super();
   }

   public url:string = this.server ;

   public AllEntreprise() : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/AllEntreprise.php`);
   }

   public SelectProduitWhere(id_entreprise: string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/lesProduitsWhereEntreprise.php?id_entreprise=${id_entreprise}`);
   }

   public SelectCatWhere(id_entreprise: string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/lesCats.php?id_entreprise=${id_entreprise}`);
   }

   public InsertCommande(id_client: any, tab_json : any) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/insert_commande.php?id_client=${id_client}&json_produit=${tab_json}`);
   }

   public lesAvis(id_client : string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/lesAvisCommandes.php?id_client=${id_client}`);
   }

   public unAvis(id_commande : string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/commenter.php?id_commande=${id_commande}`);
   }

   public SeConnecter(role: string, email : string, mdp : string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/verifConnexion.php?role=${role}&email=${email}&mdp=${mdp}`);
   }

   public getUser(role: string, id : string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/getuser.php?role=${role}&id=${id}`);
   }

   public InsertCommenter(id_commande: string,  note : string, commentaire : string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/insert_commenter.php?id_commande=${id_commande}&note=${note}&commentaire=${commentaire}`);
   }

   public Inscription(email : string, mdp : string, nom : string, prenom : string , tel : string, rue : string, numrue : string, ville : string, cp : string, siren : string, libelle : string, role_representant: string, type_cli: string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/inscription.php?email=${email}&mdp=${mdp}&nom=${nom}&prenom=${prenom}&tel=${tel}&numrue=${numrue}&rue=${rue}&ville=${ville}&cp=${cp}&siren=${siren}&libelle=${libelle}&role_representant=${role_representant}&type_cli=${type_cli}`);
   }

   public InsertProduit(libelle: string,  description : string, regim_alim : string, numrue_depot : string, rue_depot : string, ville_depot : string, cp_depot : string, prix_base : string, reduction : string, poids_unite : string, note : string, quantite : string, date_peremption : string, id_categorie : string, id_entreprise : string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/insert_produit.php?libelle=${libelle}&description=${description}&regim_alim=${regim_alim}&numrue_depot=${numrue_depot}&rue_depot=${rue_depot}&ville_depot=${ville_depot}&cp_depot=${cp_depot}&prix_base=${prix_base}&reduction=${reduction}&poids_unite=${poids_unite}&note=${note}&quantite=${quantite}&date_peremption=${date_peremption}&id_categorie=${id_categorie}&id_entreprise=${id_entreprise}`);
   }

   public InsertCat(libelle: string,  description : string, id_entreprise : string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/insert_cat.php?libelle=${libelle}&description=${description}&id_entreprise=${id_entreprise}`);
   }


   public ModifProduit(libelle: string,  description : string, regim_alim : string, numrue_depot : string, rue_depot : string, ville_depot : string, cp_depot : string, prix_base : string, reduction : string, poids_unite : string, note : string, quantite : string, date_peremption : string, id_categorie : string, id_entreprise : string, id_produit : string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/update_produit.php?libelle=${libelle}&description=${description}&regim_alim=${regim_alim}&numrue_depot=${numrue_depot}&rue_depot=${rue_depot}&ville_depot=${ville_depot}&cp_depot=${cp_depot}&prix_base=${prix_base}&reduction=${reduction}&poids_unite=${poids_unite}&note=${note}&quantite=${quantite}&date_peremption=${date_peremption}&id_categorie=${id_categorie}&id_entreprise=${id_entreprise}&id_produit=${id_produit}`);
   }

   public ModifCat(libelle: string,  description : string, id_categorie : string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/update_cat.php?libelle=${libelle}&description=${description}&id_categorie=${id_categorie}`);
   }

   public SupCat(id_categorie: string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/sup_cat.php?id_categorie=${id_categorie}`);
   }

   public SupProduit(id_produit: string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/sup_prod.php?id_produit=${id_produit}`);
    
   }





   public Update_user(nom: string,prenom: string,tel: string,numrue: string, rue: string,ville: string,cp: string, id :string) : Observable<any[]>{
    console.log(rue)
    encodeURIComponent(rue);
    console.log(`${this.url}/update_user.php?nom=${nom}&prenom=${prenom}&tel=${tel}&numrue=${numrue}&rue=${rue}&ville=${ville}&cp=${cp}&id=${id}`)
    return this.http.get<any[]>(`${this.url}/update_user.php?nom=${nom}&prenom=${prenom}&tel=${tel}&numrue=${numrue}&rue=${rue}&ville=${ville}&cp=${cp}&id=${id}`);
   }
   
}
