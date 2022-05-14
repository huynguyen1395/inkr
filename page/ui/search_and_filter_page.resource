*** Settings ***
Resource    ../../locator/search_and_filter_page_locator.resource
Library    Selenium2Library
Library    String
Library    Collections

*** Keywords ***
Search And Filter Reading List
   [Arguments]     ${search_text_param}      ${category}    ${release_status}     ${age}
   ${search_url}    Replace String    ${search_url_locator}   {search_text}  ${search_text_param}
   # Search with text
   Go To    ${search_url}
   Sleep    2s
   ${status}    Run Keyword And Return Status    Page Should Contain Element    ${btn_turn_off_notification}
   # Close popup notification
   Run Keyword If    '${status}'=='True'
   ...    Click Element    ${btn_turn_off_notification}
   Wait Until Page Contains Element    ${manga_filter_locator}
   # Filter with multiple param
   Choose Filter Option    ${category}    ${release_status}     ${age}
   ${list_information}      Get Information Of Book
   Log  ${list_information}
   # Assert Information of Book match with param search
   Should Contain    ${list_information}[0]    Manga
   Should Contain    ${list_information}[1]    Completed
   Should Contain    ${list_information}[2]    Teen

Choose Filter Option
    [Arguments]     ${filter_01}    ${filer_02}     ${filter_03}
    @{list_filter}  Create List      ${filter_01}    ${filer_02}     ${filter_03}
    FOR    ${filter}    IN    @{list_filter}
        ${locator_filter_param}    Replace String    ${filter_param_locator}   {filter_param}  ${filter}
        Click Element    ${locator_filter_param}
        Sleep    1s
    END

Get Information Of Book
   ${count}     Get Element Count    ${count_reading_list_locator}
   ${listIndex}     Create List
   FOR    ${index}    IN RANGE   ${count}
       Append To List    ${listIndex}   ${index}
   END
   ${value}  Evaluate  random.choice(${listIndex})  random
   ${book}  Replace String    ${book_locator}    {index}    '${value}'
   Click Element    ${book}
   Sleep    2s
   ${release_status_text}   Get Text    ${release_status_locator}
   Click Element    ${show_more_locator}
   ${age_text}  Get Text    ${age_information_locator}
   ${category_text}  Get Text    ${style_origin_locator}
   @{list_information}     Create List     ${category_text}     ${release_status_text}      ${age_text}
   [Return]     @{list_information}