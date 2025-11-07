*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${BASE_URL}           https://serverest.dev
${LOGIN_ENDPOINT}     /login

*** Keywords ***
Executar Login
    [Arguments]    ${email}    ${password}

    Log To Console    🔹 Enviando requisição de login para ${BASE_URL}${LOGIN_ENDPOINT}
    Create Session    api    ${BASE_URL}    verify=False

    ${body}=    Create Dictionary
    ...    email=${email}
    ...    password=${password}

    ${response}=    POST On Session    api    ${LOGIN_ENDPOINT}    json=${body}
    [Return]    ${response}
