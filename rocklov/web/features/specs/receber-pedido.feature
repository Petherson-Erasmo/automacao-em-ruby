#language: pt

Funcionalidade: Remover Anúncios
    Sendo um anúnciante que possui um equipamentos cadastrados
    Desejo receber pedidos de locação
    Para que eu possa decidir se quero aprova-los ou rejeita-los

    @receber_pedido
    Cenario: Receber pedido
        Dado que meu perfil de anunciante é "homer@simpson.com" e "pet123"
            E que eu tenho o seguinte equipamento cadastrado:
            | imagem    | amp.jpg               |
            | nome      | Amplificador Marshall |
            | categoria | Outros                |
            | preco     | 500                   |
            E acesso o meu Dashboard
        Quando "bender@futurama.com" e "pet123" solicita a locação desse equipamento
        Então devo ver a seguinte mensagem:
            # Uso Doc strings quando usamos um texto muito grande para validar
            """
            bender@futurama.com deseja alugar o equipamento: Amplificador Marshall em: DATA_ATUAL
            """
            E devo ver os links: "ACEITAR" e "REJEITAR" no pedido