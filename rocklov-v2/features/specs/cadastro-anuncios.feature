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