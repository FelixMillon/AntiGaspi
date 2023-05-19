import { Component, OnInit } from '@angular/core';
import { PanierService } from '../service/panier.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit{

  public totalItem : number = 0;
  public SessionEmail: any;
  public SessionNom: any;
  public SessionPrenom: any;
  public SessionDate_inscription: any;
  public SessionTel: any;
  public SessionAdresse: any;
  public SessionSiren: any;
  public SessionLibelle: any;
  public SessionRole_representant: any;
  public SessionType_cli: any;
  public SessionValide: any;
  public SessionConnect: any;

  


  constructor(private PanierService : PanierService){

  }

  ngOnInit(): void {
    this.PanierService.getProducts().subscribe(res=>{
      this.totalItem = res.length;
    });

    this.SessionEmail = sessionStorage.getItem('Email');
    this.SessionNom = sessionStorage.getItem('Nom');
    this.SessionPrenom = sessionStorage.getItem('Prenom');
    this.SessionDate_inscription = sessionStorage.getItem('Date_inscription');
    this.SessionTel = sessionStorage.getItem('Tel');
    this.SessionAdresse = sessionStorage.getItem('Adresse');
    this.SessionSiren = sessionStorage.getItem('Siren');
    this.SessionLibelle = sessionStorage.getItem('Libelle');
    this.SessionRole_representant = sessionStorage.getItem('Role_representant');
    this.SessionType_cli = sessionStorage.getItem('Type_cli');
    this.SessionValide= sessionStorage.getItem('Valide');
    let Pass = sessionStorage.getItem('Connect');

    if(Pass == "ok" ){
      this.SessionConnect = true;
    }else if(Pass== "non"){
      this.SessionConnect = false;
    }

    console.log(this.SessionConnect);


  }



  

}
