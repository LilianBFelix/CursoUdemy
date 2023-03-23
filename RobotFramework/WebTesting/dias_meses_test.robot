*** Settings ***
Documentation    esse teste verifica os dias dos meses
Library    Collections

*** Variables ***
&{DIAS_POR_MES_2022}    Janeiro=31    Fevereiro=28    Março=31    Abril=30
...    Maio=31    Junho=30    Julho=31    Agosto=31    Setembro=30
...    Outubro=31    Novembro=30    Dezembro=31

#Dicionário 

*** Test Cases ***
Dias por mês - teste 01
    Imprimir dias por mes de 2022


*** Keywords ***
Imprimir dias por mes de 2022
    Log To Console     Em JANEIRO há &{DIAS_POR_MES_2022} dias!
    Log To Console     Em FEVEREIRO há &{DIAS_POR_MES_2022} dias!
    Log To Console     Em MARÇO há &{DIAS_POR_MES_2022} dias!
    Log To Console     Em ABRIL há &{DIAS_POR_MES_2022} dias!
    Log To Console     Em MAIO há &{DIAS_POR_MES_2022} dias!
    Log To Console     Em JUNHO há &{DIAS_POR_MES_2022} dias!
    Log To Console     Em JULHO há &{DIAS_POR_MES_2022} dias!
    Log To Console     Em AGOSTO há &{DIAS_POR_MES_2022} dias!
    Log To Console     Em SETEMBRO há &{DIAS_POR_MES_2022} dias!
    Log To Console     Em OUTUBRO há &{DIAS_POR_MES_2022} dias!
    Log To Console     Em NOVEMBRO há &{DIAS_POR_MES_2022} dias!
    Log To Console     Em DEZEMBRO há &{DIAS_POR_MES_2022} dias!
    
