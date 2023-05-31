import { Injectable, OnDestroy } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { ServeurService } from './serveur.service';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AuthService extends ServeurService {


  constructor(private http: HttpClient) {
    super();
   }


   public url:string = this.server ;
   
  private token!: string;
  email : string = "";
  verif : string = "";
  public User = new BehaviorSubject<any>([]);


  setUser(utilisateur : any){
    this.User.next(utilisateur);
  }

  getUser(){
    return this.User.asObservable();
  }


  login(token : string, email : string){
    this.token = token;
    this.email = email;
    this.getToken();
  }




  SeDeconnecter() {
    let tab : any = undefined;
    this.User.next(tab);
  }

  getToken(): any {

    this.http.get<any[]>(`${this.url}/VerifConnect.php?email=${this.email}&token=${this.token}`).subscribe((response : any) => {
      this.verif = response.connect;
    });

    return this.verif;
  }



}