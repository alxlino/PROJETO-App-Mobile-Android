require 'calabash-android/calabash_steps'
require 'calabash-android/abase'

class RenovaCarPage < Calabash::ABase

    def trait
        "* id:'cadastrar'"
    end

    def consultar_button
        "* id:'consulta'"
    end

    def verifica_botao?
        element_exists(trait)
    end   
    
    def verifica_botaoConsultar?
        element_exists(consultar_button)
    end 

    def clicaCadastrar
        touch(trait)
    end    

    def clicaConsulta
        touch(consultar_button)
    end

end

class CadastroDeCarrosWebPage < Calabash::ABase

    def trait
        "* text:'Cadastro de Carros Web'"
    end

    def verifica_pagina?
        element_exists(trait)
    end

    def field(field_id)
        "* id:'#{field_id}'"
    end    

    def modelo_field
        field('modelo')
    end
    
    def ano_field
        field('ano')
    end

    def placa_field
        field('placa')
    end

    def kilometragem_field
        field('km')
    end

    def valor_field
        field('valor')
    end

    def cadastrar_button
        field('cadastrar')
    end

    def alterar_button
        field('alterar')
    end

    def deletar_button
        field('deletar')
    end

    def cadastrar(carro,botaoNome)
        enter_text(modelo_field, carro.modelo)
        enter_text(ano_field, carro.ano)
        enter_text(placa_field, carro.placa)
        enter_text(kilometragem_field, carro.kilometragem)
        enter_text(valor_field, carro.valor)
        hide_soft_keyboard
        sleep 3
        
        case botaoNome
            when "Cadastrar"
                touch(cadastrar_button)
            when "Alterar"
                touch(alterar_button)
        else
            puts "botão com nome incorreto. utilizar apenas as opções: 'Cadastrar', 'Alterar' ou 'Deletar'"
        end
        sleep 3
    end

    def apagarCampos(carro)
        clear_text_in("* text:'#{carro.modelo}'")
        clear_text_in("* text:'#{carro.ano}'")
        clear_text_in("* text:'#{carro.placa}'")
        clear_text_in("* text:'#{carro.kilometragem}'")
        clear_text_in("* text:'#{carro.valor}'")
        hide_soft_keyboard
    end

    def deletarCarro
        touch(deletar_button)
        sleep 4
    end

    def validarCampoCadastro(campoCarro,nomecampo)

        q = query("* text:'#{campoCarro}'")

        if q.empty?
            puts "Campo '#{nomecampo}' não encontrado"
        else
            puts "Campo '#{nomecampo}' cadastrado com sucesso!"
        end
        
        #puts "("* id:'#{modelo_field}' text:'#{carro.modelo}'")"
        #"* id:'#{field}' text:'#{campoCarro}'"
        #q = query("android.support.v7.widget.AppCompatEditText text:'#{carro.placa}'")
        #q =  query("*",:text)
        #q = query("* id: '#{modelo_field}' text:'#{campoCarro}'")

    end    

end


class ConsultarCadastroPage < Calabash::ABase

    def trait
        "* id:'placa'"
    end
    
    def verifica_elemento?
        element_exists(trait)
    end

    def field(field_text)
        "* text:'#{field_text}'"
    end

    def verifica_elementoPos?
        element_exists(field_pos)
    end

    def scrollDownEClica(carro)
        q = query("* text:'#{carro.placa}'")
        cont = 0
        while q.empty?
            break if cont == 15
            scroll_down
            q = query("* text:'#{carro.placa}'")
            cont = cont + 1
        end
        if not q.empty? 
            touch(("* text:'#{carro.placa}'")) 
        end
        sleep 2
    end

    def voltarPaginaInicial
        while verifica_elemento? == true
            press_back_button
            verifica_elemento?
        end
    end
    

end