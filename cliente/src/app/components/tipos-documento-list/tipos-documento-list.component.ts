import { Component, OnInit, HostBinding } from '@angular/core';

import { TiposDocumentoService } from '../../services/tipos-documento.service';
import { TiposDocumento } from 'src/app/models/TiposDocumento';

@Component({
  selector: 'app-tipos-documento-list',
  templateUrl: './tipos-documento-list.component.html',
  styleUrls: ['./tipos-documento-list.component.css']
})
export class TiposDocumentoListComponent implements OnInit {

  @HostBinding('class') classes = 'row';

  tiposDocumento: any = [];
  
  constructor( private tiposDocumentoService: TiposDocumentoService) { }

  ngOnInit() {
    this.getTiposDocumentos();
  }

  getTiposDocumentos() {
    this.tiposDocumentoService.getTiposDocumento().subscribe(
      res => {
        this.tiposDocumento = res
      }, //console.log(res),
      err => console.error(err)
    );
  }
  deleteTipoDocumento(id: string){
    //console.log(id);
    this.tiposDocumentoService.deleteTipoDocumento(id).subscribe(
      res => {
        console.log(res);
        this.getTiposDocumentos();
      },
      err => console.log(err)
    )
  }
  
}
