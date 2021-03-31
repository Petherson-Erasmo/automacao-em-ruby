#encoding: utf-8

describe "DELETE / equipos/{equipo_id}" do

    before(:all) do # Fazemos o login e obtemos o _id para passar no header
        payload = { email: "tom@te.com.br", password: "pet123"}
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end

    context "obter unico equipo" do
        before(:all) do
            # Dado que tenho um novo equipamento
            @payload = { 
                thumbnail: Helpers::get_thumb("pedais.jpg"), 
                name: "Pedais do TOM Morello", 
                category: "Áudio e Tecnologia".force_encoding("ASCII-8BIT"), # como temos q usar acentuação precisamos informar que é utf-8 
                price: 189,
            }

            # Passa o name do que eu quero remover e o user_id de quem eu quero remover
            MongoDB.new.remove_equipment(@payload[:name], @user_id) # eu garanto que é um aúncio novo

            # E eu tenho o id desse equipamento
            equipo = Equipos.new.create(@payload, @user_id) # Crio um novo anúncio para não depender de outra massa
            @equipo_id = equipo.parsed_response["_id"]

            # Quando faço uma requisição delete por id
            @result = Equipos.new.remove_by_id(@equipo_id, @user_id)
        end
        
        it "deve retornar 204" do
            expect(@result.code).to eql 204
        end

    end

    context "equipo nao existe" do
        before(:all) do
            @result = Equipos.new.remove_by_id(MongoDB.new.get_mongo_id, @user_id) # eu passo um id que não existe gerado pelo método get_mongo_id

        end

        it "deve retornar 204" do
            expect(@result.code).to eql 204
        end
    end
end