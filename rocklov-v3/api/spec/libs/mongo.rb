require 'mongo'

# A próxima linha serve para gravar o log do mongo na pasta logs ao invés de gravar na saída do terminal
Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB

    # A seguir estou definindo 2 propriedades/características
    # Agora passamos a ter as coleções do mongo como propriedades da classe
    attr_accessor :users_collection, :equipamento

    def initialize # método construtor
        # Na linha a seguir conectamos com o mongo e guardamos os parâmetros na variável client
        client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
        # Na próxima linha conectamos a uma coleção que queremos manipular (no caso users)
        @users_collection = client[:users]
        # Na próxima linha conectamos a uma coleção que queremos manipular (no caso equipos)
        @equipamento = client[:equipos]
    end

    def remove_user(argumento_email)
        
        # Na próxima linha excluimos o e-mail.
        @users_collection.delete_many({email: argumento_email})
    end

    def get_user(argumento_email) # Através do email conseguimos buscar e encontrar o Id da pessoa

        # Na próxima linha buscamos o usuário no banco de dados.
        usuario = @users_collection.find({email: argumento_email}).first
        # O método find sempre retorna uma lista de usuários, por isso precisamos do first se não retornará uma única posição
        return usuario[:_id] # O [:_id] traz apenas o id
    end

    def remove_equipment (nome, email) # Precisamos receber o email do dono do anúncio para obter o ID
        user_id = get_user(email)
        # Na próxima linha excluimos o e-mail.
        @equipamento.delete_many({name: nome, user: user_id}) # Passo o campo (user) da tabela e passo a variável
    end

end