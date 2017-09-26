
Feature: Alterar Veículos no aplicativo Cadastro de Carros Web

@alterar
Scenario: Alterar os dados do veículo que foi criado pelo aplicativo

  Given que eu tenho um novo carro:
    |   modelo   |  Fiat |
    |     ano    |  2017 |
    |    placa   |JKL0001|
    |kilometragem| 50.000|
    |    valor   | 43.000|
  Given que eu tenho os dados do veículo para alterar:
    |   modelo   | Volks |
    |     ano    |  2029 |
    |    placa   |ZEV0001|
    |kilometragem| 51.234|
    |    valor   | 43.456|
   When altero esse carro
   Then esse novo carro alterado deve ser exibido na busca