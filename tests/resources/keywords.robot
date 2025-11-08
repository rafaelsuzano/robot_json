*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    BuiltIn
Library    JSONLibrary

*** Variables ***
${BASE_URL}           https://serverest.dev
${LOGIN_ENDPOINT}     /login

*** Keywords ***

Realizar Login E Validar Resultado
    [Arguments]    ${email}    ${password}    ${expected_status}    ${expected_message}
    Log To Console    \n🚀 Testando login com e-mail: ${email}


    Create Session    login_api    ${BASE_URL}    verify=False
    ${body}=    Create Dictionary    email=${email}    password=${password}
    ${response}=    POST On Session    login_api    /login    json=${body}   expected_status=any    allow_redirects=True

    Should Be Equal As Integers    ${response.status_code}    ${expected_status}
    ${json}=    To JSON    ${response.content}
    Should Contain    ${json["message"]}    ${expected_message}
