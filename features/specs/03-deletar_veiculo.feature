
Feature: Deletar Veículos no aplicativo Cadastro de Carros Web

@deletar
Scenario: Deletar o veículo que foi alterado pelo aplicativo

  Given que eu tenho os dados do veículo para alterar:
    |   modelo   | Volks |
    |     ano    |  2029 |
    |    placa   |ZEV0001|
    |kilometragem| 51.234|
    |    valor   | 43.456|
   When deleto esse carro
   Then esse carro alterado não deve ser exibido na busca