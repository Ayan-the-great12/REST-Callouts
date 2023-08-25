@RestResource(urlMapping='/RestApi/*')
global with sharing class RestCallout {
    /*Steps to call this method from Postman
    1. Get th URL from Anonymous Window like  
               system.debug('Dev Org URL is>>>' + system.Url.getSalesforceBaseUrl());
    2. Then complete the given link in step 1 like just by append this in its end /services/apexrest/RestApi
    3. Paste this newly created link in Postman. Then we get a Invalid Session Id error
    4. To fix this, we need a session id. So go to anonymous window again and write this 
               system.debug('Session Id is>>>' + System.UserInfo.getSessionId().SubString(15));
    5. Get this weird Session id and replace with the existing Bearer Token in Authorize Heading
    */ 
    @HttpGet
    global static List<Account> getAccount(){
        List<Account> acc;
        try{
            acc = [Select id,name,phone,createddate from Account];
            return acc;
        }catch(Exception e){
            system.debug('Error! is: ' + e.getMessage());
        }
        return acc;      
    }
}