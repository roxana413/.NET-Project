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
  constructor(private authService: AuthService,
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
  }

}
