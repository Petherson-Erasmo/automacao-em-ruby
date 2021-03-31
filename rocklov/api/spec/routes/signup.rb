require_relative "base_api"

class Signup < BaseApi # Herdando os recursos do arquivo base_api.rb

    def create(payload)
        return self.class.post( # self.class serve para termos acesso aos objetos da própria classe
            "/signup", # Nessa linha eu já consigo fazer uma requisição do tipo post
            body: payload.to_json, # depois da url eu converto o corpo para o formato json quando vou enviar para a api
            headers: {
                "Content-Type": "application/json",
            },
        )
    end
end