import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LesCommercantsComponent } from './les-commercants/les-commercants.component';
import { NosValeursComponent } from './nos-valeurs/nos-valeurs.component';
import { PageProduitComponent } from './page-produit/page-produit.component';
import { AccueilComponent } from './accueil/accueil.component';
import { PanierComponent } from './panier/panier.component';
import { HeaderComponent } from './header/header.component';
import { InscriptionComponent } from './inscription/inscription.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AuthModule } from './auth/auth.module';
import { AvisComponent } from './avis/avis.component';
import { UnavisComponent } from './avis/unavis/unavis.component';
import { ListViewModule } from '@syncfusion/ej2-angular-lists';
import { CommonModule } from '@angular/common';
import { AjoutProduitComponent } from './ajout-produit/ajout-produit.component';
import { ModifProfilComponent } from './modif-profil/modif-profil.component';
import { ModerationAvisComponent } from './moderation-avis/moderation-avis.component';
import { CompteComponent } from './compte/compte.component';


@NgModule({
  declarations: [
    AppComponent,
    LesCommercantsComponent,
    NosValeursComponent,
    PageProduitComponent,
    AccueilComponent,
    PanierComponent,
    HeaderComponent,
    InscriptionComponent,
    AvisComponent,
    UnavisComponent,
    AjoutProduitComponent,
    ModifProfilComponent,
    ModerationAvisComponent,
    CompteComponent

  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    BrowserAnimationsModule,
    AuthModule,
    ListViewModule,
    CommonModule
  ],
  providers: [],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
