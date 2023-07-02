import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CompteComponent } from './compte.component';

describe('CompteComponent', () => {
  let component: CompteComponent;
  let fixture: ComponentFixture<CompteComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CompteComponent]
    });
    fixture = TestBed.createComponent(CompteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
