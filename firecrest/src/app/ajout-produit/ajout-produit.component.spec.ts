import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AjoutProduitComponent } from './ajout-produit.component';

describe('AjoutProduitComponent', () => {
  let component: AjoutProduitComponent;
  let fixture: ComponentFixture<AjoutProduitComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AjoutProduitComponent]
    });
    fixture = TestBed.createComponent(AjoutProduitComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
