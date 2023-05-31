import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModerationAvisComponent } from './moderation-avis.component';

describe('ModerationAvisComponent', () => {
  let component: ModerationAvisComponent;
  let fixture: ComponentFixture<ModerationAvisComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ModerationAvisComponent]
    });
    fixture = TestBed.createComponent(ModerationAvisComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
