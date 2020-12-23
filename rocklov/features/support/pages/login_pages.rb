# Usando o padrão Page Object

class LoginPage
    # Normalmente essa classe não consegue ter acesso aos recursos do capybara, pois o cucumber não sabe que dentro da classe precisamos do capybara
    # Então passamos um comando para dar acesso a todos os recursos do capybara
    include Capybara::DSL

    def abrir_pagina
        visit "/"
    end

    def campo_email # Nesse método programamos para encontrar o campo email
        return find("input[placeholder='Seu email']")
    end

    def campo_senha # Nesse método programamos para encontrar o campo senha
        return find("input[type=password]")
    end

    def botao_entrar # Nesse método programamos para clicar no botão para entrar
        click_button "Entrar"
    end
end