*** Settings ***
Resource    ../Resources/MotorPortal.robot
Resource    ../Resources/Common.robot
Library    DataDriver    C:/Robot Scripts/omni-motor/Data/testdata.xlsx    sheet_name=motor

#Test Setup    common.start testing
Test Setup    common.start testing
Test Teardown    common.end testing

*** Test Cases ***
Enter address and vehicle information    ${address}
    [Template]    Happy Path

*** Keywords ***
Happy Path
    [Arguments]    ${address}    ${registrationNumber}    ${registered}    ${recentlyBought}    ${damaged}    ${mileage}    ${vehicleUsage}
    ...    ${finance}    ${businessUsage}    ${financialInstitution}    ${dateOfBirth}    ${gender}    ${licenseHeld}    ${demeritPoints}
    ...    ${claims}    ${suspended}    ${convicted}    ${fraud}
    Run Keyword And Ignore Error  pageloader.wait for page loader
    welcomepage.click continue button
    Run Keyword And Ignore Error  pageloader.wait for page loader
    MyVehiclePage.Enter a valid address    ${address}
    MyVehiclePage.Enter a valid registration number    ${registrationNumber}
    myvehiclepage.click next button
    ConfirmVehiclePage.Answer registration requirements question    ${registered}
    ConfirmVehiclePage.Answer recently bought question    ${recentlyBought}
    ConfirmVehiclePage.Answer with existing damage question    ${damaged}
    confirmvehiclepage.select annual mileage    ${mileage}
    confirmvehiclepage.click next button
    VehicleUsagePage.Select vehicle usage    ${vehicleUsage}    ${businessUsage}
    VehicleUsagePage.Answer finance question    ${finance}    ${financialInstitution}
    run keyword and ignore error  VehicleUsagePage.Select financial institution    ${financialInstitution}
    VehicleUsagePage.Click next button
    MainDriverPage.Enter date of birth    ${dateOfBirth}
    MainDriverPage.Select gender    ${gender}
    MainDriverPage.Select license held    ${licenseHeld}
    MainDriverPage.Select demerit points    ${demeritPoints}
    MainDriverPage.Answer claims question    ${claims}
    MainDriverPage.Answer suspension question    ${suspended}
    MainDriverPage.Answer conviction question    ${convicted}
    maindriverpage.answer fraud question    ${fraud}
    MainDriverPage.Click next button
    DriversPage.Verify Main Driver page
    DriversPage.Click next button
    #Commit changes
