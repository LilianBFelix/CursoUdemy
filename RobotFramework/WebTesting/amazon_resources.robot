*** Settings ***
Library     SeleniumLibrary
Library    Telnet
Library    XML

*** Variables ***
${URL}    http://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HAEDER_ELETRONICO}   Eletrônicos e Tecnologia | Amazon.com.br
${TEXTO_HAEDER-ELETRONICO}    "Ofertas em Eletrônicos | Esquenta Black Friday"
${BTN_ADD_CARRINHO}        add-to-cart-button
${ADICIONADO_NO_CARRINHO}  //span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
${CARRINHO}             nav-cart
${EXCLUIR}                 //input[contains(@value,'Excluir')]
${REMOVIDO_DO_CARRINHO}    //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
${TEXTO_ADICIONADO}       Carrinho de compras
*** Keywords ***
Abrir o navegador
    Open Browser   browser=chrome    
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    ${URL}
    Sleep    3s
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
Validar o titulo da pagina
    Sleep    3s
    Title Should Be    ${HAEDER_ELETRONICO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    xpath=//li[@class='a-spacing-micro apb-browse-refinements-indent-2'][contains(.,'Tablets')]
     
 Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox   text=Xbox Series S
    Sleep    3s
Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button
    Sleep    3s
Verificar o resultado da pesquisa,listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]
    Sleep    3s
Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    xpath=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')]
    Wait Until Element Is Visible    locator=${BTN_ADD_CARRINHO}
    Click Button    locator=${BTN_ADD_CARRINHO}
    Sleep    3s
Verificar se o produto "${PRODUTO}" foi adicionado
    Wait Until Element Is Visible    locator=${ADICIONADO_NO_CARRINHO}
    Click Link    locator=${CARRINHO}
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUTO}')]

Remover o produto "Console Xbox Series S" do carrinho
    Click Link    locator=${CARRINHO}
    Click Element   locator=${EXCLUIR}
    Sleep    3s
Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=${REMOVIDO_DO_CARRINHO}
    Sleep    3s
#Gherkin Steps
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Validar o titulo da pagina

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Validar o titulo da pagina
E a categoria "Tablets" deve ser exibida na página    
    Verificar se aparece a categoria "Tablets"

 Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa,listando o produto "Console Xbox Series S"
Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa,listando o produto"Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado

E existe o produto "Console Xbox Series S" no carrinho
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio