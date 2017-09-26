require 'calabash-android/calabash_steps'
require 'rspec'


Given(/^que eu tenho os dados do veículo para alterar:$/) do |table|
    @carroAlterado = OpenStruct.new(table.rows_hash)
end

When(/^altero esse carro$/) do                                               
    @renovaCar = page(RenovaCarPage).await(timeout: 30)
    
    expect(@renovaCar.verifica_botaoConsultar?).to be(true)
    
    @renovaCar.clicaConsulta

    sleep 5

    @consultarCadastro = page(ConsultarCadastroPage).await(timeout: 30)

    expect(@consultarCadastro.verifica_elemento?).to be(true)

    @consultarCadastro.scrollDownEClica(@carro)
end                                                                          
                                                                               
Then(/^esse novo carro alterado deve ser exibido na busca$/) do              
    @cadastroDeCarrosWeb = page(CadastroDeCarrosWebPage).await(timeout: 30)
    
    expect(@cadastroDeCarrosWeb.verifica_pagina?).to be(true)

    @cadastroDeCarrosWeb.apagarCampos(@carro)

    @cadastroDeCarrosWeb.cadastrar(@carroAlterado,"Alterar")
    
    sleep 5

    @consultarCadastro.scrollDownEClica(@carroAlterado)

    @cadastroDeCarrosWeb.validarCampoCadastro(@carroAlterado.modelo,'Modelo')
    @cadastroDeCarrosWeb.validarCampoCadastro(@carroAlterado.ano, 'Ano')
    @cadastroDeCarrosWeb.validarCampoCadastro(@carroAlterado.placa,'Placa')
    @cadastroDeCarrosWeb.validarCampoCadastro(@carroAlterado.kilometragem,'KM')
    @cadastroDeCarrosWeb.validarCampoCadastro(@carroAlterado.valor,'Valor')
    
    press_back_button

    @consultarCadastro.voltarPaginaInicial
    
end                                                                          