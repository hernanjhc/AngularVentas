import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { TiposDocumentoListComponent } from './components/tipos-documento/tipos-documento-list/tipos-documento-list.component';
import { TiposDocumentoFormComponent } from './components/tipos-documento/tipos-documento-form/tipos-documento-form.component';
import { HomeComponent } from './components/home/home.component';

const routes: Routes = [
 
  {
    path: 'TiposDocumento',
    component: TiposDocumentoListComponent
  },
  {
    path: 'TiposDocumento/add',
    component: TiposDocumentoFormComponent
  },
  {
    path: 'TiposDocumento/edit/:id',
    component: TiposDocumentoFormComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
