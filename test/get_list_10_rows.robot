*** Settings ***
Resource    ../page/ui/coin_market_cap_page.resource


Test Teardown   Close All Browsers

*** Test Cases ***
# this test cas is run on ci/cd github
Get Data
    Get list 10 rows