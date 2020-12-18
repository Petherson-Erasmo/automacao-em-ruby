
# essa é a forma mais simples de trabalhar com laços de repetição

5.times do
    puts "Executando o times"
end



i = 1
10.times do
    puts "Execução numero #{i}"
    i = i + 1
end



bandas = ["Aerosmith", "Guns n Rose", "AC/DC", "System of Down"]
i = 0
# O método size é um método que funciona exatamente para Arrays 
# e ele vai dar a quantidade de itens que tem dentro do array
bandas.size.times do
    puts bandas[i]
    i = i + 1
    # neste jeito vai percorrer cada item dentro do array e listar eles
end
# No times para conseguir passar por todos os itens do array
# eu preciso fazer o I inicializar com 0 e depois ir somando até chegar na quantidade total
# Eu pego a quantidade de itens através do método size e faço o meu contador "I" para eu conseguir percorrer por todos os itens dentro do Array
puts "=======Pula linha======="


# O foreach é usado para quando queremos percorrer por elementos de um Array sem precisar de nos preocupar quantos são.
# ele vai percorrer automaticamente pelo array e cada vez que ele fizer uma rodada eu terei o nome de cada banda começando pelo índice 0
bandas.each do |banda|
    puts banda
end