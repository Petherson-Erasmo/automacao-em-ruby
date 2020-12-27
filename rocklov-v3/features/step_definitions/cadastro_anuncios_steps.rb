Dado('Login com {string} e {string}') do |email, password|
    @email = email 
    @login_page.open
    @login_page.with(email, password) # Padrão app action, esse método é responsável pelo login.
end                                                                         
                                                                               
Dado('que acesso o fomulário de cadastro de anúncio') do
    @dash_page.goto_equipment_form
end                                                                          

Dado('que eu tenho o seguinte equipamento:') do |table|
    @anuncio = table.rows_hash
    MongoDB.new.remove_equipment(@anuncio[:nome], @email)
end
  
Quando('submeto o cadastro desses itens') do
    @equipment_page.create(@anuncio)
end
  
Então('devo ver esse item no meu Dashboard') do
    expect(@dash_page.equipment_list).to have_content @anuncio[:nome]
    expect(@dash_page.equipment_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

# @tentativa_anuncio
Então('deve conter a mensagem de alerta: {string}') do |expect_alert|
    expect(@alert.dark).to have_text expect_alert
end