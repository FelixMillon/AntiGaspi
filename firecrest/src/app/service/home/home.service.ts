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

   public InsertCommenter(id_commande: string,  note : string, commentaire : string) : Observable<any[]>{
    return this.http.get<any[]>(`${this.url}/insert_commenter.php?id_commande=${id_commande}&note=${note}&commentaire=${commentaire}`);
   }

}
