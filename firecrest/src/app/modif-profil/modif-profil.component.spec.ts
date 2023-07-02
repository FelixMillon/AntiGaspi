import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModifProfilComponent } from './modif-profil.component';

describe('ModifProfilComponent', () => {
  let component: ModifProfilComponent;
  let fixture: ComponentFixture<ModifProfilComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ModifProfilComponent]
    });
    fixture = TestBed.createComponent(ModifProfilComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
