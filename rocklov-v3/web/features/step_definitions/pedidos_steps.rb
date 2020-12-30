Dado('que meu perfil de anunciante é {string} e {string}') do |email, password| # Serve para apenas definir os dados do anunciante
    @email_anunciante = email
    @pass_anunciante = password
end
  
Dado('que eu tenho o seguinte equipamento cadastrado:') do |table| # Cadastro o anuncio do Usuário
    # Até esse ponto ainda não estamos logado
    # O método get_user_id retornar a sessão do usuário
    user_id = SessionsService.new.get_user_id(@email_anunciante, @pass_anunciante)

    # Precisamos informar o local do arquivo da imagem 
    thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:imagem]), "rb") # RB serve para salvar a imagem completo sem ele ficaria uma imagem vazia

    # Monto o payload
    @equipo = {
        thumbnail: thumbnail, 
        name: table.rows_hash[:nome], 
        category: table.rows_hash[:categoria], 
        price: table.rows_hash[:preco],
    }

    # Eu passo o nome do equipamento e o email da pessoa
    MongoDB.new.remove_equipment(@equipo[:name], @email_anunciante)

    # Quando eu cadastro o novo anúnco pela API ela retorna o id do anúncio
    result = EquiposService.new.create(@equipo, user_id)
    @equipo_id = result.parsed_response["_id"] # guardo o _id do anúncio na váriavel @equipo_id
    log @equipo_id
end
  
Dado('acesso o meu Dashboard') do
    # Utilizamos o encapsulamento do arquivo login_pages.rb
    @login_page.open
    @login_page.with(@email_anunciante, @pass_anunciante) 
    expect(@dash_page.on_dash?).to be true # checkpoint para garantir que estamos no Dashboard
    
end
  
Quando('{string} e {string} solicita a locação desse equipamento') do |email_locatario, password_locatario|
    user_id_locatario = SessionsService.new.get_user_id(email_locatario, password_locatario)
    EquiposService.new.booking(@equipo_id, user_id_locatario)
end
  
Então('devo ver a seguinte mensagem:') do |doc_string|

    # gsub é um recurso do ruby para fazer sub-string, no caso vai substituir o texto DATA_ATUAL pela data que vai ser gerada
    expect_message = doc_string.gsub("DATA_ATUAL", Time.now.strftime("%d/%m/%Y"))
    
    # Já encapsulamos a função que obtêm a mensagem no arquivo dash_pages.rb
    expect(@dash_page.order).to have_text expect_message
end
  
Então('devo ver os links: {string} e {string} no pedido') do |button_accept, button_reject|
    # expect(page).to have_selector ".notifications button", text: button_accept
    # expect(page).to have_selector ".notifications button", text: button_reject

    expect(@dash_page.order_actions(button_accept)).to be true
    expect(@dash_page.order_actions(button_reject)).to be true
end