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

    def get_user(argumento_email) 
        usuario = @users_collection.find({email: argumento_email}).first
        return usuario[:_id] 
    end

    def remove_equipment (nome, user_id) # O user_id vem como uma string mas no banco precisamos do tipo ObjectID
        obj_id = BSON::ObjectId.from_string(user_id) # Aqui transformamos para um ObjectId

        @equipamento.delete_many({name: nome, user: obj_id}) 
    end

    def get_mongo_id # vai gerar um objectid aleatório
        return BSON::ObjectId.new
    end

end