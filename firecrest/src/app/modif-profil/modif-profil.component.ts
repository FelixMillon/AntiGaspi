import { Component, OnInit } from '@angular/core';
import { AuthService } from '../service/auth.service';
import { HomeService } from '../service/home/home.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-modif-profil',
  templateUrl: './modif-profil.component.html',
  styleUrls: ['./modif-profil.component.css']
})
export class ModifProfilComponent implements OnInit{

  public User : any;


  public nom : string = "";
  public prenom : string = "";
  public tel : string = "";
  public numrue : string = "";
  public rue : string = "";
  public ville : string = "";
  public cp : string = "";
  public id : string = "";
  public Compte : any;

  constructor(private auth : AuthService, private Home : HomeService, private router : Router){ }

  ngOnInit(): void {
    this.auth.getUser().subscribe(res=>{
      this.User = res;
      console.log(res)

      if(this.User.role =='client'){
        this.id = this.User.id_client;
      }else{
        this.id = this.User.id_entreprise;
      }

    });
  }


  Modifprofil(){

    console.log(this.nom, this.prenom, this.tel, this.numrue, this.rue, this.ville, this.cp, this.id);



    
    this.Home.Update_user(this.nom, this.prenom, this.tel, this.numrue, this.rue, this.ville, this.cp, this.id).subscribe();


    
    this.Home.getUser(this.User.role, this.id).subscribe(res=>{

         this.Compte = res;
         this.auth.setUser(res);
      });



  }

  Clear(){
     this.nom  = "";
     this.prenom = "";
     this.tel  = "";
     this.numrue = "";
     this.rue  = "";
     this.ville = "";
     this.cp = "";
  }

}
