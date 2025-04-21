*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary
Library    OperatingSystem
Library    String
Library    Collections
Library    RequestsLibrary
Library    ../library/DateTimeLibrary.py
Resource   ../page/Event_Page.resource


*** Keywords ***
Create Event
    ${time_start}    Get Next time    15
    ${time_finish}    Get Next time    30
    ${next_day}    Get Next Day
#    ${date_time}    Get Event Date Time
#    ${next_date}    Get From List    ${date_time}    0
#    ${time_start}    Get From List    ${date_time}    1
#    ${time_finish}    Get From List    ${date_time}    2
    Wait Until Element Is Visible    ${date_start}    5
    Execute JavaScript    document.getElementsByClassName('calendar-field calendar-field-datetime')[0].value='${next_day}'
    Execute JavaScript    document.getElementsByClassName('calendar-field calendar-field-datetime')[1].value='${next_day}'
    Execute JavaScript    document.getElementsByClassName('calendar-field calendar-field-datetime-menu')[0].value='${time_start}'
    Execute JavaScript    document.getElementsByClassName('calendar-field calendar-field-datetime-menu')[1].value='${time_finish}'
    Sleep    3
    Click Button    ${save_button}
