import { ProjectDetailComponent } from './pages/project-detail/project-detail.component';
import { ProjectsComponent } from './pages/projects/projects.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


const routes: Routes = [
  {
    path: 'project/:id',
    component: ProjectDetailComponent
  },
  {
    path: '',
    pathMatch: 'full',
    component: ProjectsComponent
  },

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProjectsRoutingModule { }
