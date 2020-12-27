#language: pt

Funcionalidade: Cadastro de Anuúncios

    Sendo um usuário cadastrado no RockLov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizalos para locação

    # Não usamos Gherkin para especificar o comportamento de seguinte step
    Contexto: Login
        * Login com "heavymetal@gmail.com" e "pet123"

    Cenario: Novo equipamento

        # O step Dado que estou logado como "heavymetal@gmail.com" e "pet123" é uma pré-condição
        Dado que acesso o fomulário de cadastro de anúncio
            E que eu tenho o seguinte equipamento:
            # A tabela criada é uma tabela de chave valor, deferente da tabela utilizada no arquivo cadastro.feature.
            # É recomendado usar essa tabela quando se tenho apenas um único registro.
            | imagem    | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        # preco é a chave e 200 é o valor
        Quando submeto o cadastro desses itens
        Então devo ver esse item no meu Dashboard

    @tentativa_anuncio
    Esquema do Cenario: Tentativa de cadasdro de anúncios

        Dado que acesso o fomulário de cadastro de anúncio
            E que eu tenho o seguinte equipamento:
            | imagem    | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desses itens
        Então deve conter a mensagem de alerta: "<mensagem>"

        Exemplos:
            | foto          | nome              | categoria | preco | mensagem                             |
            |               | Violao de Nylon   | Cordas    | 150   | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |                   | Outros    | 250   | Informe a descrição do anúncio!      |
            | mic.jpg       | Microfone Shure   |           | 100   | Informe a categoria                  |
            | trompete.jpg  | Trompete Clássico | Outros    |       | Informe o valor da diária            |
            | conga.jpg     | Conga             | Outros    | abc   | O valor da diária deve ser numérico! |
            | conga.jpg     | Conga             | Outros    | 100a  | O valor da diária deve ser numérico! |