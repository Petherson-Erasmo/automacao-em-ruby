# Arquivo criado para entender melhor sobre Orientação a Objeto
# Uma classe é um objeto que tem características e funções
class Carro
    # as características de uma classe podem ser definidas dentro da programação em ruby através de uma propriedade que é chamada de attr_accessor
    attr_accessor :nome, :cor, :marca 
    
    def initialize(nome) # método construtor
        @nome = nome
    end # desta forma estamos forçando a criação do nome ao criar a classe

    # Como o método ligar não obriga a definição das propriedades/características 
    # e como elas estão comentadas a mensagem é exibida faltando o nome do carro
    # Para resolver esse problema podemos criar métodos construtores,
    # eles serão executados automaticamente 
    def ligar #método
        puts "O #{@nome} está pronto para iniciar o trajeto." # função
    end

end

# chevette = Carro.new #estamos guardando uma estância da classe Carro em uma variável
# chevette.nome = "Chevette" #característica
# chevette.cor = "Bege" #característica
# chevette.marca = "GM" #característica

chevette = Carro.new("Chevette") # com o método construtor somos obrigado a definir 
                                 # o nome do carro quando crio a classe
chevette.ligar #chamando a função ligar
# O .class é para mostrar o tipo do objeto
puts chevette.class # será exibido Carro que é o novo obejto que criamos


# # Como Carro é um objeto conseguimos criar outras estâncias desse objeto
# fusca = Carro.new
# fusca.nome = "Fusca"
# fusca.cor = "Azul"
# fusca.marca = "VW"

fusca = Carro.new("Fusca") # com o método construtor somos obrigado a definir 
                           # o nome do carro quando crio a classe
fusca.ligar