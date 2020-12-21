require 'mongo'

# A próxima linha serve para gravar o log do mongo na pasta logs ao invés de gravar na saída do terminal
Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB

    def remove_user(argumento_email)
        
        # Na linha a seguir eu me conecto com o mongo e guardo os parâmetros na variável client
        client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        # Na próxima linha eu me conecto a uma coleção
        users_collection = client[:users]
        # Na próxima linha eu excluo o e-mail.
        users_collection.delete_many({email: argumento_email})
    end

end

