public with sharing class ExampleHttpImpl {

    public static void ExampleImplementationForExtObj(Case caseObj) {
        
        CaseToGoogle__x casex = new CaseToGoogle__x();
        
        Http httpRequest = createHttpRequest();
    }

    private static Http createHttpRequest() {
        Http http = new Http();
 
        HttpRequest request = new HttpRequest();
        request.setEndpoint(HttpConnectionManager.getMgdEndpoint('google'));
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');

        return http;
    }
}
