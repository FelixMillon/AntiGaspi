import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PanierService {

  public cartItemList : any = [];
  public productList = new BehaviorSubject<any>([]);
  constructor() { }

  getProducts(){
    return this.productList.asObservable();
  } 

  setProduct(product : any){
    this.cartItemList.push(...product);
    this.productList.next(product);
    
  }

  addtoCart(product : any){
  // console.log(product.id_produit);
    this.cartItemList.push(product);
    this.productList.next(this.cartItemList);
    this.getTotalPrice();
   // console.log(this.cartItemList);
  }

  getTotalPrice() : number{
    let grandTotal = 0;
    this.cartItemList.map((a:any)=>{
      grandTotal += parseFloat(a.reduction);
    })
    return grandTotal;
  }

  getTotalPriceBase() : number{
    let grandTotalBase = 0;
    this.cartItemList.map((a:any)=>{
      grandTotalBase += parseFloat(a.prix_base);
    })
    return grandTotalBase;
  }

  removeCartItem(product : any){
    this.cartItemList.map((a:any, index:any)=>{
      if(product.id_produit=== a.id_produit){
        this.cartItemList.splice(index,1);
      }
    });
    this.productList.next(this.cartItemList);
  }

  removeAllCart(){
    this.cartItemList = [];
    this.productList.next(this.cartItemList);
  }


  

}
