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
${COIN_DESK_PATH}    ${DATA_DIR}/coin_desk_data.xlsx
${COIN_DESK_CHART_PATH}    ${DATA_DIR}/coin_desk_chart.xlsx
${COIN_MARKET}       ${DATA_DIR}/coin_market_data.xlsx
${COIN_MARKET_CHART}       ${DATA_DIR}/coin_market_data_chart.xlsx

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
    IF    '${sheet_name}' == 'coin_desk'
        Set Global Variable     ${path_data}    ${COIN_DESK_PATH}
        Set Global Variable     ${path_chart}    ${COIN_DESK_CHART_PATH}
    ELSE
        Log    Processing other sheet: ${sheet_name}
    END
    ${sheet_name_today}     Get Today
    Write Data To Excel    ${path_data}    ${sheet_name_today}    ${news}
    ${test}    Set Variable    ${path_data}
    Log    ${test}

#Count keyword
#    [Arguments]    ${keyword}
#    ${count}    Count Keyword    ${EXCEL_PATH}    ${keyword}

Count common keywords
    ${result}    Find Most Common Keywords       ${path_data}
    Log    ${result}
     
Export chart
    ${result}    Find Most Common Keywords       ${path_data}
    Log    ${result}
    ${sheet_name}    Get Today
    Save Keywords To Existing Excel    ${path_chart}    ${result}    ${sheet_name}

Get api and write data
    ${headers}       Create Dictionary    Accepts    application/json   X-CMC_PRO_API_KEY   d892d007-396a-49ba-afef-e82727e5d75a
    ${params}   Create Dictionary    start  1   limit   100  convert     USD
    ${response}    GET  https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest     headers=${headers}      params=${params}    expected_status=200
    ${data}     Get From Dictionary    ${response.json()}    data
    ${sheet_name}    Get Today
    Write Api Response To Excel    ${COIN_MARKET}    ${sheet_name}    ${data}
    Clean Coin Market Data    ${COIN_MARKET}    ${sheet_name}
    Generate Coin Market Charts    ${COIN_MARKET}    ${COIN_MARKET_CHART}   ${sheet_name}
