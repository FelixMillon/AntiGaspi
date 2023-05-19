import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LesCommercantsComponent } from './les-commercants/les-commercants.component';
import { PageProduitComponent } from './page-produit/page-produit.component';
import { AccueilComponent } from './accueil/accueil.component';
import { NosValeursComponent } from './nos-valeurs/nos-valeurs.component';
import { PanierComponent } from './panier/panier.component';
import { InscriptionComponent } from './inscription/inscription.component';
import { AuthGuard } from './guards/auth.guard';
import { AvisComponent } from './avis/avis.component';
import { UnavisComponent } from './avis/unavis/unavis.component';

const routes: Routes = [
  { path : '', redirectTo: 'accueil', pathMatch: 'full'},

  { path: '',
    children: [
      { path : '', component : AccueilComponent},
      { path : 'commercant', component : LesCommercantsComponent},
      { path : 'nos_valeurs', component : NosValeursComponent},
      { path : 'pageproduit/:id', component : PageProduitComponent},
      { path : 'panier', component : PanierComponent, canActivate: [AuthGuard]},
      { path : 'inscription', component : InscriptionComponent},
      { path : 'avis',
      children: [
        { path:'', component: AvisComponent},
        { path:'unAvis/:id', component: UnavisComponent}
      ]},
    ]
  },
  { path : 'pagesproduit/:id', component : PageProduitComponent},

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
