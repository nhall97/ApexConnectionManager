public class HttpConnectionManager {
    public static String getMgdEndpoint(String rcd)
    {   
        return isProd() ? retrievePrd(rcd) : calcEndpoint(rcd);
    }

    private static Boolean isProd()
    {   //returns false if is prod
        return [SELECT IsSandbox FROM Organization LIMIT 1].isSandbox;
    }

    private static Boolean isScratch()
    {   //returns true if is sratch org, 
        Organization org = [SELECT IsSandbox, TrialExpirationDate FROM Organization];
        return (org.IsSandbox && org.TrialExpirationDate != null) ? true : false;
    }

    private static String calcEndpoint(String rcd)
    {   //if scratch, return dv, if sandbox - calculate level
        return isScratch() ? retrieveEndpoints(rcd).DevEndpoint__c : calcSandboxLevel(rcd);
    }

    private static ConnectionManager__mdt retrieveEndpoints(String rcd) 
    {
        return [SELECT DevEndpoint__c, QaEndpoint__c, SitEndpoint__c, UatEndpoint__c
                FROM ConnectionManager__mdt 
                WHERE label =: rcd LIMIT 1];
    }

    private static String retrievePrd(String rcd)
    {return [SELECT ProdEndpoint__c FROM Connectionmanager__mdt WHERE label =: rcd LIMIT 1].ProdEndpoint__c;}

    
    public Static String calcSandboxLevel(String rcd)
    {   //search string for substrings dv, qa, sit, uat 
        String host = URL.getSalesforceBaseUrl().toExternalForm();
        String server = host.substring(0,host.indexOf('.'));

        if (server.contains('dv')) {return retrieveEndpoints(rcd).DevEndpoint__c; } 
        else if (server.contains('qa')) {return retrieveEndpoints(rcd).QaEndpoint__c; } 
        else if (server.contains('sit')) {return retrieveEndpoints(rcd).SitEndpoint__c; }
        else if (server.contains('uat')) {return retrieveEndpoints(rcd).UatEndpoint__c; }
        else 
        {
            System.debug('Cannot find URL based on naming convention, defaulting to dev');
            return retrieveEndpoints(rcd).DevEndpoint__c; 
        }
    }

}