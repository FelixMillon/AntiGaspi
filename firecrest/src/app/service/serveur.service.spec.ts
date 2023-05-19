import { TestBed } from '@angular/core/testing';

import { ServeurService } from './serveur.service';

describe('ServeurService', () => {
  let service: ServeurService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ServeurService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
