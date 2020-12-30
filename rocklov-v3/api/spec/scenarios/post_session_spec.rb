

describe "POST /sessions" do
    context "login com sucesso" do
        before(:all) do # sem o (:all) faz com que rode o gancho para cada it
            payload = { email: "erasmo@gmail.com", password: "pet123" }
            @result = Sessions.new.login(payload)
        end
            
        it "valida status code" do
            # Guardo o resultado do método post dentro da variável result e valido ela
            expect(@result.code).to eql 412
        end

        it "valida id do usuário" do
            expect(@result.parsed_response["_id"].length).to eql 24 # Nessa linha validamos se a quantidade de caracteres é a mesma quantidade do id

            # puts result.class # Desta forma vai retornar o tipo response que é do HTTParty mas precisamos do tipo hash do ruby
            # puts result.parsed_response # Deste jeito transformamos em um hash
        end
    end
    
    # examples = [
    #     {
    #         title: "senha incorreta",
    #         payload: { email: "heavymetal@gmail.com", password: "123456" },
    #         code: 401,
    #         error: "Unauthorized",
    #     },
    #     {
    #         title: "email incorreto",
    #         payload: { email: "naocadastrado@gmail.com", password: "123456" },
    #         code: 401,
    #         error: "Unauthorized",
    #     },
    #     {
    #         title: "email em branco",
    #         payload: { email: "", password: "123456" },
    #         code: 412,
    #         error: "required email",
    #     },
    #     {
    #         title: "sem o campo email",
    #         payload: { password: "123456" },
    #         code: 412,
    #         error: "required email",
    #     },
    #     {
    #         title: "senha em branco",
    #         payload: { email: "heavymetal@gmail.com", password: "" },
    #         code: 412,
    #         error: "required password",
    #     },
    #     {
    #         title: "sem campo senha",
    #         payload: { email: "heavymetal@gmail.com" },
    #         code: 412,
    #         error: "required password",
    #     },
    # ]

# A próxima linha de código serve para utilizarmos a massa de teste a partir de um arquivo separado
    # examples = YAML.load(File.read(Dir.pwd + "/spec/fixtures/login.yml"), symbolize_names: true)

    examples = Helpers::get_fixtures("login") # encapsulamos o método para utilizar o arquivo com a massa de teste

    examples.each do |ex|
        context "#{ex[:title]}" do
            before(:all) do # sem o (:all) faz com que rode o gancho para cada it
                @result = Sessions.new.login(ex[:payload])
            end
                
            it "valida status code #{ex[:code]}" do
                # Guardo o resultado do método post dentro da variável result e valido ela
                expect(@result.code).to eql ex[:code]
            end
    
            it "valida id do usuário" do
                expect(@result.parsed_response["error"]).to eql ex[:error] # Nessa linha validamos se a quantidade de caracteres é a mesma quantidade do id
    
                # puts result.class # Desta forma vai retornar o tipo response que é do HTTParty mas precisamos do tipo hash do ruby
                # puts result.parsed_response # Deste jeito transformamos em um hash
            end
        end
    end
     
end
