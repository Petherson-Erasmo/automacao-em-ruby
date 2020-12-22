#language: pt

Funcionalidade: Login

    Sendo um usuário cadastrado
    Quero acessar o sistema da RockLov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "petherson@hotmail.com" e "pet123"
        Então sou redirecionado para o Dashboard

    Esquema do Cenario: Tentar logar

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | email_input          | senha_input | mensagem_output                  |
            | pethersone@gmail.com | 1234pet     | Usuário e/ou senha inválidos.    |
            | pether@gmail.com     | pet123      | Usuário e/ou senha inválidos.    |
            | pethersone2mail.com  | pet123      | Oops. Informe um email válido!   |
            |                      | pet123      | Oops. Informe um email válido!   |
            | pethersone@gmail.com |             | Oops. Informe sua senha secreta! |


# Cenario: Senha incorreta

#     Dado que acesso a página principal
#     Quando submeto minhas credenciais com senha incorreta
#     Então vejo a mensagem de alerta: Usuário e/ou senha inválidos.

# Cenario: Email não cadastrado

#     Dado que acesso a página principal
#     Quando submeto minhas credenciais com email que não existe na Rocklov
#     Então vejo a mensagem de alerta: Usuário e/ou senha inválidos.

# Cenario: Email incorreto

#     Dado que acesso a página principal
#     Quando submeto minhas credenciais com email incorreto
#     Então vejo a mensagem de alerta: Oops. Informe um email válido!

# Cenario: Email não informado

#     Dado que acesso a página principal
#     Quando submeto minhas credenciais sem email
#     Então vejo a mensagem de alerta: Oops. Informe um email válido!

# Cenario: Senha não infomada

#     Dado que acesso a página principal
#     Quando submeto minhas credenciais sem senha
#     Então vejo a mensagem de alerta: Oops. Informe sua senha secreta!