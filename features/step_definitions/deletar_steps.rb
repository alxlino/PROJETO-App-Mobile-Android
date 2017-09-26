require 'calabash-android/calabash_steps'
require 'rspec'


  When(/^deleto esse carro$/) do                                                
    @renovaCar = page(RenovaCarPage).await(timeout: 30)
    
    expect(@renovaCar.verifica_botaoConsultar?).to be(true)
    
    @renovaCar.clicaConsulta

    sleep 5

    @consultarCadastro = page(ConsultarCadastroPage).await(timeout: 30)

    expect(@consultarCadastro.verifica_elemento?).to be(true)

    @consultarCadastro.scrollDownEClica(@carroAlterado)

    @cadastroDeCarrosWeb = page(CadastroDeCarrosWebPage).await(timeout: 30)
    
    expect(@cadastroDeCarrosWeb.verifica_pagina?).to be(true)

    @cadastroDeCarrosWeb.deletarCarro
  end                                                                           
                                                                                
  Then(/^esse carro alterado não deve ser exibido na busca$/) do                
    expect(@consultarCadastro.verifica_elemento?).to be(true)
    
    #@consultarCadastro.scrollDownEClica(@carroAlterado)
  end                                                                           