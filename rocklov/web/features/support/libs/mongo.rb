require 'mongo'

# A próxima linha serve para gravar o log do mongo na pasta logs ao invés de gravar na saída do terminal
Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB

    # A seguir estou definindo 2 propriedades/características
    # Agora passamos a ter as coleções do mongo como propriedades da classe
    attr_accessor :client, :users_collection, :equipamento

    def initialize # método construtor
        # Na linha a seguir conectamos com o mongo e guardamos os parâmetros na variável client
        @client = Mongo::Client.new(CONFIG["mongo"])
        # Na próxima linha conectamos a uma coleção que queremos manipular (no caso users)
        @users_collection = client[:users]
        # Na próxima linha conectamos a uma coleção que queremos manipular (no caso equipos)
        @equipamento = client[:equipos]
    end

    def remove_user(argumento_email)
        
        # client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov') # passamos a usar no método construtor
        # users_collection = client[:users] # passamos a usar no método construtor
        # Na próxima linha excluimos o e-mail.
        @users_collection.delete_many({email: argumento_email})
    end

    def get_user(argumento_email) # Através do email conseguimos buscar e encontrar o Id da pessoa
        
        # client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov') # passamos a usar no método construtor
        # users_collection = client[:users] # passamos a usar no método construtor
        # Na próxima linha buscamos o usuário no banco de dados.
        usuario = @users_collection.find({email: argumento_email}).first
        # O método find sempre retorna uma lista de usuários, por isso precisamos do first se não retornará uma única posição
        return usuario[:_id] # O [:_id] traz apenas o id
    end

    def remove_equipment (nome, email) # Precisamos receber o email do dono do anúncio para obter o ID
        user_id = get_user(email)
        
        # client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov') # passamos a usar no método construtor
        # equipamento = client[:equipos] # passamos a usar no método construtor
        # Na próxima linha excluimos o e-mail.
        @equipamento.delete_many({name: nome, user: user_id}) # Passo o campo (user) da tabela e passo a variável
    end

    def insert_users(docs)
        @users_collection.insert_many(docs)
    end

    # Para usar a variável client do método initialize precisamos transformar ela em uma variável de instância
    def drop_danger()
        @client.database.drop
    end

end