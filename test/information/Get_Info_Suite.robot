*** Settings ***
Library    ../../library/DateTimeLibrary.py
Library    SeleniumLibrary
Resource   ../../step/Home_Step.resource
Resource   ../../page/Home_Page.resource
Resource   ../../step/Utility_Step.resource
Test Setup    Create driver
Test Teardown    Close Browser

*** Test Cases ***
#Get upcoming birthday
#    [Documentation]    get birthday
#    [Tags]    intranet
#    Login to intranet with uid    uid_1
#    Get birthday
#Get cnn news
#    [Documentation]    get cnn news
#    [Tags]    cnn
#    Go to    ${cnn_url}
#    Get news    ${cnn_selector}    cnn
Get coin desk
    [Documentation]    coin desk
    [Tags]    coin desk
    Go to    ${coin_desk}
    Get news    ${coin_desk_selector}    coin_desk
    Export chart



#Login to intranet 2
#    [Documentation]    login to intranet 2
#    [Tags]    intranet
#    Navigate to page    ${login_page}
#    Login with username and password


    
    



