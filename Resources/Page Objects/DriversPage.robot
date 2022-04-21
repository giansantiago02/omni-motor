*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${email_textBox}    //input[@id='insuredEmailAddr']
${drivers_next_button}      //button[@data-track='NEXT']

*** Keywords ***
Verify Main Driver page
    wait until page contains element    ${email_textBox}

Click next button
    wait until page contains element    ${drivers_next_button}
