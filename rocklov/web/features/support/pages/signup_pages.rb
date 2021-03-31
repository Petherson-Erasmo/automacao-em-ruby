# Usando o padrão Page Object
# Esse arquivo vai encapsular o cadastro de usuário

class SignupPages
    include Capybara::DSL

    def open
        visit "/signup"
    end

    def register(variavel_user)
        find("#fullName").set variavel_user[:nome]
        find("#email").set variavel_user[:email]
        find("#password").set variavel_user[:senha]
        click_button "Cadastrar"
    end
end