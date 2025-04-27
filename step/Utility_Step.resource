*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary
Library    OperatingSystem
Library    String
Library    Collections
Library    RequestsLibrary
Resource    ../page/Login_Page.resource
Resource    ../page/Home_Page.resource
Resource    ../environment/Environment.resource
Library    ../library/CustomExcelLibrary.py

*** Keywords ***
Create driver
    ${options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
        Call Method  ${options}  add_argument  --disable-notifications
        Call Method  ${options}  add_argument  --disable-infobars
        Call Method  ${options}  add_argument  --disable-extensions
        Call Method  ${options}  add_argument  --no-sandbox
        Call Method  ${options}  add_argument  --headless
        Call Method  ${options}  add_argument  --disable-dev-shm-usage
    Create Webdriver    Chrome    options=${options}

Navigate to login page
    [Arguments]    ${url}
    Go To    ${url}
    
Login with username and password 
    [Arguments]    ${username}    ${password}
    Input Text    ${user_name_selector}    ${username}
    Sleep    1
    Input Text    ${password_selector}    ${password}
    Sleep    1
    Click Button    ${submit_button_selector}
          
Login to intranet with uid
    [Arguments]    ${uid}
    Go to    ${BASE_URL} 
    ${data_path}    Join Path    ${CURDIR}    ../data/data.xlsx
    ${account}    Get account    ${data_path}    ${uid}
    ${accounts}    Get All Rows Except First    ${data_path}    hr
    ${username}    Get From List    ${account}    2
    ${password}    Get From List    ${account}    3
    Login with username and password    ${username}    ${password}
    Sleep    2

Navigate to create event page
    Click Element    ${calendar}
    Click Element    ${create_event}
    
    


        

    
         





        



    
