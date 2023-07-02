import { Component, OnInit } from '@angular/core';
import { HomeService } from '../service/home/home.service';
import { AuthService } from '../service/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-inscription',
  templateUrl: './inscription.component.html',
  styleUrls: ['./inscription.component.css']
})
export class InscriptionComponent implements OnInit{


  email : string = "";
  mdp : string = "";
  nom : string = "";
  prenom : string = "";
  tel : string = "";
  rue : string = "";
  numrue : string = "";
  ville : string = "";
  cp : string = "";
  siren : string = "";
  libelle : string = "";
  role_representant : string = "";
  type_cli : string = "";
  public Compte : any = [];


  constructor( private  HomeService : HomeService, private auth : AuthService, private router : Router){ }

  ngOnInit(): void {

  }

  Client(){
     this.type_cli = "particulier"
  }

  Entreprise(){
    this.type_cli = "entreprise"
  }
  Association(){
    this.type_cli = "association"
  }

  Inscription(){  
    if(this.email == "" || this.mdp == "" || this.nom == "" || this.prenom == "" || this.tel == "" || this.rue == "" || this.numrue == "" || this.ville == "" || this.cp == "" || this.type_cli == ""){
      console.log("Veuillez renseigner toutes les informations demander");
    }else{
      this.HomeService.Inscription(this.email, this.mdp, this.nom, this.prenom, this.tel, this.rue, this.numrue, this.ville, this.cp, this.siren, this.libelle, this.role_representant, this.type_cli).subscribe();

      let role = "client";

      this.HomeService.SeConnecter(role, this.email, this.mdp).subscribe(res=>{

        this.Compte = res;
        this.auth.setUser(res);

          if(this.Compte.connect != "denied"){
            this.auth.login(this.Compte.token, this.Compte.email);
            this.router.navigateByUrl('/');
          }
        });


    }
  }
  
}
