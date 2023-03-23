*** Settings ***
Documentation    essa suite testa o site da amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador




*** Test Cases ***
caso de teste 01 - Acesso ao menu "Eletronicos"
    [Documentation]    esse teste verifica o menu livros do site da amazon.com.br
...                    e verifica a categoria livros em oferta
    [Tags]    menus    categorias

    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Validar o titulo da pagina
    Verificar se aparece a categoria "Tablets"


caso de test 02 - Pesquisa de um Produto
    [Documentation]    esse teste verifica a busca de um produto 
    [Tags]    busca_produtos    lista_busca

    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa,listando o produto "Console Xbox Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
	Adicionar o produto "Console Xbox Series S" no carrinho
	Verificar se o produto "Console Xbox Series S" foi adicionado
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa,listando o produto "Console Xbox Series S"
	Adicionar o produto "Console Xbox Series S" no carrinho
	Verificar se o produto "Console Xbox Series S" foi adicionado
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio