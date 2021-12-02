import { Constants } from './../../config/constants';
import { House } from './../models/house';
import { Injectable } from '@angular/core';
import { ApiHttpService } from './api-http.service';

@Injectable({
  providedIn: 'root'
})
export class PriceEstimationService {

  constructor(private apiService: ApiHttpService,
    private constants: Constants) { }

  async getPrice(house: House): Promise<any> {

    this.apiService.get(this.constants.API_ENDPOINT + "price", house).subscribe(
      (data: any) => { return data }, // success path
      error => { return error } // error path
    );
  }

  async getHistory(): Promise<any> {

    this.apiService.get(this.constants.API_ENDPOINT + "history").subscribe(
      (data: any) => { return data }, // success path
      error => { return error } // error path
    );
  }
}
