import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ClientClass } from 'src/app/classes/client-class';
import { Client } from 'src/app/interfaces/Client';
import { AuthService } from 'src/app/service/auth.service';
import { HomeService } from 'src/app/service/home/home.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit{

  public Compte : any = [];
 
  emailconnect: string = "";
  mdpconnect : string = "";
  type_co : string = "client";

constructor(private  HomeService : HomeService, private auth : AuthService, private router : Router){}

  ngOnInit(): void {

    this.emailconnect = "";
    this.mdpconnect = "";
    
  }

  Client(){
    this.type_co = "client"
 }

 Entreprise(){
   this.type_co = "entreprise"
 }


  SeConnecter(){
 
   if(this.emailconnect == "" || this.mdpconnect == ""){
     console.log("Veuillez renseignez votre email et votre mot de passe");
      }else{

      this.HomeService.SeConnecter(this.type_co, this.emailconnect, this.mdpconnect).subscribe(res=>{

     // this.HomeService.SeConnecter("entreprise", "les_restos_du_pancreas@gmail.com", "123").subscribe(res=>{

        this.Compte = res;
        this.auth.setUser(res);

          if(this.Compte.connect != "denied"){
            this.auth.login(this.Compte.token, this.Compte.email);
            this.router.navigateByUrl('/');
          }
        });
        }


      if(this.Compte == undefined){
        console.log("Identifiant incorrect");
      }
          

    
    this.emailconnect = "";
    this.mdpconnect = "";

  }





  hash(string : string) {
    const utf8 = new TextEncoder().encode(string);
    return crypto.subtle.digest('SHA-256', utf8).then((hashBuffer) => {
      const hashArray = Array.from(new Uint8Array(hashBuffer));
      const hashHex = hashArray
        .map((bytes) => bytes.toString(16).padStart(2, '0'))
        .join('');
      return hashHex;
    });
  }

}
