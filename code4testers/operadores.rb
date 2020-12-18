# Operadores Matemáticos
def soma(n1, n2)
    puts n1 + n2
end
soma(3,5)

def subtrai(n1, n2)
    puts n1 - n2
end
subtrai(10, 8)

def divide (n1, n2)
    # normalmente o número está ficando como inteiro
    # então eu tenho que converter para o tipo float
    puts (n1.to_f / n2.to_f).round(4)
    # o método .round serve para arrendondar o resto do resultado se não iria dar 3,3333333333....
end
divide(10, 3)

# =====================================================
# operadores de comparação

def maior_que(v1, v2)
    puts v1 > v2
end
# Retorna true, porque 10 é maior que 5
maior_que(10,5)

# Retorna false, porque 5 não é maior que 10
maior_que(5, 10)

# Retorna false, porque 10 não é maior que 10 ele é igual
maior_que(10, 10)


def menor_que(v1, v2)
    puts v1 < v2
end
# Retorna true, porque 5 é menor que 20
menor_que(5, 20)


def maior_ou_igual_que(v1, v2)
    puts v1 >= v2
end
# Retorna true, porque 10 é igual a 10
maior_ou_igual_que(10, 10)

# Retorna true, porque 15 é maior que 10
maior_ou_igual_que(15, 10)


def menor_ou_igual_que(v1, v2)
    puts v1 <= v2
end
# Retorna true, porque 5 é igual a 5
menor_ou_igual_que(5, 5)

# Retorna true, porque 5 é menor que 10
menor_ou_igual_que(5, 10)

# Retorna false, porque 10 não é menor que 5
menor_ou_igual_que(10, 5)

def igual(v1, v2)
    puts v1 == v2
end
# Retorna true, porque 10 é igual a 10
igual(13, 13)

# Retorna false, porque mesmo os valores sendo 10, são de tipos diferente (inteiro) e o outro (string)
igual(10, "10")

# Retorna false, porque 10 é diferente de 9
igual(10, 9)

def diferente(v1, v2)
    puts v1 != v2
end
# Retorna true, porque 10(inteiro) é diferente de 10(string)
diferente(10, "10")

# Retorna false, porque ambos são iguais
diferente(10, 10)

# Retorna true, porque de fato são diferentes
diferente("4", "10")