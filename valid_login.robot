*** Settings ***
Documentation     A test suite with a single test for valid login.
Library           Selenium2Library
Library           Selenium2Screenshots
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Bootstrap jQuery	
    Highlight form  css=.Session
    ${note1} =  Add pointy note
    ...    css=.Session
    ...    Login here
    ...    width=250  position=top
    Capture and crop page screenshot  login_page.png
    ...    form   ${note1}
    Input Username    chriswhward@gmail.com
    Input Password    VO^kVza4#TkP
    Submit Credentials
    Projects Page Should Be Open
    [Teardown]    Close Browser
