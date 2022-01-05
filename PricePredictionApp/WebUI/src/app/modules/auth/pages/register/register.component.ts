
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from 'src/app/modules';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  form: FormGroup;
  public registerInvalid = false;
  private formSubmitAttempt = false;
  private returnUrl: string;
  errorMessage = ""

  user: any;
  error: any;
  promise: Promise<any>;

  constructor(private authService: AuthService, private fb: FormBuilder,
    private route: ActivatedRoute,
    private router: Router) {
    this.form = this.fb.group({
      email: ['', Validators.email],
      username: ['', Validators.required],
      password: ['', Validators.required],
      confirmPassword: ['', Validators.required]
    });
  }


  ngOnInit(): void {
  }


  onSubmit(): void {
    //console.log(this.form.controls.email.value)
    //console.log(this.form.controls.username.value)
    //console.log(this.form.controls.password.value)
    //console.log(this.form.controls.confirmPassword.value)

    // validation password and confirmPassword are the same

    if (this.form.controls.password.value !== this.form.controls.confirmPassword.value) {
      //error message
      this.registerInvalid = true
      this.errorMessage = "The passwords do not match"
      return
    }
    //make a call to api

    this.user = {
      username: this.form.controls.username.value,
      email: this.form.controls.email.value,
      password: this.form.controls.password.value
    }
    this.authService.register({ "registerInfo": { "email": this.user.email, "password": this.user.password, "userName": this.user.username } }).then((data) => {
      console.log(data)
    })

  }

}
