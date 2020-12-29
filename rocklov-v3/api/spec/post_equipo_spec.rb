describe "POST /equipos" do

    before(:all) do
        payload = { email: "tom@te.com.br", password: "pet123"}
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end

    context "novo anuncio" do
        before(:all) do
            thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "kramer.jpg"))
            
            payload = { 
                thumbnail: thumbnail, 
                name: "Kramer Eddie Van Halen", 
                category: "Cordas", 
                price: 299,
            }

            @result = Equipos.new.create(payload, @user_id)
            puts @result
        end

        it "deve retornar 200" do
            expect(@result.code).to eql 200
        end
    end
end