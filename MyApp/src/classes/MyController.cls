public with sharing class MyController {
    public List<Account> accounts{get;set;}
    public MyController(){
    	accounts = new List<Account>();
    	accounts = [select Name from Account];
    }
}