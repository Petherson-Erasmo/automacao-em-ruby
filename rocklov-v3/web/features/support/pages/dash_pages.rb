# Usando o padrão Page Object
# Esse arquivo vai encapsular o cadastro de anúcios 

class DashPage
    include Capybara::DSL

    def on_dash?
        return page.has_css?(".dashboard")
    end

    def goto_equipment_form
        click_button "Criar anúncio"
    end

    def equipment_list
        return find(".equipo-list")
    end

    def request_removal(name)
        anuncio = find(".equipo-list li", text: name) # aqui buscamos a li que tem o nome que eu desejo
        anuncio.find(".delete-icon").click # aqui eu busco o elemento dentro da li especifica e mando excluir
    end

    def confirm_removal
        click_on "Sim"
    end

    def has_no_equipo?(name) # esse método retornar verdadeiro ou falso
         # Eu verifico se tem um elemento css na página e retorna verdadeiro ou falso
         return result = page.has_no_css?(".equipo-list li", text: name)
    end
end