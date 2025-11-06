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
Ler Dados De Login Do Arquivo
    [Arguments]    ${caminho}
    Log To Console    \n📂 Lendo arquivo JSON: ${caminho}
    ${conteudo}=    Get File    ${caminho}
    ${json}=    Convert String To JSON    ${conteudo}
    RETURN    ${json}

Realizar Login E Validar Resultado
    [Arguments]    ${email}    ${senha}    ${status_esperado}    ${mensagem_esperada}
    Log To Console    \n🚀 Testando login com e-mail: ${email}

    # Cria sessão desativando verificação SSL (para evitar warning)
    Create Session    api    ${BASE_URL}    verify=False

    ${body}=    Create Dictionary
    ...    email=${email}
    ...    password=${senha}

    ${response}=    POST On Session    api    ${LOGIN_ENDPOINT}    json=${body}

    Log To Console    🔸 Status code: ${response.status_code}
    Log To Console    🔸 Resposta: ${response.text}

    Should Be Equal As Integers    ${response.status_code}    ${status_esperado}

    ${json_body}=    Convert String To JSON    ${response.text}
    Should Contain    ${json_body["message"]}    ${mensagem_esperada}
