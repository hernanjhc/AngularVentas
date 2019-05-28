import { Component, OnInit, HostBinding } from '@angular/core';
//import { TiposDocumento } from 'src/app/models/TiposDocumento';
import { TiposDocumento } from '../../models/TiposDocumento';
import { TiposDocumentoService } from '../../services/tipos-documento.service';

@Component({
  selector: 'app-tipos-documento-form',
  templateUrl: './tipos-documento-form.component.html',
  styleUrls: ['./tipos-documento-form.component.css']
})
export class TiposDocumentoFormComponent implements OnInit {

  @HostBinding('class')   classes = 'row';

  tipoDocumento: TiposDocumento = {
    Id: 0,
    TipoDocumento:''
  };

  constructor(private tiposDocumentoService: TiposDocumentoService) {

   }

  ngOnInit() {
  }
  saveNewTipoDocumento(){
    //console.log(this.tipoDocumento);
    delete this.tipoDocumento.Id; //se genera adentro la BD
    this.tiposDocumentoService.saveTipoDocumento(this.tipoDocumento).subscribe(
      res => {
        console.log(res);
      },
      err => console.error(err)
    )
  }

}
