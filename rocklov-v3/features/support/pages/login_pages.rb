# Usando o padrão Page Object + App Action
# Esse arquivo encapsula o login de usuário

class LoginPage
    # Normalmente essa classe não consegue ter acesso aos recursos do capybara, pois o cucumber não sabe que dentro da classe precisamos do capybara
    # Então passamos um comando para dar acesso a todos os recursos do capybara
    include Capybara::DSL

    def open
        visit "/"
    end

    # Agora damos uma responsabilidade para um método, ele vai ficar responsável por logar.
    # Isso facilita caso a página tenha vários campos e precisamos logar. Passamos a usar o padrão app actions.
    def with(email, password)
        find("input[placeholder='Seu email']").set email
        find("input[type=password]").set password
        click_button "Entrar"
    end

    # Agora passamos a usar o padrão App Actions junto com o Page Object 
    # def campo_email # Nesse método programamos para encontrar o campo email
    #     return find("input[placeholder='Seu email']")
    # end

    # def campo_senha # Nesse método programamos para encontrar o campo senha
    #     return find("input[type=password]")
    # end

    # def botao_entrar # Nesse método programamos para clicar no botão para entrar
    #     click_button "Entrar"
    # end
end