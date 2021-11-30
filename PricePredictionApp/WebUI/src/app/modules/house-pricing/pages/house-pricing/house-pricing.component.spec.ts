import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HousePricingComponent } from './house-pricing.component';

describe('HousePricingComponent', () => {
  let component: HousePricingComponent;
  let fixture: ComponentFixture<HousePricingComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HousePricingComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HousePricingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
