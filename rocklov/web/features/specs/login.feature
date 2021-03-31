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
