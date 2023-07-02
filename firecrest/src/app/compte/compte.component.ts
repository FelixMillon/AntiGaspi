import { Component, OnInit } from '@angular/core';
import { AuthService } from '../service/auth.service';

@Component({
  selector: 'app-compte',
  templateUrl: './compte.component.html',
  styleUrls: ['./compte.component.css']
})
export class CompteComponent implements OnInit{

  public User : any;

  constructor(private auth : AuthService){ }

  ngOnInit(): void {
    this.auth.getUser().subscribe(res=>{
      this.User = res;
      console.log(res)
    });
  }

}
