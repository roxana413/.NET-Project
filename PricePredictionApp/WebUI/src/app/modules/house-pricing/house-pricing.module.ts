import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HousePricingComponent } from './pages/house-pricing/house-pricing.component';
import { HistoryComponent } from './pages/history/history.component';
import { HousePricingRoutingModule } from './house-pricing-router.module'
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { MatIconModule } from '@angular/material/icon';


@NgModule({
  declarations: [HousePricingComponent, HistoryComponent],
  imports: [
    HousePricingRoutingModule,
    MatButtonModule,
    MatCardModule,
    MatFormFieldModule,
    FormsModule,
    ReactiveFormsModule,
    MatInputModule,
    MatIconModule,
    CommonModule
  ]
})
export class HousePricingModule { }
