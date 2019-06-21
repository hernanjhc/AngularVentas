import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {HttpClientModule} from '@angular/common/http'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { TiposDocumentoFormComponent } from './components/tipos-documento/tipos-documento-form/tipos-documento-form.component';
import { TiposDocumentoListComponent } from './components/tipos-documento/tipos-documento-list/tipos-documento-list.component';
import { TiposDocumentoService } from './services/tipos-documento.service';
import { FormsModule } from '@angular/forms';
import { HomeComponent } from './components/home/home.component';
import { TemplateComponent } from './components/template/template.component';

@NgModule({
  declarations: [
    AppComponent,
    TiposDocumentoFormComponent,
    TiposDocumentoListComponent,
    HomeComponent,
    TemplateComponent
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
