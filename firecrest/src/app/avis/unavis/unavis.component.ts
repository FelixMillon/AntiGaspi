import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { HomeService } from 'src/app/service/home/home.service';
import { defineComponents, IgcRatingComponent } from 'igniteui-webcomponents';
defineComponents(IgcRatingComponent);

@Component({
  selector: 'app-unavis',
  templateUrl: './unavis.component.html',
  styleUrls: ['./unavis.component.css']
})
export class UnavisComponent implements OnInit{
  public unAvis : any[] | undefined;
  public numCom : string = "";
  note : any = 0;
  commentaire : string = "";
  id:any;

  constructor(private Home : HomeService, public route : ActivatedRoute ){
     this.id = this.route.snapshot.paramMap.get('id'); 
  }
  ngOnInit(): void {
    this.note = 0;
    this.commentaire = "";    
  }

  Envoyer(){
    console.log(this.note)
    console.log(this.commentaire)
    console.log(this.id)
    this.Home.InsertCommenter(this.id, this.note, this.commentaire).subscribe();
    this.note = 0;
    this.commentaire = ""; 
    
  }

}
