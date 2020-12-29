

describe " POST /equipos/{equipo_id}/bookings" do
    before(:all) do # Fazemos o login e obtemos o _id 
        payload = { email: "tonyst@rk.com", password: "pet123"}
        result = Sessions.new.login(payload)
        @tony_id = result.parsed_response["_id"]
    end

    context "soliciatar locacao" do 
        before(:all) do
        # Dado que "Peter Parker" tem uma "Fender Strato" para locação
            # Faço o login para obter o id da pessoa
            result = Sessions.new.login({ email: "peter@parker.com", password: "pet123"})
            peter_id = result.parsed_response["_id"]
            
            fender = { 
                thumbnail: Helpers::get_thumb("fender-sb.jpg"), 
                name: "Fender Strato", 
                category: "Cordas", 
                price: 150,
            }
            MongoDB.new.remove_equipment(fender[:name], peter_id) # garanto que não existe o anúncio cadastrado
            result = Equipos.new.create(fender, peter_id) # cadastro o anúncio
            anuncio_id = result.parsed_response["_id"] # obtenho o id do anúncio

            # Quando solicito a locação da Fender do Peter Parker
            @proposta = Equipos.new.booking(anuncio_id, @tony_id)
        end

        it "deve retornar 200" do
            expect(@proposta.code).to eql 200
        end
    end
end