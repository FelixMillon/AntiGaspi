import { Component, OnInit } from '@angular/core';
import { PanierService } from '../service/panier.service';
import { AuthService } from '../service/auth.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit{

  public totalItem : number = 0;


  public User : any;
  public Co : any = false;
  public text : string = "";

  


  constructor(private PanierService : PanierService, private auth : AuthService){

  }

  ngOnInit(): void {

    this.PanierService.getProducts().subscribe(res=>{
      this.totalItem = res.length;
    });

    this.auth.getUser().subscribe(res=>{
      this.User = res;
    });

  }

 
  SeDeconnecter(): void {
    this.auth.SeDeconnecter();
  }
  

}
