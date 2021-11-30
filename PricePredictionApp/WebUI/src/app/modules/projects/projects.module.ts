import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProjectsRoutingModule } from './projects-routing.module';
import { ProjectsComponent } from './pages/projects/projects.component';
import { ProjectDetailComponent } from './pages/project-detail/project-detail.component';

import { MatCardModule } from '@angular/material/card';

@NgModule({
  declarations: [ProjectsComponent, ProjectDetailComponent],
  imports: [
    CommonModule,
    ProjectsRoutingModule,
    MatCardModule
  ]
})
export class ProjectsModule { }
