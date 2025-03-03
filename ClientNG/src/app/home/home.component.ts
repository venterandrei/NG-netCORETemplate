import { Component, OnInit } from '@angular/core';
import { CompanyService } from '../_services/companies.service';
import { AbstractControl, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  content?: string;
  message = '';
  form: any = {
    name: null,
    exchange: null,
    stockTicker: null,
    isin: null,
    website: null
  };

  companyForm: FormGroup = new FormGroup({
    name: new FormControl('', Validators.required),
    exchange: new FormControl('', Validators.required),
      stockTicker: new FormControl('', Validators.required),
      isin: new FormControl('', Validators.required),
      website: new FormControl(''),
  });

  submitted = false;
  p: number = 1;
  collection: any[] = []; 
  enableEdit:boolean=false;
  enableEditIndex:number=-1;
  searchIsin:string="";
  constructor(private companyService: CompanyService,private formBuilder: FormBuilder) {

    
   }
   isinChanged():void{
      if(this.searchIsin.length>3){
        console.log(this.searchIsin);
        this.companyService.getByLsin(this.searchIsin).subscribe({
          next: data => {
            this.content = data;
            console.log(data.data);
            this.collection=data.data;
          },
          error: err => {
            if (err.error) {
              try {
                const res = JSON.parse(err.error);
                this.content = res.message;
              } catch {
                this.content = `Error with status: ${err.status} - ${err.statusText}`;
              }
            } else {
              this.content = `Error with status: ${err.status}`;
            }
          }
        });
      }
      else{

        this.loadData();
      }
   }
   get f(): { [key: string]: AbstractControl } {
    return this.companyForm.controls;
  }
  onSubmit(): void {
    const { name, exchange,stockTicker,isin,website } = this.form;
   console.log(this.companyForm.value);
   this.submitted=true;
    this.companyService.addCompany(this.companyForm.value).subscribe(res=>{
      console.log(res);
      this.refreshData();
    })
  }
  saveSegment(post:any){
    if(post.id>0){
        console.log(post)
        this.companyService.updateCompany(post.id, post).subscribe(res=>{
          console.log(res);
          this.enableEditIndex=-1;
          this.enableEdit=false;
         this.loadData();
        })
    }
  }
enableEditMethod(event:Event, i:number){
    event.preventDefault();
    this.enableEditIndex=i;
    this.enableEdit=true;
}
deleteMethod(event:Event, item:any){
  event.preventDefault();
  if(item.id>0){
    console.log(item)
    this.companyService.deleteCompany(item.id).subscribe(res=>{
      alert("Companie stearsa")
     this.loadData();
    })
}
}

  ngOnInit(): void {

    this.companyForm = this.formBuilder.group(
      {
        name: ['', Validators.required],
        exchange:  ['', Validators.required],
        stockTicker:  ['', Validators.required],
        isin:  ['', Validators.required],
        website:  ['']
      }
    );

    this.loadData();
  }

refreshData():void{
  this.loadData();
  this.companyForm = this.formBuilder.group(
    {
      name: ['', Validators.required],
      exchange:  ['', Validators.required],
      stockTicker:  ['', Validators.required],
      isin:  ['', Validators.required],
      website:  ['']
    }
  );
  this.submitted=false;;
}

  loadData():void{
    this.companyService.getAllCompaniesContent().subscribe({
      next: data => {
        this.content = data;
        console.log(data.data);
        this.collection=data.data;
      },
      error: err => {
        if (err.error) {
          try {
            const res = JSON.parse(err.error);
            this.content = res.message;
          } catch {
            this.content = `Error with status: ${err.status} - ${err.statusText}`;
          }
        } else {
          this.content = `Error with status: ${err.status}`;
        }
      }
    });
  }


}
