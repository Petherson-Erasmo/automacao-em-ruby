#language: pt

Funcionalidade: Remover Anúncios
    Sendo um anúnciante que possui um equipamento indesejado
    Quero poder remover esse anúncio
    Para que eu possa manter o meu Dashboard atualizado

    Contexto: Login
        * Login com "princes@diana.com" e "pet123"

    @remover_anuncio
    Cenario: Remover um anúncio

        Dado que eu tenho um anúncio indesejado:
            | imagem    | telecaster.jpg |
            | nome      | Telecaster     |
            | categoria | Cordas         |
            | preco     | 50             |
        Quando eu solicito a exclusão desse item
            E confirmo a exclusão
        Então não devo ver esse item no meu Dashboard

    @desistir_exclusão
    Cenario: Desistir da exclusão

        Dado que eu tenho um anúncio indesejado:
            | imagem    | conga.jpg |
            | nome      | Conga     |
            | categoria | Outros    |
            | preco     | 150       |
        Quando eu solicito a exclusão desse item
            Mas não confirmo a solicitação
        Então esse anúncio deve permanecer no meu Dashboard