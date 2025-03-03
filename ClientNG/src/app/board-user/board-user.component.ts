import { Component, OnInit } from '@angular/core';
import { CompanyService } from '../_services/companies.service';

@Component({
  selector: 'app-board-user',
  templateUrl: './board-user.component.html',
  styleUrls: ['./board-user.component.css']
})
export class BoardUserComponent implements OnInit {
  content?: string;

  constructor(private companyService: CompanyService) { }

  ngOnInit(): void {
   
  }
}
