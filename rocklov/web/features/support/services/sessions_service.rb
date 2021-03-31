require_relative "base_service"

class SessionsService < BaseService 

    # Esse método serve apenas para criarmos uma sessão e devolver o id do usuário que usamos com sessão
    def get_user_id(email, password)
        # Montamos o payload dentro desse método, pois, estamos consumindo a API
        payload = { email: email, password: password }
        result = self.class.post( # Guardo o retorno na variável result
            "/sessions", 
            body: payload.to_json, 
            headers: {
                "Content-Type": "application/json",
            },
        )
        
        # Retorno a variável result já com o campo _id no formato reconhecido pelo ruby
        return result.parsed_response["_id"]
    end
end