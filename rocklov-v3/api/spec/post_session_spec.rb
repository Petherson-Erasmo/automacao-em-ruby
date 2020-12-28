require "httparty"

describe "POST /sessions" do
    context "login com sucesso" do
        before(:all) do # sem o (:all) faz com que rode o gancho para cada it
            payload = { email: "heavymetal@gmail.com", password: "pet123" }

            @result = HTTParty.post(
                "http://rocklov-api:3333/sessions", # Nessa linha eu já consigo fazer uma requisição do tipo post
                body: payload.to_json, # depois da url eu converto o corpo para o formato json quando vou enviar para a api
                headers: {
                    "Content-Type": "application/json",
                },
            )
        end
            
        it "valida status code" do
            # Guardo o resultado do método post dentro da variável result e valido ela
            expect(@result.code).to eql 200
        end

        it "valida id do usuário" do
            expect(@result.parsed_response["_id"].length).to eql 24 # Nessa linha validamos se a quantidade de caracteres é a mesma quantidade do id

            # puts result.class # Desta forma vai retornar o tipo response que é do HTTParty mas precisamos do tipo hash do ruby
            # puts result.parsed_response # Deste jeito transformamos em um hash
        end
    end 
end
