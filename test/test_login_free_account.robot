*** Settings ***
Resource    ../page/ui/login_page.resource
Resource    ../locator/login_page_locator.resource

Test Teardown   Close All Browsers

*** Test Cases ***
# this test cas is run on ci/cd azure devops
TC001_Test_Login_With_Free_Acount
    Login To Application
    Page Should Contain Element    ${icon_user}