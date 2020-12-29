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
end