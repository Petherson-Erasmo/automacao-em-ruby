
def imprime_nome
    puts "Petherson"
end
# para usar o método eu preciso invoca-lo
imprime_nome


# O (oque tiver dentro do parenteses) significa um argumento
# logo quando eu coloco para imprimir (oque tiver aqui dentro) ele vai imprimir o valor que dermos para ele
def imprime_nome(argumento)
    puts argumento
end
# agora quando eu invocar o método, eu invoco o método e passo o valor como argumento EX: (argumento)
# OBS as aspas duplas é por causa do valor ser uma string
imprime_nome("petherson")


def soma(valor1, valor2)
    puts valor1 + valor2 
    # aqui já estou imprimindo o resultado
end
soma(2, 3)


# esse método não imprime nada na tela ele apenas devolve o resultado de uma operação
def pega_soma(valor1, valor2)
    resultado = valor1 + valor2
    return resultado
    # aqui eu não estou imprimindo o resultado
end
# ou posso usar o puts para imprimir
puts pega_soma(3, 4)

# No Ruby eu posso simplesmente passar o valor1 + valor2 eu não preciso ficar guardando em uma variável
# e ficar ocupando memória no meu computador 
def pega_soma2(valor1, valor2)
    valor1 + valor2
    # aqui ele já retorna o resultado não preciso usar o return
end
puts pega_soma2(10, 5)
