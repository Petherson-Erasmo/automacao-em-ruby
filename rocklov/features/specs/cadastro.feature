#language: pt

Funcionalidade: Cadastro

    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

    @cadastro
    Cenario: Fazer cadastro

        Dado que acesso a página de cadastro
        # Quando submeto o meu cadastro completo
        # Refatorei o step Quando para usar o recurso do datatable
        # para colocar a massa de teste explicita no cenário sem perder a essência.
        Quando submeto o seguinte formulário de cadastro:
            | nome             | email                | senha  |
            | Petherson Erasmo | pethersone@gmail.com | pet123 |
        Então sou redirecionado para o Dashboard

    # Como o comportamento dos cenários estão sendo iguais o que está mudando é apenas os dados de entrada (Input) e os de saída (output)
    # Podemos usar o Scenário Outline ou Esquema do Cenário
    Esquema do Cenario: Tentativa de Cadastro
        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        # Na linha acima é referenciando o campo com a matriz
        Então vejo a mensagem de alerta: "<mensagem_output>"

        # A seguir tem um exemplo de uma matriz de exemplo
        # É referenciado a massa de teste (matriz) com a execução do cenário (Dado, Quando, Então)
        Exemplos:
            | nome_input       | email_input          | senha_input | mensagem_output                  |
            |                  | pethersone@gmail.com | pet123      | Oops. Informe seu nome completo! |
            | Petherson Erasmo |                      | pet123      | Oops. Informe um email válido!   |
            | Petherson Erasmo | pethersone2gmail.com | pet123      | Oops. Informe um email válido!   |
            | Petherson Erasmo | pethersone#gmail.com | pet123      | Oops. Informe um email válido!   |
            | Petherson Erasmo | pethersone@gmail.com |             | Oops. Informe sua senha secreta! |

# @sem_nome
# @tentativa_cadastro
# Cenario: Submeter cadastro sem o nome

#     Dado que acesso a página de cadastro
#     # Quando submeto o meu cadastro sem o nome
#     # O step comentado a cima foi substituído pelo step a baixo para deixar o código mais enxuto
#     Quando submeto o seguinte formulário de cadastro:
#     |nome            |email               |senha |
#     |                |pethersone@gmail.com|pet123|
#     # Antes a mensagem de alerta estava sem as aspas duplas, passando a mensagem em aspas duplas elas passam a ser um argumento.
#     Então vejo a mensagem de alerta: "Oops. Informe seu nome completo!"

# @sem_email
# @tentativa_cadastro
# Cenario: Submeter cadastro sem o email

#     Dado que acesso a página de cadastro
#     # Quando submeto o meu cadastro sem o email
#     # O step comentado a cima foi substituído pelo step a baixo para deixar o código mais enxuto
#     Quando submeto o seguinte formulário de cadastro:
#     |nome            |email               |senha |
#     |Petherson Erasmo|                    |pet123|
#     # Antes a mensagem de alerta estava sem as aspas duplas, passando a mensagem em aspas duplas elas passam a ser um argumento.
#     Então vejo a mensagem de alerta: "Oops. Informe um email válido!"

# @email_incorreto
# @tentativa_cadastro
# Cenario: Submeter cadastro com email incorreto

#     Dado que acesso a página de cadastro
#     # Quando submeto o meu cadastro com o email incorreto
#     # O step comentado a cima foi substituído pelo step a baixo para deixar o código mais enxuto
#     Quando submeto o seguinte formulário de cadastro:
#     |nome            |email               |senha |
#     |Petherson Erasmo|pethersone2gmail.com|pet123|
#     # Antes a mensagem de alerta estava sem as aspas duplas, passando a mensagem em aspas duplas elas passam a ser um argumento.
#     Então vejo a mensagem de alerta: "Oops. Informe um email válido!"

# @sem_senha
# @tentativa_cadastro
# Cenario: Submeter cadastro sem a senha

#     Dado que acesso a página de cadastro
#     # Quando submeto o meu cadastro sem a senha
#     # O step comentado a cima foi substituído pelo step a baixo para deixar o código mais enxuto
#     Quando submeto o seguinte formulário de cadastro:
#     |nome            |email               |senha |
#     |Petherson Erasmo|pethersone@gmail.com|      |
#     # Antes a mensagem de alerta estava sem as aspas duplas, passando a mensagem em aspas duplas elas passam a ser um argumento.
#     Então vejo a mensagem de alerta: "Oops. Informe sua senha secreta!"
