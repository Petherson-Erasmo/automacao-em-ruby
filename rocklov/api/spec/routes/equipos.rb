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

    def remove_by_id(equipo_id, user_id) # como estamos encapsulando uma chamada delete, no nome do método trocamos o verbo para não dar erro
        return self.class.delete( # usamos o delete ao invés de post ou get
            "/equipos/#{equipo_id}",
            headers: {
                "user_id": user_id,
            },
        )
    end

    def list(user_id) 
        return self.class.get( # usamos o get ao invés de post
            "/equipos/",
            headers: {
                "user_id": user_id,
            },
        )
    end

    def booking(equipo_id, user_locator_id)
        return self.class.post( # método
            "/equipos/#{equipo_id}/bookings", # rota
            body: { date: Time.now.strftime("%d/%m/%Y")}.to_json, # monto o payload com a data atual como o formato dia/mes/ano(com 4 dígitos)
            headers: {
                "user_id": user_locator_id, # eu pego o user_id de quem está aludando
            },
        )
    end
end