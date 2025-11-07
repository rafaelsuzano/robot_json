*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Library           Collections
Library           OperatingSystem
Library           DataDriver    file=data/login_data.json    file_format=json
Resource          ../resources/keywords.robot
Test Template     Testar Login

*** Test Cases ***
Cenários de Login
    [Documentation]    Executa todos os cenários de login definidos no arquivo JSON

*** Keywords ***
Testar Login
    [Arguments]    ${scenario}    ${email}    ${password}    ${expected_status}    ${expected_message}
    
    Log To Console    \n🚀 Iniciando cenário: ${scenario}
    ${response}=      Executar Login    ${email}    ${password}

    Log To Console    → Status obtido: ${response.status_code}
    Log To Console    → Mensagem esperada: ${expected_message}

    Should Be Equal As Integers    ${response.status_code}    ${expected_status}
    ${json_body}=      Convert String To JSON    ${response.text}
    Should Contain     ${json_body["message"]}    ${expected_message}
    Log To Console     ✅ Cenário '${scenario}' validado com sucesso!\n
