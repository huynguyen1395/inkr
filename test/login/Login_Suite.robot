*** Settings ***
Library    SeleniumLibrary
Resource   ../../step/Utility_Step.resource
Resource   ../../environment/Environment.resource
Test Setup    Create driver
Test Teardown    Close Browser

*** Test Cases ***
Test login to intranet
    [Documentation]    login to intranet
    [Tags]    intranet
    Navigate to login page    ${BASE_URL}
    Login with username and password    ${user_name}    ${password}


    
    



