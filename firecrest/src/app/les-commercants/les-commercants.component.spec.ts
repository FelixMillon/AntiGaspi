import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LesCommercantsComponent } from './les-commercants.component';

describe('LesCommercantsComponent', () => {
  let component: LesCommercantsComponent;
  let fixture: ComponentFixture<LesCommercantsComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [LesCommercantsComponent]
    });
    fixture = TestBed.createComponent(LesCommercantsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
