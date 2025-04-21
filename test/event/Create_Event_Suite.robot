*** Settings ***
Library    ../../library/DateTimeLibrary.py
Library    SeleniumLibrary
Resource   ../../step/Event_Step.resource
Resource   ../../step/Utility_Step.resource
Test Setup    Create driver
Test Teardown    Close Browser

*** Test Cases ***
Create New Event
    [Documentation]    create new event
    [Tags]    intranet
    Login to intranet with uid    uid_1
    Navigate to create event page
    Create Event

#Login to intranet 2
#    [Documentation]    login to intranet 2
#    [Tags]    intranet
#    Navigate to page    ${login_page}
#    Login with username and password


    
    



