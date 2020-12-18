

petherson = {nome: "Petherson", email: "pethersone@gmail.com", legal: true}
# para ter acesso ao dado "Petherson" ou "pethersone@gmail.com" eu preciso passar a chave nome ou a chave email
puts petherson[:nome]
puts petherson[:email]
puts petherson[:legal]

puts "Pula linha"

fernando = {nome: "Fernando", email: "fernando@gmail.com", legal: true}
puts fernando[:nome]
puts fernando[:email]
puts fernando[:legal]

puts "Pula linha"

# posso ter um Array de hashes igual mostra na linha de baixo
pessoas = [petherson, fernando]
puts pessoas[0]
puts pessoas[1]