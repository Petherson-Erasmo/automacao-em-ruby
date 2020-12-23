# Arquivo criado para entender melhor sobre herença

# Da forma que a classe Carro e Moto estão programadas elas ficam dificeis de se dar manutenão
# Então usamos a herança
# class Carro
#     attr_accessor :nome, :cor, :marca 
#     def initialize(nome,marca) 
#         @nome = nome
#         @marca = marca
#     end 
#     def ligar
#         puts "O #{@nome} está pronto para iniciar o trajeto." # função
#     end
#     def dirigir
#         puts "O #{@nome} está iniciando o trajeto."
#     end
#     def define_cor(cor)
#         @cor = cor
#     end
# end

# class Moto
#     attr_accessor :nome, :cor, :marca 
#     def initialize(nome, marca) 
#         @nome = nome
#         @marca = marca
#     end 
#     def ligar
#         puts "A #{@nome} está prontA para iniciar o trajeto." # função
#     end
#     def dirigir
#         puts "A #{@nome} está iniciando o trajeto."
#     end
#     def define_cor(cor)
#         @cor = cor
#     end
# end

# Essa classe tem os atributos que ambas as outras classes utilizam
class Veiculo
    attr_accessor :nome, :cor, :marca 
    
    def initialize(nome, marca)
        @nome = nome
        @marca = marca
    end

    def define_cor(cor)
        @cor = cor
    end
end

class Carro < Veiculo #agora está herdando as propriedades da classe veiculo
    def ligar 
        puts "O #{@nome} está pronto para iniciar o trajeto." # função
    end

    def dirigir
        puts "O #{@nome} está iniciando o trajeto."
    end
end

class Moto < Veiculo #agora está herdando as propriedades da classe veiculo
    def ligar
        puts "A #{@nome} está pronta para iniciar o trajeto." # função
    end

    def pilotar
        puts "A #{@nome} está iniciando o trajeto."
    end
end

chevette = Carro.new("Chevette", "GM") 
chevette.ligar
chevette.dirigir
chevette.define_cor("Bege")

fusca = Carro.new("Fusca", "VW") 
fusca.ligar
fusca.dirigir
fusca.define_cor("Azul")

cg = Moto.new("CG", "Honda")
cg.ligar
cg.pilotar
cg.define_cor("Verde")