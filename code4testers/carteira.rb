puts "Qual o seu nome?"
nome = gets.chomp
# Esse gets serve para a entrada de dados
# o chomp serve para imprimir o dado que foi obtido no gets na mesma linha
puts "Qual a sua idade"
idade = gets.to_i
# O .to_i serve para converter o dado para um tipo Inteiro 

if (idade >= 18)
    # Na linha de baixo eu estou concatenando a string
    puts nome + ", você tem " + idade.to_s + " anos e portanto pode tirar carteira de motorista!!"
elsif (idade >= 7)
    #  Na linha de baixo eu estou fazendo uma interpolação de string
    puts "#{nome}, você tem #{idade} anos e portanto é melhor continuar andando de bicicleta."
else
    puts nome + ", você tem " + idade.to_s + " anos e sendo muito pequeno e só pode andar de motoquinha!!"
end
# o .to_s serve para converter o dado para um tipo String