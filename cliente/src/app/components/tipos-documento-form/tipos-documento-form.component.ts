import { Component, OnInit, HostBinding } from '@angular/core';
//import { TiposDocumento } from 'src/app/models/TiposDocumento';
import { TiposDocumento } from '../../models/TiposDocumento';
import { TiposDocumentoService } from '../../services/tipos-documento.service';
import { ActivatedRoute, Router } from '@angular/router';

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

  edit: boolean = false;

  constructor(private tiposDocumentoService: TiposDocumentoService, private router: Router, private activatedroute: ActivatedRoute) {

   }

  ngOnInit() {
    const params = this.activatedroute.snapshot.params;
    console.log(params);
    if(params.id){
      this.tiposDocumentoService.getTipoDocumento(params.id)
      .subscribe(
        res => {
          console.log(res);
          this.tipoDocumento = res;
          this.edit = true;
        },
        err => console.error(err)
      )
    }
  }
  saveNewTipoDocumento(){
    //console.log(this.tipoDocumento);
    delete this.tipoDocumento.Id; //se genera adentro la BD
    this.tiposDocumentoService.saveTipoDocumento(this.tipoDocumento).subscribe(
      res => {
        console.log(res);
        this.router.navigate(['/TiposDocumento']);
      },
      err => console.error(err)
    )
  }

  editTipoDocumento(){
    this.tiposDocumentoService.updateTipoDocumento(this.tipoDocumento.Id, this.tipoDocumento)
      .subscribe(
        res => {
          console.log(res);
          this.router.navigate(['/TiposDocumento']);
        },
        err => console.error(err)
      )
  
  }

}
