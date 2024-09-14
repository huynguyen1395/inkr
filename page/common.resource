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
    Create Webdriver    Chrome
    Go To   ${url}
    Maximize Browser Window
