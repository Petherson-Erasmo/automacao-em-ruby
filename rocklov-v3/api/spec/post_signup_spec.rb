require_relative "routes/signup"
require_relative "libs/mongo"

describe "POST /signup" do
    context "novo usuario" do
        before(:all) do # sem o (:all) faz com que rode o gancho para cada it
            payload = { name: "Pitty", email: "pitty@gmail.com.br", password: "pet123" }
            MongoDB.new.remove_user(payload[:email])

            @result = Signup.new.create(payload)
        end
            
        it "valida status code" do
            # Guardo o resultado do método post dentro da variável result e valido ela
            expect(@result.code).to eql 200
        end

        it "valida id do usuário" do
            expect(@result.parsed_response["_id"].length).to eql 24 # Nessa linha validamos se a quantidade de caracteres é a mesma quantidade do id
        end
    end
end