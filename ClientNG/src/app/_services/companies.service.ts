import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

const API_URL = 'http://localhost:1100/api/v1/';
const USER_KEY = 'auth-user';
@Injectable({
  providedIn: 'root',
})
export class CompanyService {
  constructor(private http: HttpClient) {}

  getAllCompaniesContent(): Observable<any> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + JSON.parse(String(window.sessionStorage.getItem(USER_KEY)))
    })
    return this.http.get(API_URL + 'Company', { headers: headers  });
  }
  getByLsin(lsin:string): Observable<any> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + JSON.parse(String(window.sessionStorage.getItem(USER_KEY)))
    })
    return this.http.get(API_URL + 'Company/lsin/'+ lsin, { headers: headers  });
  }

  addCompany(data: any): Observable<any> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + JSON.parse(String(window.sessionStorage.getItem(USER_KEY)))
    })
    return this.http.post(API_URL + 'Company', data, { headers: headers  });
  }
  updateCompany(id:number,data:any): Observable<any> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + JSON.parse(String(window.sessionStorage.getItem(USER_KEY)))
    })
    return this.http.put(API_URL + 'Company',data, { headers: headers  });
  }
  deleteCompany(id:number): Observable<any> {
    const headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + JSON.parse(String(window.sessionStorage.getItem(USER_KEY)))
    })
    return this.http.delete(API_URL + 'Company/'+ id, { headers: headers  });
  }

}
export interface AUTH {
    accessToken:string;
    success:boolean;
}