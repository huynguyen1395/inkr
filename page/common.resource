*** Settings ***
Library     Selenium2Library
Library     OperatingSystem
Library     String
Library     Collections
Resource    ../config/env_config.resource

*** Keywords ***
Open Web Application
    ${path}     Join Path    ${CURDIR}      ../test/webdriver/chromedriver.exe
    Create Webdriver    Chrome    executable_path=${path}
    Go To   ${url}
    Maximize Browser Window
