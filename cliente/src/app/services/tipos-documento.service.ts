import { Injectable } from '@angular/core';
import {HttpClient}  from '@angular/common/http'

import {TiposDocumento} from '../models/TiposDocumento'
import { Observable } from 'rxjs';

@Injectable({ 
  providedIn: 'root'
})
export class TiposDocumentoService {
  API_URL = 'http://localhost:3000/api';
  constructor(private http: HttpClient) { }

  getTiposDocumento() {
    //return this.http.get('http://localhost:300/api/documentos')
    return this.http.get(`${this.API_URL}/TiposDocumento`);
    //TiposDocumento`);
  }
  
  getTipoDocumento(id: string) {
    return this.http.get(`${this.API_URL}/TiposDocumento/${id}`);
  }

  saveTipoDocumento(TiposDocumento: TiposDocumento) {
    return this.http.post(`${this.API_URL}/TiposDocumento`, TiposDocumento);
  }

  deleteTipoDocumento(id: string) {
    return this.http.delete(`${this.API_URL}/TiposDocumento/${id}`);
  }

  updateTipoDocumento(id: string, updateTipoDocumento: TiposDocumento): Observable<TiposDocumento> {
    return this.http.put('${this.API_URL}/TiposDocumento ${id}', this.updateTipoDocumento);
  }
}
