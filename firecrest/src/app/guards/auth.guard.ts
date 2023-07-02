import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from "@angular/router";
import { AuthService } from "../service/auth.service";

@Injectable({
    providedIn : 'root'
})

export class AuthGuard implements CanActivate {
    public autorisation : string  ="";

    constructor(private auth: AuthService, private router : Router){

    }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean  {

        console.log(this.auth.getToken());

        if(this.auth.getToken() == "ok"){
            return true;
        }else{
            this.router.navigateByUrl('/auth/login');
            return false;
        }
    }

}