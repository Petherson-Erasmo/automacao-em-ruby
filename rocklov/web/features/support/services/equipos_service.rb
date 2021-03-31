require_relative "base_service"

class EquiposService < BaseService

    def create(equipo, user_id)
        payload = equipo

        return self.class.post( 
            "/equipos", 
            body: payload,
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
                "Content-Type": "application/json", # eu preciso informar qual o tipo de informação q estou enviando sem ele a data fica vazia 
                "user_id": user_locator_id, # eu pego o user_id de quem está aludando
            },
        )
    end
end
