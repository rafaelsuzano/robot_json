*** Settings ***
Documentation     Teste de login dinâmico usando dados do JSON e RequestsLibrary
Library           OperatingSystem
Library           JSONLibrary
Library           Collections
Resource          resources/keywords.robot

*** Test Cases ***
Testes de Login via API
    ${logins}=    Ler Dados De Login Do Arquivo    data/logins.json
    FOR    ${login}    IN    @{logins}
        Log To Console    \n🚀 Executando cenário: ${login["scenario"]}
        Realizar Login E Validar Resultado
        ...    ${login["email"]}
        ...    ${login["password"]}
        ...    ${login["expected_status"]}
        ...    ${login["expected_message"]}
    END
