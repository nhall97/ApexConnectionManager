# Salesforce App
    This is a set of configurations that allow you to use Custom Metadata records in order to ensure you always connect to the right level integration.
## Dev, Build and Test
    Clone to your PC, connect to an org and push the repo to the Org.
## Resources
    tbc 

## Description of Files and Directories
    #Apex
        - ConnectionManager.cls
    #Objects
        - Connectionmanager__mdt
            Controls the fileds available on the CustomMetadata
    #customMetadata
        - ConnectionManager.Google
            Entry to show mock values for google

## Issues
    #TODO
        - Unit test coverage
        - Currently implementation on naming conventions are hardcoded, could potentially be more flexible
        - Does the current ConnectionManager_mdt configuration allow enough flexibility for future development
        - When running in production, should Salesforce the named credential or external datasource - not connectionManager entry?
        - Consider certificate management ensuring that the endpoint will use the correct certificate
        - Some kind of User Interface to display avialable connections via a easy access UI
        - Log the selection of the endpoint to the EventBus
    #Known Issues
        - No unit test coverage