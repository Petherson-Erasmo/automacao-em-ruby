#language: pt

Funcionalidade: Cadastro de Anuúncios

    Sendo um usuário cadastrado no RockLov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizalos para locação

    Cenario: Novo equipamento

        Dado que eu tenho o seguinte equipamento:
        # A tabela criada é uma tabela de chave valor, deferente da tabela utilizada no arquivo cadastro.feature.
        # É recomendado usar essa tabela quando se tenho apenas um único registro. 
            | imagem    | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
            # preco é a chave e 200 é o valor
        Quando submeto o cadastro desses itens
        Então devo ver esse item no meu Dashboard