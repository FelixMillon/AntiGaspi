import { Component, OnInit } from '@angular/core';
import { HomeService } from '../service/home/home.service';

@Component({
  selector: 'app-avis',
  templateUrl: './avis.component.html',
  styleUrls: ['./avis.component.css']
})
export class AvisComponent implements OnInit {

  public LesAvis : any = [];




  constructor( private  HomeService : HomeService){ }

  ngOnInit(): void {
    this.HomeService.lesAvis("1").subscribe(res => {
      this.LesAvis = res;
      console.log(this.LesAvis)
    });


    
  }



}
