import { Component } from '@angular/core';

import { HomeService } from './../service/home/home.service';
import { ProduitWhere } from '../interfaces/ProduitWhere';
import { ActivatedRoute } from '@angular/router';
import { PanierService } from '../service/panier.service';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { enableProdMode } from '@angular/core';

@Component({
  selector: 'app-page-produit',
  templateUrl: './page-produit.component.html',
  styleUrls: ['./page-produit.component.css']
})
export class PageProduitComponent {

  public Produit : ProduitWhere[] = [];
  public CatProd : [string, any][] = [];
  public Produitorg : ProduitWhere[] = [];

  id: any;

  public fields: Object = { groupBy: 'lib', tooltip: 'text' };

  constructor (private HomeService : HomeService, public route : ActivatedRoute, private PanierService : PanierService){
  this.id = this.route.snapshot.paramMap.get('id');
  }

    ngOnInit(){
      this.HomeService.SelectProduitWhere(this.id).subscribe((res) => {
        this.Produit = res;
        this.CatProd = this.groupByType(this.Produit);
        this.Produit.forEach(unProduit => {
          if(unProduit.lib){
            
          }
        });
        console.log(this.CatProd)
        console.log(res)
      });

  

  }



  groupByType(array : any){
    return array.reduce((r : any, a : any) => {
          r[a.lib] = r[a.lib] || [];
          r[a.lib].push(a);
          return r;
      }, Object.create(null));
  }


  addtocart(item : any){
    this.PanierService.addtoCart(item);
  }




}
