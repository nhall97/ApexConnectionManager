public with sharing class ExampleImplementationForExtObj {

    public static void ExampleImplementationForExtObj(Case caseObj) {
        
        CaseToGoogle__x casex = new CaseToGoogle__x();
        
        Http http = createHttpRequest();

        HttpResponse response = http.send(request);

    }

    private static Http createHttpRequest() {
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        request.setEndpoint(HttpConnectionManager.getMgdEndpoint('google'));
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
    }
}
