import { House } from './../../../../core/models/house';

import { PriceEstimationService } from './../../../../core/services/price-estimation.service';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../../../core/services/auth.service';

@Component({
  selector: 'app-house-pricing',
  templateUrl: './house-pricing.component.html',
  styleUrls: ['./house-pricing.component.scss']
})
export class HousePricingComponent implements OnInit {
  form: FormGroup
  userLoggedIn = false
  house: House
  constructor(private priceEstimationService: PriceEstimationService,
    private authService: AuthService,
    private router: Router,
    private fb: FormBuilder) {
    /*   this.authService.userLoggedInStateChange.subscribe((value) => {
        this.userLoggedIn = value
      }); */
    this.form = this.fb.group({
      zipcode: ['', Validators.required],
      grade: ['', Validators.required],
      bedrooms: ['', Validators.required],
      constructionYear: ['', Validators.required]
    });
  }

  ngOnInit(): void {
    this.userLoggedIn = this.authService.isUserLoggedIn
  }

  onSubmit(): void {
    this.house.bedrooms = this.form.controls.bedrooms.value
    this.house.zipcode = this.form.controls.zipcode.value
    this.house.grade = this.form.controls.grade.value
    this.house.constructionYear = this.form.controls.constructionYear.value ? this.form.controls.constructionYear.value : null
    this.priceEstimationService.getPrice(this.house).then((data) => {
      console.log(data)
    })


  }

}
