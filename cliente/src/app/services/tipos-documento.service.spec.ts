import { TestBed } from '@angular/core/testing';

import { TiposDocumentoService } from './tipos-documento.service';

describe('TiposDocumentoService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: TiposDocumentoService = TestBed.get(TiposDocumentoService);
    expect(service).toBeTruthy();
  });
});
