*** Settings ***
Documentation    esse teste verefica os meses do ano

Library     Builtin 

*** Variables ***

@{MESES}    Janeiro    Fevereiro    Março    Abril    Maio    Junho    
...         Julho    Agosto    Setembro    Outubro    Novembro    Dezembro

*** Test Cases ***

Caso de teste - 01 
    Mostrar meses do ano

*** Keywords ***

Mostrar meses do ano
    Log To Console    message= ${MESES[0]}
    Log To Console    message= ${MESES[1]}
    Log To Console    message= ${MESES[2]}
    Log To Console    message= ${MESES[3]}
    Log To Console    message= ${MESES[4]}
    Log To Console    message= ${MESES[5]}
    Log To Console    message= ${MESES[6]}
    Log To Console    message= ${MESES[7]}
    Log To Console    message= ${MESES[8]}
    Log To Console    message= ${MESES[9]}
    Log To Console    message= ${MESES[10]}
    Log To Console    message= ${MESES[11]}