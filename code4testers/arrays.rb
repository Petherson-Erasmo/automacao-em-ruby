

# A linha a baixo é uma variável do tipo array
bandas = ["AC/DC", "Queen", "Os Travessos", "System of Down "]

puts bandas[0]
puts bandas[1]
puts bandas[2]
puts bandas[3]

bandas.push("Bom Jovi")
# O push é um método que funciona para variáveis do tipo array para add novos elementos

puts bandas[4]

puts "A banda Queen foi deletada"
bandas.delete("Queen")
puts bandas

puts "Tem uma banda que não é Rock"
pagode = bandas.find {|item| item == 'Os Travessos'}
# eu posso fazer uma busca no esquema de contem, eu retiro o operador de comparar ==
# e uso o método de include EX: item.include?('Travessos')
puts pagode

pagode2 = bandas.find {|item| item.include?('Travessos')}
puts pagode2