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

constructor(private  HomeService : HomeService, private auth : AuthService, private router : Router){}

  ngOnInit(): void {

    this.emailconnect = "";
    this.mdpconnect = "";
    
  }

  SeConnecter(){
 
    let role = "client";

    if(this.emailconnect == "" || this.mdpconnect == ""){

      console.log("Veuillez renseignez votre email et votre mot de passe");

      }else{
        

      this.HomeService.SeConnecter(role, this.emailconnect, this.mdpconnect).subscribe(res=>{
        this.Compte = res;

        
        console.log(this.Compte[0].email);
        console.log(this.Compte[0].connect);
           sessionStorage.setItem('id', this.Compte[0].id_client);
          sessionStorage.setItem('Email', this.Compte[0].email);
          sessionStorage.setItem('Nom', this.Compte[0].nom);
          sessionStorage.setItem('Prenom', this.Compte[0].prenom);
          sessionStorage.setItem('Date_inscription', this.Compte[0].date_inscription);
          sessionStorage.setItem('Tel', this.Compte[0].tel);
          let Adresse = this.Compte[0].numrue +" "+ this.Compte[0].rue+", "+this.Compte[0].ville + " "+this.Compte[0].cp;
          sessionStorage.setItem('Adresse', Adresse);
          sessionStorage.setItem('Siren', this.Compte[0].siren);
          sessionStorage.setItem('Libelle', this.Compte[0].libelle);
          sessionStorage.setItem('Role_representant', this.Compte[0].role_representant);
          sessionStorage.setItem('Type_cli', this.Compte[0].type_cli);
          sessionStorage.setItem('Valide', this.Compte[0].valide);
          sessionStorage.setItem('Role', this.Compte[0].role);

          if(this.Compte[0].connect != "denied"){
            this.auth.login();
            this.router.navigateByUrl('/panier');
          }
        });



   


      }


      if(this.Compte == undefined){
        console.log("Identifiant incorrect");
      }
          

    
    let SessionEmail = sessionStorage.getItem('Email');
    let SessionNom = sessionStorage.getItem('Nom');
    let SessionPrenom = sessionStorage.getItem('Prenom');
    let SessionDate_inscription = sessionStorage.getItem('Date_inscription');
    let SessionTel = sessionStorage.getItem('Tel');
    let SessionAdresse = sessionStorage.getItem('Adresse');
    let SessionSiren = sessionStorage.getItem('Siren');
    let SessionLibelle = sessionStorage.getItem('Libelle');
    let SessionRole_representant = sessionStorage.getItem('Role_representant');
    let SessionType_cli = sessionStorage.getItem('Type_cli');
    let SessionValide= sessionStorage.getItem('Valide');

  }

  login(){
    this.auth.login();
    this.router.navigateByUrl('/panier');
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
