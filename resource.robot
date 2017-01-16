*** Settings ***
Documentation     A resource file with keywords and variables.
Library           Selenium2Library

*** Variables ***
${SERVER}         app.codeship.com
${BROWSER}        PhantomJS
${DELAY}          0
${USER}           Chris Ward
${VALID USER}     chriswhward@gmail.com
${VALID PASSWORD}    VO^kVza4#TkP
${LOGIN URL}      https://${SERVER}/sessions/new
${PROJECTS URL}    https://${SERVER}/projects

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Hosted Continuous Delivery for free | The Codeship.

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    user_email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    user_password    ${password}

Submit Credentials
    Click Button    signin

Projects Page Should Be Open
    Location Should Be    ${PROJECTS URL}
    Title Should Be    Dashboard - ${USER}

Highlight form
    [Arguments]  ${locator}
    Update element style  ${locator}  margin-top  0.75em
    Highlight  ${locator}
