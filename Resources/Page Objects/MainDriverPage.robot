*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${dateOfBirth_textBox}    //input[@id='driverDOB']
${gender_dropDown}    //div[@id='mui-component-select-driverGender']
${license_dropDown}    //div[@id='mui-component-select-yrsLicensedInAus']
${demeritPoints_dropDown}    //div[@id='mui-component-select-driverZeroDemeritPoints']
${mainDriver_next_button}    //button[@data-track='NEXT']


*** Keywords ***
Enter date of birth
    [Arguments]    ${dateOfBirth}
    wait until page contains element    ${dateOfBirth_textBox}
    input text    ${dateOfBirth_textBox}    ${dateOfBirth}

Select gender
    [Arguments]    ${gender}
    wait until page contains element    ${gender_dropDown}
    click element    ${gender_dropDown}
    set test variable    ${gender_selectItem}    //div[contains(text(),'${gender}')]
    wait until page contains element    ${gender_selectItem}
    click element    ${gender_selectItem}

Select license held
    [Arguments]    ${licenseHeld}
    wait until page contains element    ${license_dropDown}
    click element    ${license_dropDown}
    set test variable    ${license_selectItem}    //div[contains(text(),'${licenseHeld}')]
    wait until page contains element    ${license_selectItem}
    click element    ${license_selectItem}

Select demerit points
    [Arguments]    ${demeritPoints}
    wait until page contains element    ${demeritPoints_dropDown}
    click element    ${demeritPoints_dropDown}
    set test variable    ${demeritPoints_selectItem}    //div[contains(text(),'${demeritPoints}')]
    wait until page contains element    ${demeritPoints_selectItem}
    click element    ${demeritPoints_selectItem}

Answer claims question
    [Arguments]    ${claims}
    set test variable    ${claims_button}    //div[@name='driverClaims']//span[contains(text(),'${claims}')]
    wait until page contains element    ${claims_button}
    click element    ${claims_button}

Answer suspension question
    [Arguments]    ${suspended}
    set test variable    ${suspended_button}    //div[@name='driverLicenseIssue']//span[contains(text(),'${suspended}')]
    wait until page contains element    ${suspended_button}
    click element    ${suspended_button}

Answer conviction question
    [Arguments]    ${convicted}
    set test variable    ${convicted_button}    //div[@name='driverOffense']//span[contains(text(),'${convicted}')]
    wait until page contains element    ${convicted_button}
    click element    ${convicted_button}

Answer fraud question
    [Arguments]    ${fraud}
    set test variable    ${fraud_button}    //div[@name='driverClaimFailure']//span[contains(text(),'${fraud}')]
    wait until page contains element    ${fraud_button}
    click element    ${fraud_button}

Click next button
    wait until page contains element    ${mainDriver_next_button}
    click element    ${mainDriver_next_button}