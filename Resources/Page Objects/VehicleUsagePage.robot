*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${privateUse_button}    //div[@data-track='vehUsage']/div/div/div//label[1]
${businessUse_button}    //div[@data-track='vehUsage']/div/div/div//label[2]
${businessUsage_comboBox}    //div[@id='mui-component-select-vehBusinessUse']
${rideSharing_button}    //div[@data-track='vehUsage']/div/div/div//label[3]
${noFinance_button}    //div[@data-track='vehFinance']/div/div/div//label[1]
${finance_button}    //div[@data-track='vehFinance']/div/div/div//label[2]
${next_button}    //button[@data-track='Next']
${financialInstitution_comboBox}    //input[@id='finance-list']
${empty}

*** Keywords ***
Click private use button
    wait until element is visible    ${privateUse_button}
    click element    ${privateUse_button}

Click business use button
    wait until element is visible    ${businessUse_button}
    click element    ${businessUse_button}

Select bussiness usage
    [Arguments]    ${businessUsage}
    wait until element is visible    ${businessusage_combobox}
    click element    ${businessusage_combobox}
    set test variable    ${businessUsage_selectItem}    //div[contains(text(),'${businessUsage}')]
    wait until element is visible    ${businessUsage_selectItem}
    click element    ${businessUsage_selectItem}

Click ride sharing button
    wait until element is visible    ${rideSharing_button}
    click element    ${rideSharing_button}

Select vehicle usage
    [Arguments]    ${vehicleUsage}    ${businessUsage}
    run keyword if    '${vehicleUsage}'=='private'    Click private use button    ELSE IF    '${vehicleUsage}'=='business'    click business use button    ELSE    click ride sharing button
    run keyword if    '${vehicleUsage}'=='business'    Select bussiness usage    ${businessUsage}

Click no finance button
    wait until element is enabled    ${noFinance_button}
    click element    ${noFinance_button}

Click finance button
    wait until element is enabled   ${finance_button}
    click element    ${finance_button}

Answer finance question
    [Arguments]    ${finance}    ${financialInstitution}
    run keyword if    '${finance}'=='yes'    click finance button    ELSE    click no finance button
    run keyword if    '${finance}'=='yes'    select financial institution    ${financialInstitution}
    #run keyword if    '${financialInstitution}' != '${empty}'    select financial institution

Select financial institution
    # TODO: arguments issue
    [Arguments]    ${financialInstitution}
    wait until element is visible    ${financialInstitution_comboBox}
    click element    ${financialInstitution_comboBox}
    #input text    ${financialInstitution_comboBox}    ${financialInstitution}
    set test variable    ${financialInstitution_selectItem}    //li[contains(text(),'${financialInstitution}')]
    wait until page contains element    ${financialInstitution_selectItem}
    click element    ${financialInstitution_selectItem}


Click next button
    wait until element is enabled    ${next_button}
    click element    ${next_button}

