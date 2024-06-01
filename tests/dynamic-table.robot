*** Settings ***
Documentation    Find the Spider-Man in a table that changes the order of rows and assert his real name
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Heroes_Table}    css:table
${Spiderman_RealName}    xpath://table//td//div[text()="Spider-Man"]/ancestor::tr/td[3]/spa

*** Test Cases ***
Dynamic table
    open the browser with dynamic table url
    verify that real name is Peter Parker

*** Keywords ***
open the browser with dynamic table url
    Create Webdriver    Chrome
    Go To    https://qaplayground.dev/apps/dynamic-table/

get Spider-Man real name
    ${realName}=    Get Text    xpath://table//td//div[text()="Spider-Man"]/ancestor::tr/td[3]/span

verify that real name is Peter Parker
    Element Text Should Be    xpath://table//td//div[text()="Spider-Man"]/ancestor::tr/td[3]/span    Peter Parker