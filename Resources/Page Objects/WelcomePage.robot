*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${continue_btn}    //button[@data-track='CONTINUE']
${startdate_matter_btn}    //button[@data-track='Why does the start date matter?']

*** Keywords ***

Click continue button
    wait until element is visible    ${continue_btn}
    click element    ${continue_btn}