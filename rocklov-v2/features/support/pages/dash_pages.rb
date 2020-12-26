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
end