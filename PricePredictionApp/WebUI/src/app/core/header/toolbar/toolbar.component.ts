import { Router } from '@angular/router';
import { AuthService } from './../../services/auth.service';
import { User } from './../../models/user';
import { Component, OnChanges, OnInit, SimpleChanges } from '@angular/core';

@Component({
  selector: 'app-toolbar',
  templateUrl: './toolbar.component.html',
  styleUrls: ['./toolbar.component.scss']
})
export class ToolbarComponent implements OnInit {

  user: User;
  userLoggedIn = false

  constructor(private authService: AuthService,
    private router: Router) {
    this.authService.userLoggedInStateChange.subscribe((value) => {
      this.userLoggedIn = value
      console.log(value)
    });
  }

  ngOnInit(): void {
  }

  async onLogout(): Promise<void> {
    console.log("okk")
    await this.authService.logout()
    this.router.navigate(['/home'])
  }



}
