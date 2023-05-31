import { Component, OnInit } from '@angular/core';
import { AuthService } from '../service/auth.service';
import { HomeService } from '../service/home/home.service';

@Component({
  selector: 'app-ajout-produit',
  templateUrl: './ajout-produit.component.html',
  styleUrls: ['./ajout-produit.component.css']
})
export class AjoutProduitComponent implements OnInit{

  regime_alim : string = "";
  OnOff : string = "cat";
  public User : any;
  public Produit : any;
  public Cat : any;

  public ModifProduit : any = null;
  public ModifCat : any = null;


  public libelle_cat : string = "";
  public description_cat : string = "";

  public libelle_prod : string = "";
  public description_prod : string = "";
  public numrue_depot : string = "";
  public rue_depot : string = "";
  public ville_depot : string = "";
  public cp_depot : string = "";
  public prix_base : string = "";
  public reduction : string = "";
  public poids_unite : string = "";
  public note : string = "2.5";
  public quantite : string = "";
  public date_peremption : string = "";
  public id_categorie : string = "";





  constructor(private HomeService : HomeService, private auth : AuthService){

  }

  ngOnInit(): void {


    this.auth.getUser().subscribe(res=>{
      this.User = res;
    });

    this.Vue();
  }

  Vue(){
    this.HomeService.SelectProduitWhere(this.User.id_entreprise).subscribe((res) => {
      this.Produit = res;
      console.log(this.Produit)
    });

    this.HomeService.SelectCatWhere(this.User.id_entreprise).subscribe((res) => {
      this.Cat = res;
      console.log(this.Cat)
    });
  }

  OnCat(){
    this.OnOff = "cat";
  }

  OnProd(){
    this.OnOff = "prod";
  }

  AjoutCat(){
    this.HomeService.InsertCat(this.libelle_cat, this.description_cat, this.User.id_entreprise).subscribe();
    this.Vue();
    this.Clear();
  }

  modifCat(tabmodif : any){
    this.ModifCat= tabmodif;
    console.log(this.ModifCat)
  }

  modifProduit(tabmodif : any){
    this.ModifProduit = tabmodif;
    console.log(this.ModifProduit)
  }



  Clear(){

    this.libelle_cat  = "";
    this.description_cat = "";
    this.libelle_prod = "";
    this.description_prod = "";
    this.numrue_depot = "";
    this.rue_depot = "";
    this.ville_depot = "";
    this.cp_depot = "";
    this.prix_base = "";
    this.reduction = "";
    this.poids_unite = "";
    this.note = "";
    this.quantite = "";
    this.date_peremption = "";
    this.id_categorie = "";
    this.ModifCat= null;
    this.ModifProduit= null;
  }

  finmodifCat(){
      this.HomeService.ModifCat(this.libelle_cat, this.description_cat, this.ModifCat.id_categorie).subscribe();
    this.ModifCat= null;
    this.Clear();
    this.Vue();
  }

  finmodifProduit(){
    this.HomeService.ModifProduit(this.libelle_prod, this.description_prod , this.regime_alim, this.numrue_depot, this.rue_depot, this.ville_depot, this.cp_depot, this.prix_base, this.reduction, this.poids_unite, this.note, this.quantite, this.date_peremption, this.id_categorie, this.User.id_entreprise, this.ModifProduit.id_produit).subscribe();

    this.ModifProduit = null;
    this.Clear();
    this.Vue();
  }

  AjoutProduit(){
    this.HomeService.InsertProduit(this.libelle_prod, this.description_prod , this.regime_alim, this.numrue_depot, this.rue_depot, this.ville_depot, this.cp_depot, this.prix_base, this.reduction, this.poids_unite, this.note, this.quantite, this.date_peremption, this.id_categorie, this.User.id_entreprise).subscribe();
    this.Vue();
    this.Clear();
  }

  SupCat(id : string){
    this.HomeService.SupCat(id).subscribe();
    this.Vue();
  }

  SupProduit(id : string){
    this.HomeService.SupProduit(id).subscribe();
    this.Vue();
  }



Crudivore(){
  this.regime_alim = "crudivore"
}


Vegan(){
  this.regime_alim = "vegan"
}


Vegetalien(){
  this.regime_alim = "vegetalien"
}

Glutenfree(){
  this.regime_alim = "glutenfree"
}

}
