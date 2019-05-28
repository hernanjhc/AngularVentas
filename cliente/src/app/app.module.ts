import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {HttpClientModule} from '@angular/common/http'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavComponent } from './components/nav/nav.component';
import { TiposDocumentoFormComponent } from './components/tipos-documento-form/tipos-documento-form.component';
import { TiposDocumentoListComponent } from './components/tipos-documento-list/tipos-documento-list.component';
import { TiposDocumentoService } from './services/tipos-documento.service';
import { FormsModule } from '@angular/forms'

@NgModule({
  declarations: [
    AppComponent,
    NavComponent,
    TiposDocumentoFormComponent,
    TiposDocumentoListComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [
    TiposDocumentoService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
