
describe "GET / equipos/{equipo_id}" do

    before(:all) do # Fazemos o login e obtemos o _id para passar no header (serve para montar a sessão)
        payload = { email: "tom@te.com.br", password: "pet123"}
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end

    context "obter unico equipo" do
        before(:all) do
            # Dado que tenho um novo equipamento
            @payload = { 
                thumbnail: Helpers::get_thumb("sanfona.jpg"), 
                name: "Sanfona", 
                category: "Outros", 
                price: 319,
            }

            # Passa o name do que eu quero remover e o user_id de quem eu quero remover
            MongoDB.new.remove_equipment(@payload[:name], @user_id) # eu garanto que é um aúncio novo

            # E eu tenho o id desse equipamento
            equipo = Equipos.new.create(@payload, @user_id) # Crio um novo anúncio para não depender de outra massa
            @equipo_id = equipo.parsed_response["_id"]

            # Quando faço uma requisição get por id
            @result = Equipos.new.find_by_id(@equipo_id, @user_id)
        end
        
        it "deve retornar 200" do
            expect(@result.code).to eql 200
        end

        it "deve retornar o nome" do # valido se o nome passado vai vir no campo name
            expect(@result.parsed_response).to include("name" => @payload[:name])
        end
    end

    context "equipo nao existe" do
        before(:all) do
            @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id) # eu passo um id que não existe gerado pelo método get_mongo_id

        end

        it "deve retornar 404" do
            expect(@result.code).to eql 404
        end
    end
end

describe "GET /equipos" do
    before(:all) do # serve para montar a sessão
        payload = { email: "gandalf@gmail.com", password: "pet123"}
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end

    context "obter uma lista" do
        before(:all) do
            # Dado que eu tenho uma lista de equipos
            payloads = [
                { 
                    thumbnail: Helpers::get_thumb("sanfona.jpg"), 
                    name: "Sanfona", 
                    category: "Outros", 
                    price: 319,
                },
                { 
                    thumbnail: Helpers::get_thumb("trompete.jpg"), 
                    name: "Trompete", 
                    category: "Outros", 
                    price: 519,
                },
                { 
                    thumbnail: Helpers::get_thumb("slash.jpg"), 
                    name: "Les Paul do Slash", 
                    category: "Outros", 
                    price: 689,
                },
            ]

            payloads.each do |payload|
                MongoDB.new.remove_equipment(payload[:name], @user_id)
                Equipos.new.create(payload, @user_id)
            end

            # Quando faço uma requisição get para /equipos
            @result = Equipos.new.list(@user_id)
        end

        it "deve retornar 200" do
            expect(@result.code).to eql 200
        end

        it "deve retornar uma lista de equipos" do
            expect(@result.parsed_response).not_to be_empty # o not_to be_empty garante que a lista não está vazia
            # puts @result.parsed_response
            # puts @result.parsed_response.class
        end
    end
end