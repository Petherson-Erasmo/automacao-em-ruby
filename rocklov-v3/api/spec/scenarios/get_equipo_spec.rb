
describe "GET / equipos/{equipo_id}" do

    before(:all) do # Fazemos o login e obtemos o _id para passar no header
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