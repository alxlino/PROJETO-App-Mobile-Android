require 'calabash-android/calabash_steps'
require 'rspec'

Given(/^que eu tenho um novo carro:$/) do |table|                            
    # table is a Cucumber::MultilineArgument::DataTable                        
    @carro = OpenStruct.new(table.rows_hash)
end                                                                          
                                                                               
When(/^cadastro esse carro$/) do 

    @renovaCar = page(RenovaCarPage).await(timeout: 30)
#=begin    
    expect(@renovaCar.verifica_botao?).to be(true)
    
    @renovaCar.clicaCadastrar

    @cadastroDeCarrosWeb = page(CadastroDeCarrosWebPage).await(timeout: 30)

    expect(@cadastroDeCarrosWeb.verifica_pagina?).to be(true)

    @cadastroDeCarrosWeb.cadastrar(@carro)

    sleep 5
    
    press_back_button
#=end
end
                                                                               
Then(/^esse novo carro deve ser exibido na busca$/) do                       
    
    expect(@renovaCar.verifica_botaoConsultar?).to be(true)
    
    @renovaCar.clicaConsulta

    sleep 5

    @consultarCadastro = page(ConsultarCadastroPage).await(timeout: 30)

    expect(@consultarCadastro.verifica_elemento?).to be(true)

    @consultarCadastro.scrollDownEClica(@carro)

    @cadastroDeCarrosWeb.validarCampoCadastro(@carro.modelo,'Modelo')
    @cadastroDeCarrosWeb.validarCampoCadastro(@carro.ano, 'Ano')
    @cadastroDeCarrosWeb.validarCampoCadastro(@carro.placa,'Placa')
    @cadastroDeCarrosWeb.validarCampoCadastro(@carro.kilometragem,'KM')
    @cadastroDeCarrosWeb.validarCampoCadastro(@carro.valor,'Valor')

end                                                                          