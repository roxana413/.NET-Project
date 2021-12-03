import { HousePricesService } from './../../../../core/services/housePrices.service';
import { House } from './../../../../core/models/house';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-history',
  templateUrl: './history.component.html',
  styleUrls: ['./history.component.scss']
})
export class HistoryComponent implements OnInit {

  houses = []
  constructor(private housePricingService: HousePricesService) { }

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

    house = {
      zipcode: "3214FF",
      grade: 6,
      bedrooms: 3,
      price: 5432543
    }
    this.houses.push(house)

    house = {
      zipcode: "fds332",
      grade: 10,
      bedrooms: 10,
      price: 43254352
    }
    this.houses.push(house)

    //get history
    //this.houses = this.housePricingService.getHistory()
  }

  deleteHouse(i: number): void {
    console.log(i)
    this.houses.splice(i, 1)
    console.log(this.houses)
    this.housePricingService.deleteElementFromHistory(i)
    //make delete request
  }

  deleteAllHouses(): void {
    this.houses = []
    this.housePricingService.deleteHistory()

    //make delete request
  }

}
