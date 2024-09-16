*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.cermati.com/app/gabung
${BROWSER}      Chrome
${PHONE_NUMBER}    085146030521
${EMAIL}    fandlyfr@gmail.com
${FIRST_NAME}    fandlyfr
${LAST_NAME}    muhammad


*** Test Cases ***
User Successfuly Register
    [Tags]    RegressionTest    Register
    Given The user is on the register page
    When The user fill the Phone Number
    And The user fill the Email
    And The user fill the First Name
    And The user fill the Last Name
    Then Click Register Button

*** Keywords ***
The user is on the register page
    Open Browser    ${URL}    ${BROWSER}
    Set Selenium Speed    0.5s
    Maximize Browser Window

The user fill the Phone Number
    Input Text    id:mobilePhone    ${PHONE_NUMBER}

The user fill the Email
    Input Text    id:email    ${EMAIL}

The user fill the First Name
    Input Text    id:firstName    ${FIRST_NAME}

The user fill the Last Name
    Input Text    id:lastName    ${LAST_NAME}

Click Register Button
    Element Should Be Enabled    xpath://button[contains(@class, 'RegistrationForm_form-container__button')]
    Click Button    xpath://button[contains(@class, 'RegistrationForm_form-container__button')]
    ##CAPTCHA IS BLOCKED
    Wait Until Page Contains Element     id=“rc-anchor-container”     30s
    Wait Until Page Contains Element     //span[@id=‘recaptcha-anchor’]     30s
    Click Element     //span[@id=‘recaptcha-anchor’]
    Click Button    xpath://button[contains(@class, 'RegistrationForm_form-container__button')]