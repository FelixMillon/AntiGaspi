import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UnavisComponent } from './unavis.component';

describe('UnavisComponent', () => {
  let component: UnavisComponent;
  let fixture: ComponentFixture<UnavisComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [UnavisComponent]
    });
    fixture = TestBed.createComponent(UnavisComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
