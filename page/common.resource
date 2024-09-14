*** Settings ***
Library     Selenium2Library
Library     OperatingSystem
Library     String
Library     Collections
Resource    ../config/env_config.resource

*** Keywords ***
Open Web Application
#    ${path}     Join Path    ${CURDIR}      ../test/webdriver/chrome-win64
#    executable_path=${path}
    ${chrome_options}    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Create Webdriver    Chrome      options=${chrome_options}
    Go To   ${url}
    Maximize Browser Window
