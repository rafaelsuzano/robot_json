*** Settings ***
Documentation     Teste de login dinâmico usando dados do JSON e RequestsLibrary
Library           OperatingSystem
Library           JSONLibrary
Library           Collections
Resource          ../resources/keywords.robot
Test Template     Executar Login

*** Variables ***
${DATA_FILE}      ../data/logins.json

*** Test Cases ***
# A lista de testes será gerada dinamicamente
${cenarios}=    Ler Dados De Login Do Arquivo    ${DATA_FILE}
FOR    ${login}    IN    @{cenarios}
    ${login["scenario"]}    ${login["username"]}    ${login["password"]}    ${login["expected_status"]}    ${login["expected_message"]}
END

*** Keywords ***
Executar Login
    [Arguments]    ${usuario}    ${senha}    ${status_esperado}    ${mensagem_esperada}
    Realizar Login E Validar Resultado    ${usuario}    ${senha}    ${status_esperado}    ${mensagem_esperada}
