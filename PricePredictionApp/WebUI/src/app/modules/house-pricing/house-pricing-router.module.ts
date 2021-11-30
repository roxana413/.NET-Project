import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HistoryComponent } from './pages/history/history.component';
import { HousePricingComponent } from './pages/house-pricing/house-pricing.component';


const routes: Routes = [
    {
        path: '',
        pathMatch: 'full',
        component: HousePricingComponent
    },
    {
        path: 'history',
        component: HistoryComponent
    }
];


@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class HousePricingRoutingModule { }
