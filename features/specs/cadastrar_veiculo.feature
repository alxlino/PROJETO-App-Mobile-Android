
Feature: Cadastrar Veículos no aplicativo Cadastro de Carros Web

@cadastrar
Scenario: Cadastrar um novo veículo pelo aplicativo

  Given que eu tenho um novo carro:
        |   modelo   |  Fiat |
        |     ano    |  2017 |
        |    placa   |JKL0001|
        |kilometragem| 50.000|
        |    valor   | 43.000|

   When cadastro esse carro
   Then esse novo carro deve ser exibido na busca