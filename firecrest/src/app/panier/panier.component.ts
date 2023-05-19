import { Component, OnInit } from '@angular/core';
import { PanierService } from '../service/panier.service';
import { HomeService } from '../service/home/home.service';

@Component({
  selector: 'app-panier',
  templateUrl: './panier.component.html',
  styleUrls: ['./panier.component.css']
})
export class PanierComponent implements OnInit {

  public produit : any = [];
  public grandTotal : number = 0;
  public grandTotalBase : number = 0;

  constructor(private PanierService : PanierService, private  HomeService : HomeService){ }

  ngOnInit(): void {
    this.PanierService.getProducts().subscribe(res=>{
      this.produit = res;

      this.produit.forEach((a:any) => {
        Object.assign(a,{quantite_uni:1})
      });

      this.grandTotal = this.PanierService.getTotalPrice();
      this.grandTotalBase = this.PanierService.getTotalPriceBase();
    });
  //  console.log(this.produit);

  }

  
  CommandeEnvoyer(){

    let tab_json : string = `[`;
    let List: string[] = [];
    let tabtest : string = "";

    this.produit.forEach((leProduit : any) => {

      List.push(`{"id_produit": ${leProduit.id_produit},"quantite": ${leProduit.quantite_uni}}`);
    });

    tab_json += List.join(',');
    tab_json += `]`;
    console.log(this.produit)
    console.log(tab_json)

    this.HomeService.InsertCommande('1',tab_json).subscribe();
    this.produit = [];
    tab_json = ``;
    this.emptycart();

  }

  removeItem(item : any){
    this.PanierService.removeCartItem(item);
  }

  emptycart(){
    this.PanierService.removeAllCart();
  }


  
}
