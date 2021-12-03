import { House } from './../../../../core/models/house';
import { PriceEstimationService } from './../../../../core/services/price-estimation.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-history',
  templateUrl: './history.component.html',
  styleUrls: ['./history.component.scss']
})
export class HistoryComponent implements OnInit {

  houses = []
  constructor(private housePricingService: PriceEstimationService) { }

  ngOnInit(): void {
    let house: House
    house = {
      zipcode: "4jfhds",
      grade: 8,
      bedrooms: 3,
      price: 100000
    }
    this.houses.push(house)

    house = {
      zipcode: "54kjl",
      grade: 4,
      bedrooms: 5,
      price: 439284
    }
    this.houses.push(house)
    //get history
    //this.houses = this.housePricingService.getHistory()
  }

}
