public with sharing class ExampleImplementationForExtObj {

    public static void ExampleImplementationForExtObj(Case caseObj) {
        
        CaseToGoogle__x casex = new CaseToGoogle__x();
        
        Http http = createHttpRequest();

        HttpResponse response = http.send(request);

        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
    }

    private static Http createHttpRequest() {
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        request.setEndpoint(ConnectionManager.manageConnection('google'));
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
    }
}
