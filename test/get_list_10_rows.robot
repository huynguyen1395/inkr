*** Settings ***
Resource    ../page/ui/coin_market_cap_page.resource


Test Teardown   Close All Browsers

*** Test Cases ***
# this test cas is run on ci/cd azure devops
TC001_Test_Login_With_Free_Acount
    Get list 10 rows
#    Page Should Contain Element    ${row_1}