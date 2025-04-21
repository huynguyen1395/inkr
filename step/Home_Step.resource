*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary
Library    OperatingSystem
Library    String
Library    Collections
Library    RequestsLibrary
Library    ../library/DateTimeLibrary.py
Resource   ../page/Home_Page.resource
Library    ../library/CustomExcelLibrary.py

*** Variables ***
${DATA_DIR}    ${CURDIR}/../data
${EXCEL_PATH}    ${DATA_DIR}/news.xlsx
${CHART_PATH}    ${DATA_DIR}/chart.xlsx


*** Keywords ***
Get birthday
    ${birth_name_elements}=    Get WebElements    ${user_birth_name}
    ${list_birth_name}    Create List
        FOR    ${element}    IN    @{birth_name_elements}
            ${name}    Get Text    ${element}
            Append To List    ${list_birth_name}    ${name}
        END
    ${birth_date_elements}=    Get WebElements    ${user_birth_date}
    ${list_birth_date}    Create List
        FOR    ${element}    IN    @{birth_date_elements}
            ${date}    Get Text    ${element}
            Append To List    ${list_birth_date}    ${date}
        END
        
    ${birth_dict}    Create Dictionary
    ${len}    Get Length     ${list_birth_name}
        FOR    ${index}    IN RANGE    0    ${len}
            ${name}    Set Variable    ${list_birth_name}[${index}]
            ${date}    Set Variable    ${list_birth_date}[${index}]
            Set To Dictionary    ${birth_dict}    ${name}=${date}
        END
    Log    ${birth_dict}

Get news
    [Arguments]    ${element_title}    ${sheet_name}
    ${title}    Get WebElements    ${element_title}
    ${list_title}    Create List
    FOR    ${element}    IN    @{title}
        ${name}    Get Text    ${element}
        Append To List    ${list_title}    ${name}
    END
    ${news}    Split list    ${list_title}    10
    Write Data To Excel    ${EXCEL_PATH}    ${sheet_name}    ${news}
    ${test}    Set Variable    ${EXCEL_PATH}
    Log    ${test}

Count keyword
    [Arguments]    ${keyword}
    ${count}    Count Keyword    ${EXCEL_PATH}    ${keyword}

Count common keywords
    ${result}    Find Most Common Keywords       ${EXCEL_PATH}
    Log    ${result}
     
Export chart
    ${result}    Find Most Common Keywords       ${EXCEL_PATH}
    Log    ${result}
    ${sheet_name}    Get Today   
    Save Keywords To Existing Excel    ${CHART_PATH}    ${result}    ${sheet_name}    