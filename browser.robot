*** Settings ***
Library         Browser
Library         OperatingSystem
Documentation   This robot file can be used to generate screenshots with the Browser library
Test Setup      Open The Main Page
Test Teardown   Close Opened Browser

*** Variables ***
${BROWSER}           chromium
${SUT_URL}           https://squash-tf.readthedocs.io/en/latest/

*** Test Cases ***
Take Default Screenshot
    Wait For Elements State                        xpath=//h1[contains(text(),'Welcome to Squash TF components documentation!')]    visible
    Click                                          xpath=//a[text()='Squash TF Java Junit Runner']
    Wait For Elements State                        xpath=//h1[contains(text(),'Squash TF Java Junit Runner')]    visible
    Take Screenshot
    Click                                          xpath=//a[text()='METADATA in JUnit Runner']
    Wait For Elements State                        xpath=//h1[contains(text(),'Metadata in JUnit runner')]    visible
    Take Screenshot

Take Screenshot After Keyword Failure
    Wait For Elements State                        xpath=//h1[contains(text(),'Welcome to Squash TF components documentation!')]    visible
    Click                                          xpath=//a[text()='Execution Server']
    Wait For Elements State                        xpath=//h1[contains(text(),'Squash TF Execution Server')]    visible
    Get Title                                      ==    This Is Not The Correct Title

*** Keywords ***

Open The Main Page
    New Browser    ${BROWSER}    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       ${SUT_URL}

Close Opened Browser
    Close Browser    CURRENT
