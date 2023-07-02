import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ServeurService {

  constructor() { 
    this.server;
  }

  public server: string = `http://192.168.227.139:80`;
  


}
