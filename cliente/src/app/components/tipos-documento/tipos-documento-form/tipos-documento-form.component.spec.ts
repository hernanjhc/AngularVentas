import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TiposDocumentoFormComponent } from './tipos-documento-form.component';

describe('TiposDocumentoFormComponent', () => {
  let component: TiposDocumentoFormComponent;
  let fixture: ComponentFixture<TiposDocumentoFormComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TiposDocumentoFormComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TiposDocumentoFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
