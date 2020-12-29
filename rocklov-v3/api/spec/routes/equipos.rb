require_relative "base_api"

class Equipos < BaseApi # Herdando os recursos do arquivo base_api.rb

    def create(payload, user_id)
        return self.class.post( # self.class serve para termos acesso aos objetos da própria classe
            "/equipos", # Nessa linha eu já consigo fazer uma requisição do tipo post
            body: payload, # para o cadastro de anúncio não convertemos para json
            headers: {
                "user_id": user_id,
            },
        )
    end
end