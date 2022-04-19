*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${address_textBox}    //input[@id='vehAddr']
${byRegistration_radioButton}    //input[@value='By registration']
${byMake_radioButton}    //input[@value='By make/model']
${registration_textBox}    //input[@id='vehRegNum']
${year_dropDownArrow}    //div[@data-track='vehModelYear']//button[@title='Open']
#${year_selectionItem}    //li[contains(text(),'${year}')]
${make_dropDownArrow}    //div[@data-track='vehMake']//button[@title='Open']
#${make_selectionItem}    //li[contains(text(),'${make}')]
${model_dropDownArrow}    //div[@data-track='vehModel']//button[@title='Open']
#${model_selectionItem}    //li[contains(text(),'${model}')]
${next_button}    //button[@data-track='Next']


*** Keywords ***
Enter a valid address
    [Arguments]    ${address}
    wait until element is visible    ${address_textBox}
    input text    ${address_textBox}    ${address}
    set test variable    ${address_selectItem}    //div[contains(text(),'${address}')]
    wait until element is visible    ${address_selectItem}
    click element    ${address_selectItem}

Enter a valid registration number
    [Arguments]    ${registrationNumber}
    sleep    1s
    element should be enabled    ${registration_textBox}
    input text    ${registration_textBox}    ${registrationNumber}

Click next button
    wait until element is enabled    ${next_button}
    click element    ${next_button}