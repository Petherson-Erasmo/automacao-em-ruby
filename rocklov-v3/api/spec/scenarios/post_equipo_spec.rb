describe "POST /equipos" do

    before(:all) do # Fazemos o login e obtemos o _id para passar no header
        payload = { email: "tom@te.com.br", password: "pet123"}
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end

    context "novo anuncio" do
        before(:all) do
   
            payload = { 
                thumbnail: Helpers::get_thumb("kramer.jpg"), 
                name: "Kramer Eddie Van Halen", 
                category: "Cordas", 
                price: 299,
            }

            # Passa o name do que eu quero remover e o user_id de quem eu quero remover
            MongoDB.new.remove_equipment(payload[:name], @user_id)

            @result = Equipos.new.create(payload, @user_id)
            # puts @result
        end

        it "deve retornar 200" do
            expect(@result.code).to eql 200
        end
    end

    context "nao autorizado" do
        before(:all) do        
            
            payload = { 
                thumbnail: Helpers::get_thumb("baixo.jpg"), 
                name: "Contra Baixo", 
                category: "Cordas", 
                price: 99,
            }
            
            # Para trabalharmos com dados nulos no Ruby usamos o nil
            @result = Equipos.new.create(payload, nil)
            # puts @result
        end

        it "deve retornar 401" do
            expect(@result.code).to eql 401
        end
    end
end