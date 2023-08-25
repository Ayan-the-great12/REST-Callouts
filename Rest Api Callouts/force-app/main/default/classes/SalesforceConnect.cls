public with sharing class SalesforceConnect {
    
    //App Manager---> New Connected App--->Create new Managed Connected App 
    //and then consume its consumer & secret key in playground
    //Auth Provide in Dev
    //Named Crediantial in Dev-----> new legacy as well

        public static void getAccountsFromPlayfround(){
        HttpRequest req = new HttpRequest();
        //PlayGround URL
        //req.setEndpoint('https://empathetic-bear-ceo2au-dev-ed.my.salesforce.com/services/apexrest/RestApi');
        req.setEndpoint('callout:PlayGround_Connect/services/apexrest/RestApi');//once u r done with Salesforce Connect
        req.setMethod('GET');
        //req.setHeader('Authorization','Bearer !ARsAQFn0yog7JHSIq0apg2qarFEeYWNGhLgi086DljGHYB3YjLp0zWv6Qsbs_5Umi5.z3s0ejU3Gzyz3nwzT1csv.OI3i42v');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        //Deserialize the JSON string into collections of primitive data types.
        if(res.getStatusCode() == 200){
           List<Object> results = (List<Object>) JSON.deserializeUntyped(res.getBody());
           for(Object obj : results){
              Map<String, Object> caseProps = (Map<String, Object>)obj;
               System.debug('Account Name: '+caseProps.get('Name')+' - Phone : '+caseProps.get('Phone'));
            }
        }
    }
    public static void insertAccount(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:PlayGround_Connect/services/apexrest/RestApi');
        req.setHeader('Content-Type','application/json;charset=UTF-8');
        req.setMethod('POST');
        req.setBody('{"name":"Creation of Account from Dev with the help of Playground","phone":"10203040"}');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
    }
}
