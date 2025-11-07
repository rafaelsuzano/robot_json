*** Settings ***
Library    JSONLibrary
Resource   ../resources/keywords.robot

*** Variables ***
${CAMINHO_JSON}    ../data/logins.json

*** Test Cases ***
Login Dinâmico
    ${dados}=    Ler Dados De Login Do Arquivo    ${CAMINHO_JSON}
    ${cenarios}=    Get Value From Json    ${dados}    $.logins

    FOR    ${cenario}    IN    @{cenarios}
        ${email}=    Set Variable    ${cenario["email"]}
        ${senha}=    Set Variable    ${cenario["senha"]}
        ${status}=    Set Variable    ${cenario["status_esperado"]}
        ${mensagem}=    Set Variable    ${cenario["mensagem_esperada"]}
        Realizar Login E Validar Resultado    ${email}    ${senha}    ${status}    ${mensagem}
    END
