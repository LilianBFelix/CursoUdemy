*** Settings ***
Documentation    documentação da API: https://fakerestapi.azurewebsites.net/index.html
Library    RequestsLibrary 
Library    Collections
Library    requests


*** Variables ***
${URL_API}    https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}     
...    id=15
...    title=Book 15
...    description=Lorem
...    pageCount=1500
...    excerpt=Lorem
...    publishDate=2022-11-06T22:23:40.6170002+00:00

&{BOOK_201}     ID=201
...             Title=Meu novo Book
...             Description=Meu novo livro conta coisas fantásticas
...             PageCount=523
...             Excerpt=Meu Novo livro é massa
...             PublishDate=2018-04-26T17:58:14.765Z

&{BOOK_150}     ID=150
...             Title=Book 150 alterado
...             Description=Descrição do book 150 alteada
...             PageCount=600
...             Excerpt=Resumo do book 150 alteado
...             PublishDate=2022-11-21T23:16:14.694Z



*** Keywords ***
#setuo e teardows
conectar a minha API
    Create Session    fakeAPI    ${URL_API}


requisitar todos os livros
    ${RESPOSTA}    Get Request    fakeAPI    Books
    Log   ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}
Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}    Get Request    fakeAPI    Books/${ID_LIVRO}
    Log   ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Cadastrar um novo livro 
    ${HEADERS}    Create Dictionary    content-type=application/json
    ${RESPOSTA}    Post Request    fakeAPI    Books  
...       data={"id": 2323,"title": "teste","description": "teste","pageCount": 200,"excerpt": "teste","publishDate": "2022-11-21T22:44:46.644Z"}   
...       headers=${HEADERS}
    Log   ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}         

Alterar o livro "${ID_LIVRO}"
    
    ${HEADERS}    Create Dictionary    content-type=application/json
    ${RESPOSTA}    Put Request    fakeAPI    Books/${ID_LIVRO}
    ...                           data={"ID": ${BOOK_150.ID},"Title": "${BOOK_150.Title}","Description": "${BOOK_150.Description}","PageCount": ${BOOK_150.PageCount},"Excerpt": "${BOOK_150.Excerpt}","PublishDate": "${BOOK_150.PublishDate}"}
    ...                           headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}


Excluir o livro "${ID_LIVRO}"
    ${RESPOSTA}    Delete Request    fakeAPI    Books/${ID_LIVRO}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}



Conferir o status code
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason 
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}    ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be    ${RESPOSTA.json()}   ${QTDE_LIVROS}

Conferir se retorna todos os dados corretos do livro 15
    Get From Dictionary   ${RESPOSTA.json()}    id    ${BOOK_15.id}    
    Get From Dictionary    ${RESPOSTA.json()}    title    ${BOOK_15.title}
    Get From Dictionary   ${RESPOSTA.json()}    description    ${BOOK_15.description}
    Get From Dictionary    ${RESPOSTA.json()}    pageCount   ${BOOK_15.pageCount} 
    Get From Dictionary   ${RESPOSTA.json()}    excerpt    ${BOOK_15.excerpt}
    Get From Dictionary   ${RESPOSTA.json()}    publishDate    ${BOOK_15.publishDate}

Conferir se retorna todos os dados cadastrados do livro "${ID_LIVRO}"
    Conferir livro  ${ID_LIVRO}
Conferir se retorna todos os dados alterados do livro "${ID_LIVRO}"
    Conferir livro   ${ID_LIVRO}

Conferir livro
    [Arguments]     ${ID_LIVRO}
    Get From Dictionary     ${RESPOSTA.json()}    id              ${BOOK_${ID_LIVRO}.ID}
    Get From Dictionary    ${RESPOSTA.json()}    title           ${BOOK_${ID_LIVRO}.Title}
    Get From Dictionary   ${RESPOSTA.json()}    description     ${BOOK_${ID_LIVRO}.Description}
    Get From Dictionary    ${RESPOSTA.json()}    pageCount       ${BOOK_${ID_LIVRO}.PageCount}
    Get From Dictionary    ${RESPOSTA.json()}    excerpt         ${BOOK_${ID_LIVRO}.Excerpt}
    Get From Dictionary    ${RESPOSTA.json()}    publishDate     ${BOOK_${ID_LIVRO}.PublishDate}

Conferir se excluiu o livro "${ID_LIVRO}"
    Should Be Empty     ${RESPOSTA.content}
