import { User } from './../../../../core/models/user';
import { Constants } from './../../../../config/constants';
import { ApiHttpService } from './../../../../core/services/api-http.service';

import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from 'src/app/core/services/auth.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  form: FormGroup;
  public loginInvalid = false;
  private formSubmitAttempt = false;
  private returnUrl: string;
  private user: User
  errorMessage = ""
  error: any;
  promise: Promise<any>;

  constructor(private authService: AuthService,
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private constants: Constants) {
    this.form = this.fb.group({
      username: ['', Validators.email],
      password: ['', Validators.required]
    });
  }

  ngOnInit(): void {
  }

  googleLogin(): void {
    this.promise = this.authService.authenticate();
    this.promise.then(
      user => this.user = user,
      error => this.error = error
    ).finally(
      () => {
        if (this.error === undefined) {
          this.authService.userLoggedInStateChange.next(true)
          this.router.navigate(['/home'])
        } else {
          this.loginInvalid = true
          this.errorMessage = "Google sign-in failed!"
        }
      }
    );
  }

  onSubmit(): void {
    console.log(this.form.controls.username.value)
    console.log(this.form.controls.password.value)
    this.user.name = this.form.controls.username.value
    this.user.password = this.form.controls.password.value
    this.authService.login(this.user).then((data) => {
      console.log(data)
    })

  }

}
