*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${loader}    //div[@class='loader']

*** Keywords ***
Wait for page loader
    wait until element is visible    ${loader}
    wait until element is not visible    ${loader}

