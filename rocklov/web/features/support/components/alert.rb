# Esse arquivo também faz parte do padrão page object.
# A página de login e de cadastro utiliza o mesmo css (alert_dark) que tem o mesmo comportamento

class Alert
    include Capybara::DSL # Estamos usando as funcionalidades do capybara

    def dark # chamado no arquivo shared_step.rb
        return find(".alert-dark").text
    end

end