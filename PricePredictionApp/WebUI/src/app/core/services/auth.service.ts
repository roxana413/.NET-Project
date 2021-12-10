import { User } from './../models/user';
import { Constants } from './../../config/constants';
import { ApiHttpService } from './api-http.service';
import { Observable } from 'rxjs/internal/Observable';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  clientID = '967057544532-mkqc67asvd1blcpf8s0jjknl7n2558b1.apps.googleusercontent.com';
  user: any;
  authInstance: any;
  gapiSetup: boolean;
  error: any;

  isUserLoggedIn = false
  userLoggedInStateChange: Subject<boolean> = new Subject<boolean>();


  constructor(private http: HttpClient,
    private apiService: ApiHttpService,
    private constants: Constants) {
    this.userLoggedInStateChange.subscribe((value) => {
      this.isUserLoggedIn = value
    });
  }

  async initGoogleAuth(): Promise<void> {
    const pload = new Promise((resolve) => {
      gapi.load('auth2', resolve);
    });

    return pload.then(async () => {
      await gapi.auth2
        .init({ client_id: this.clientID })
        .then(auth => {
          this.gapiSetup = true;
          this.authInstance = auth;
        });
    });
  }

  async authenticate(): Promise<gapi.auth2.GoogleUser> {
    if (!this.gapiSetup) {
      await this.initGoogleAuth();
    }

    return this.authInstance.signIn();
  }




  async checkIfUserAuthenticated(): Promise<boolean> {
    if (!this.gapiSetup) {
      await this.initGoogleAuth();
    }

    return this.authInstance.isSignedIn.get();
  }

  getCurrentUser(): any {
    if (this.checkIfUserAuthenticated()) {
      return this.authInstance.currentUser.get();
    }
  }

  async login(user: any): Promise<any> {
    console.log(user)
    this.apiService.post(this.constants.API_ENDPOINT + "Authentication/Login", user).subscribe(
      (data: any) => { return data }, // success path
      error => { return error } // error path
    );
  }

  async register(user: User): Promise<any> {
    this.apiService.post(this.constants.API_ENDPOINT + "Authentication/Register", user).subscribe(
      (data: any) => { return data }, // success path
      error => { return error } // error path
    );
  }



  async logout(): Promise<any> {
    var auth2 = gapi.auth2.getAuthInstance();
    await auth2.signOut()
    console.log('User signed out.');
    this.userLoggedInStateChange.next(false)
  }
}
