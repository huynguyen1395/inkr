*** Settings ***
Resource    ../page/ui/login_page.resource
Resource    ../locator/login_page_locator.resource
Resource    ../page/ui/search_and_filter_page.resource

Test Setup  Login To Application
Test Teardown   Close All Browsers

*** Test Cases ***
TC001_Search_Reading_List_By_Search_Text_Category_Release_Status_And_Age
    Search And Filter Reading List    baby    manga    completed    teen