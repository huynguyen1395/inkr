*** Settings ***
Resource    ../common.resource
Resource    ../../locator/coin_market_cap_locator.resource
Library     Selenium2Library
Library     ExcelLibrary

*** Keywords ***
# This keyword use to login
Get list 10 rows
    Open Web Application
#    Wait Until Page Contains Element    ${btn_signin}
#    Click Element    ${btn_signin}
#    Input Text    ${email_edit_text}   ${email}
#    Click Element    ${btn_continue}
#    Wait Until Page Contains Element    ${password_edit_text}
#    Input Text    ${password_edit_text}     ${password}
#    Click Element    ${btn_login}
#    Sleep    2s

    ${path}     Join Path    ${CURDIR}      ../../file/Report.xlsx


    FOR     ${index}    IN RANGE    10
        ${index_str}    Evaluate    ${index} + 1
        ${result_str}    Convert To String    ${index_str}
        ${name_locator}     Replace String    ${name}    {{row}}    ${result_str}
        ${status_1h_locator}     Replace String    ${status_1h}    {{row}}    ${result_str}
        ${number_1h_locator}     Replace String    ${number_1h}    {{row}}    ${result_str}
        ${status_1d_locator}     Replace String    ${status_1d}    {{row}}    ${result_str}
        ${number_1d_locator}     Replace String    ${number_1d}    {{row}}    ${result_str}
        ${status_1w_locator}     Replace String    ${status_1w}    {{row}}    ${result_str}
        ${number_1w_locator}     Replace String    ${number_1w}    {{row}}    ${result_str}
        ${log_name}  Get Text    ${name_locator}
        ${log_status_1h}  Get Element Attribute   ${status_1h_locator}     class
        ${log_number_1h}      Get Text    ${number_1h_locator}
        ${log_status_1d}  Get Element Attribute   ${status_1d_locator}     class
        ${log_number_1d}      Get Text    ${number_1d_locator}
        ${log_status_1w}  Get Element Attribute   ${status_1w_locator}     class
        ${log_number_1w}      Get Text    ${number_1w_locator}
        ${list}     Create List   ${log_name}  ${log_status_1h}     ${log_number_1h}  ${log_status_1d}  ${log_number_1d}    ${log_status_1w}    ${log_number_1w}
        Open Excel Document    ${path}      1
        Get Sheet   Report
        Write Excel Row    ${index_str}    ${list}
        Save Excel Document    ${path}
        Close Current Excel Document
    END









