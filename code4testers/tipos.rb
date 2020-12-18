# Ruby trabalha com tipagem dinâmica, eu não preciso passar o tipo da variável
# basta apenas eu passar o valor da variável igual no exemplo da linha de baixo
# a variável nome recebeu um valor do tipo string
# a varável idade recebeu um valor do tipo inteiro e a variável legal recebeu um valor do tipo booleano

nome = "Petherson"
idade = 37
legal = true

# a tag PUTS serve para imprimir o valor que você deu no console.
puts nome
puts idade 
puts legal

# Para eu obter o tipo da variável eu preciso usar o método CLASS.
# OBS nesse casso esse class não quer dizer no sentido de uma class em orientação a objeto
puts nome.class
puts idade.class
puts legal.class