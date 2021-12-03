import { PriceEstimationService } from "../../../index";
import { Component, OnInit } from "@angular/core";

@Component({
  selector: "app-projects",
  templateUrl: "./projects.component.html",
  styleUrls: ["./projects.component.scss"],
})
export class ProjectsComponent implements OnInit {
  projects = [
    { id: 1, name: "Un proiect" },
    { id: 2, name: "alt proiect" },
    { id: 3, name: "inca un proiect" },
  ];

  constructor(private PriceEstimationService: PriceEstimationService) { }

  ngOnInit(): void { }
}
