require "httparty"

class Sessions
    include HTTParty
    base_uri "http://rocklov-api:3333" # defini a url padrão

    def login(payload)
        return self.class.post( # self.class serve para termos acesso aos objetos da própria classe
            "/sessions", # Nessa linha eu já consigo fazer uma requisição do tipo post
            body: payload.to_json, # depois da url eu converto o corpo para o formato json quando vou enviar para a api
            headers: {
                "Content-Type": "application/json",
            },
        )
    end
end