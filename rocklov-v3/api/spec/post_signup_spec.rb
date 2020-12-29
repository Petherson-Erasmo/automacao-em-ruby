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

    context "usuario ja existe" do
        before(:all) do
            # Dado que eu tenho um novo usuário
            payload = { name: "Camila Erasmo", email: "camila@hotmail.com", password: "pet123" }
            MongoDB.new.remove_user(payload[:email])

            # e o email desse usuário já foi cadastrado no sistema
            Signup.new.create(payload)

            # Quando faço uma requisição para a rota /signup
            @result = Signup.new.create(payload)
        end

        it "deve retornar 409" do
            # Então deve retornar 409
            expect(@result.code).to eql 409
        end
        
        it "deve retornar mensagem" do
            expect(@result.parsed_response["error"]).to eql "Email already exists :(" # Nessa linha validamos se a quantidade de caracteres é a mesma quantidade do id
        end
    end

    examples = [
        {
            title: "nome em branco",
            payload: { name: "", email: "teste@teste.com", password: "pet123" },
            code: 412,
            error: "required name",
        },
        {
            title: "sem campo nome",
            payload: { email: "teste@teste.com", password: "pet123" },
            code: 412,
            error: "required name",
        },
        {
            title: "email em branco",
            payload: { name: "Teste da Silva", email: "", password: "pet123" },
            code: 412,
            error: "required email",
        },
        {
            title: "sem o campo email",
            payload: { name: "Teste da Silva", password: "pet123" },
            code: 412,
            error: "required email",
        },
        {
            title: "senha em branco",
            payload: { name: "Teste da Silva", email: "teste@teste.com", password: "" },
            code: 412,
            error: "required password",
        },
        {
            title: "sem campo senha",
            payload: { name: "Teste da Silva", email: "teste@teste.com" },
            code: 412,
            error: "required password",
        }
    ]

    examples.each do |ex|
        context "#{ex[:title]}" do
            before(:all) do # sem o (:all) faz com que rode o gancho para cada it
                @result = Signup.new.create(ex[:payload])
            end
                
            it "valida status code #{ex[:code]}" do
                # Guardo o resultado do método post dentro da variável result e valido ela
                expect(@result.code).to eql ex[:code]
            end
    
            it "valida id do usuário" do
                expect(@result.parsed_response["error"]).to eql ex[:error] # Nessa linha validamos se a quantidade de caracteres é a mesma quantidade do id
            end
        end
    end
end