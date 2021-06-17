*** Settings ***
Library         SeleniumLibrary
Library         OperatingSystem
Documentation   This robot file can be used to generate screenshots
Test Setup      Open The Main Page
Test Teardown   Close Opened Browser

*** Variables ***
${BROWSER}           Firefox
${SUT_URL}           https://squash-tf.readthedocs.io/en/latest/

*** Test Cases ***
Take Default Screenshot
    Wait Until Page Contains Element               xpath: //h1[contains(text(),'Welcome to Squash TF components documentation!')]    30
    Click Link                                     xpath: //a[text()='Squash TF Java Junit Runner']
    Wait Until Page Contains Element               xpath: //h1[contains(text(),'Squash TF Java Junit Runner')]    30
    Capture Page Screenshot
    Click Link                                     xpath: //a[text()='METADATA in JUnit Runner']
    Wait Until Page Contains Element               xpath: //h1[contains(text(),'Metadata in JUnit runner')]    30
    Capture Page Screenshot

Take Screenshot In Custom Path
    Set Screenshot Directory                       target/customPath
    Wait Until Page Contains Element               xpath: //h1[contains(text(),'Welcome to Squash TF components documentation!')]    30
    Click Link                                     xpath: //a[text()='Squash TF Robot Framework Runner']
    Wait Until Page Contains Element               xpath: //h1[contains(text(),'Squash TF Robot Framework Runner')]    30
    Capture Page Screenshot
    Click Link                                     xpath: //a[text()='Metadata in Robot Framework Runner']
    Wait Until Page Contains Element               xpath: //h1[contains(text(),'Metadata in Robot Framework Runner')]    30
    Capture Page Screenshot

Take Screenshot In Custom Path With Specific Names
    Set Screenshot Directory                       target/customNames
    Wait Until Page Contains Element               xpath: //h1[contains(text(),'Welcome to Squash TF components documentation!')]    30
    Click Link                                     xpath: //a[text()='Squash TF Cucumber Java Runner']
    Wait Until Page Contains Element               xpath: //h1[contains(text(),'Squash TF Cucumber Java Runner')]    30
    Capture Page Screenshot                        firstMenu.png
    Click Link                                     xpath: //a[text()='Expected results']
    Wait Until Page Contains Element               xpath: //h1[contains(text(),'Expected results')]    30
    Capture Page Screenshot                        secondMenu.png

Take Screenshot After Keyword Failure
    Register Keyword To Run On Failure             Capture Page Screenshot
    Set Screenshot Directory                       target/errors
    Wait Until Page Contains Element               xpath: //h1[contains(text(),'Welcome to Squash TF components documentation!')]    30
    Click Link                                     xpath: //a[text()='Execution Server']
    Wait Until Page Contains Element               xpath: //h1[contains(text(),'Squash TF Execution Server')]    30
    Page Should Not Contain Element                xpath: //a[contains(text(), 'Linked Squash TF with Squash TM')]

*** Keywords ***

Open The Main Page
    Open Browser        ${SUT_URL}      ${BROWSER}

Close Opened Browser
    Close Browser
