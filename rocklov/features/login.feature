#language: pt

Funcionalidade: Login

    Sendo um usuário cadastrado
    Quero acessar o sistema da RockLov
    Para que eu possa anunciar meus equipamentos musicais

    @temp
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "pethersone@gmail.com" e "pet123"
        Então sou redirecionado para o Dashboard

    Cenario: Senha incorreta

        Dado que acesso a página principal
        Quando submeto minhas credenciais com senha incorreta
        Então vejo a mensagem de alerta: Usuário e/ou senha inválidos.

    Cenario: Email não cadastrado

        Dado que acesso a página principal
        Quando submeto minhas credenciais com email que não existe na Rocklov
        Então vejo a mensagem de alerta: Usuário e/ou senha inválidos.

    Cenario: Email incorreto

        Dado que acesso a página principal
        Quando submeto minhas credenciais com email incorreto
        Então vejo a mensagem de alerta: Oops. Informe um email válido!

    Cenario: Senha não infomada

        Dado que acesso a página principal
        Quando submeto minhas credenciais sem senha
        Então vejo a mensagem de alerta: Oops. Informe sua senha secreta!