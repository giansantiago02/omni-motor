*** Settings ***
Library    SeleniumLibrary
#Resource    C:/robot-scripts/omni-motor/Resources/Page Objects/PageLoader.robot

*** Variables ***

${ENVIRONMENT}    prod
&{URL}    prod=https://www.qbe.com/au/portal/quote/vehicle?promotionalCode=SAVE75#/welcome    badcampaign=https://www.qbe.com/au/portal/quote/vehicle?promotionalCode=SAVE765#/welcome
${BROWSER}    chrome
&{BROWSERS}    chrome=gc    firefox=ff

*** Keywords ***
Start Testing
    open browser    about:blank    ${BROWSERS.${BROWSER}}
    maximize browser window
    go to    ${URL.${ENVIRONMENT}}

End Testing
    close browser





