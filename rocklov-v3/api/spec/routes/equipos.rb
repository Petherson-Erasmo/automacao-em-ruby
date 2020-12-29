require_relative "base_api"

class Equipos < BaseApi # Herdando os recursos do arquivo base_api.rb

    def create(payload, user_id)
        return self.class.post( # self.class serve para termos acesso aos objetos da própria classe
            "/equipos", # Nessa linha eu já consigo fazer uma requisição do tipo post
            body: payload, # para o cadastro de anúncio não convertemos para json
            # Usamos o user_id no cabeçalho da requisição que é um campo obrigatório
            headers: {
                "user_id": user_id,
            },
        )
    end

    def find_by_id(equipo_id, user_id) # como estamos encapsulando uma chamada get, no nome do método trocamos o verbo para não dar erro
        return self.class.get( # usamos o get ao invés de post
            "/equipos/#{equipo_id}",
            headers: {
                "user_id": user_id,
            },
        )
    end
end