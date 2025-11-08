*** Settings ***
Documentation     Testes de Login com dados dinâmicos do JSON
Library           DataDriver    file=data/logins.json    encoding=utf-8
Resource          resources/keywords.robot
Test Template     Executar Login Com Dados


*** Test Cases ***
Login com dados do JSON
    [Template]    Executar Login Com Dados

*** Keywords ***
Executar Login Com Dados
    [Arguments]    ${email}    ${password}    ${expected_status}    ${expected_message}
    Realizar Login E Validar Resultado    ${email}    ${password}    ${expected_status}    ${expected_message}

