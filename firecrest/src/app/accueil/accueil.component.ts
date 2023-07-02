import { Component, OnInit } from '@angular/core';
import { AllEntreprise } from '../interfaces/AllEntreprise';
import { HomeService } from './../service/home/home.service';

@Component({
  selector: 'app-accueil',
  templateUrl: './accueil.component.html',
  styleUrls: ['./accueil.component.css']
})
export class AccueilComponent {

  public AllEntreprise : AllEntreprise[] | undefined;

  constructor(private Home : HomeService){}

  ngOnInit(){
    this.Home.AllEntreprise().subscribe((res) => {
      this.AllEntreprise = res;
    });
    
  }
}


