*** Settings ***
Documentation    documentação da API: https://fakerestapi.azurewebsites.net/index.html
Resource    resourceAPI.robot
Library    RequestsLibrary 
Library    Collections
Suite Setup    conectar a minha API



*** Test Cases ***
Buscar a listagem de todos os livros (GET em todos os livros)
    requisitar todos os livros
    Conferir o status code    200
    Conferir o reason    OK
    Conferir se retorna uma lista com "200" livros

Buscar um livro especifico (GET em um livro especifico)
    Requisitar o livro "15"
    Conferir o status code    200
    Conferir o reason    OK
    Conferir se retorna todos os dados corretos do livro 15

Cadastrar um novo livros (POST)
    Cadastrar um novo livro 
    Conferir o status code    200
    Conferir o reason   OK
    Conferir se retorna todos os dados cadastrados do livro "201"

Alterar um livro (PUT)
    Alterar o livro "150"
    Conferir o status code    200
    Conferir o reason   OK
    Conferir se retorna todos os dados alterados do livro "150"

Deletar um livro (DELETE)
    Excluir o livro "200"
    Conferir o status code    200
    Conferir o reason   OK
#   (o response body deve ser vazio)
    Conferir se excluiu o livro "200"