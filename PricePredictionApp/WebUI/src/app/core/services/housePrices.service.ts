import { Constants } from '../../config/constants';
import { House } from '../models/house';
import { Injectable } from '@angular/core';
import { ApiHttpService } from './api-http.service';

@Injectable({
  providedIn: 'root'
})
export class HousePricesService {

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

  async deleteElementFromHistory(index: number): Promise<any> {
    this.apiService.delete(this.constants.API_ENDPOINT + "history", index).subscribe(
      (data: any) => { return data }, // success path
      error => { return error } // error path
    );
  }

  async deleteHistory(): Promise<any> {
    this.apiService.delete(this.constants.API_ENDPOINT + "history").subscribe(
      (data: any) => { return data }, // success path
      error => { return error } // error path
    );
  }
}
