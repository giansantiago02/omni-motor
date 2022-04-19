*** Settings ***
#Library    SeleniumLibrary
Resource    ./Page Objects/WelcomePage.robot
Resource    ./Page Objects/MyVehiclePage.robot
Resource    ./Page Objects/ConfirmVehiclePage.robot
Resource    ./Page Objects/VehicleUsagePage.robot
Resource    ./Page Objects/MainDriverPage.robot
Resource    ./Page Objects/PageLoader.robot


*** Keywords ***
Happy Path
    [Arguments]    ${address}    ${registrationNumber}    ${registered}    ${recentlyBought}    ${damaged}    ${mileage}    ${vehicleUsage}
    ...    ${finance}    ${businessUsage}    ${financialInstitution}    ${dateOfBirth}    ${gender}    ${licenseHeld}    ${demeritPoints}
    ...    ${claims}    ${suspended}    ${convicted}    ${fraud}
    run keyword and ignore error  pageloader.wait for page loader
    welcomepage.click continue button
    run keyword and ignore error  pageloader.wait for page loader
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