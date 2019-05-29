import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TiposDocumentoListComponent } from './tipos-documento-list.component';

describe('TiposDocumentoListComponent', () => {
  let component: TiposDocumentoListComponent;
  let fixture: ComponentFixture<TiposDocumentoListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TiposDocumentoListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TiposDocumentoListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
