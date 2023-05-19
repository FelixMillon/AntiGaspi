import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ServeurService {

  constructor() { 
    this.server;
  }

  public server: string = `http://localhost:80/Commercial_Api`;
  


}
