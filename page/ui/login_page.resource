*** Settings ***
Resource    ../common.resource
Resource    ../../locator/login_page_locator.resource
Library     Selenium2Library

*** Keywords ***
# This keyword use to login
Login To Application
    Open Web Application
#    Wait Until Page Contains Element    ${btn_signin}
#    Click Element    ${btn_signin}
#    Input Text    ${email_edit_text}   ${email}
#    Click Element    ${btn_continue}
#    Wait Until Page Contains Element    ${password_edit_text}
#    Input Text    ${password_edit_text}     ${password}
#    Click Element    ${btn_login}
#    Sleep    2s


