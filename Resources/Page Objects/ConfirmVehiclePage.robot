*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${registrationRequirements_yes_button}    //div[@name='vehRegRequird']//button[@value='yes']
${registrationRequirements_no_button}    //div[@name='vehRegRequird']//button[@value='no']
${recentlyBought_yes_button}    //div[@name='vehBuyDate06']//button[@value='yes']
${recentlyBought_no_button}    //div[@name='vehBuyDate06']//button[@value='no']
${vehicleDamage_yes_button}    //div[@name='vehDamageExists']//button[@value='yes']
${vehicleDamage_no_button}    //div[@name='vehDamageExists']//button[@value='no']
${mileage_comboBox}    //div[contains(text(),'Please choose')]
${next_button}    //button[@data-track='Next']

*** Keywords ***
Click registration requirements yes button
    wait until element is visible    ${registrationRequirements_yes_button}
    click element    ${registrationRequirements_yes_button}

Click registration requirements no button
    wait until element is visible    ${registrationRequirements_no_button}
    click element    ${registrationRequirements_no_button}

Click recently bought yes button
    click element    ${recentlyBought_yes_button}

Click recently bought no button
    click element    ${recentlyBought_no_button}

Click vehicle damage yes button
    click element    ${vehicleDamage_yes_button}

Click vehicle damage no button
    click element    ${vehicleDamage_no_button}

Answer registration requirements question
    [Arguments]    ${registered}
    run keyword if    '${registered}'=='yes'    Click registration requirements yes button    ELSE    click registration requirements no button

Answer recently bought question
    [Arguments]    ${recentlyBought}
    run keyword if    '${recentlyBought}'=='yes'    click recently bought yes button    ELSE    click recently bought no button

Answer with existing damage question
    [Arguments]    ${damaged}
    run keyword if    '${damaged}'=='yes'    click vehicle damage yes button    ELSE    click vehicle damage no button
    sleep    3s

Select annual mileage
    [Arguments]    ${mileage}
    click element    ${mileage_comboBox}
    set test variable    ${mileage_selectItem}    //div[contains(text(),'${mileage}')]
    #sleep    3s
    wait until element is visible    ${mileage_selectItem}
    click element    ${mileage_selectItem}

Click next button
    wait until element is enabled    ${next_button}
    click element    ${next_button}