Dado('Login com {string} e {string}') do |email, password|
    @email = email 
    @login_page.open
    @login_page.with(email, password) # Padrão app action, esse método é responsável pelo login.
    expect(@dash_page.on_dash?).to be true # checkpoint para garantir que estamos no Dashboard
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

# @remover_anuncio
# Vamos usar a API para fazer o cadastro do anúncio, pois já temos um teste para validar o cadastro de anúncio
Dado('que eu tenho um anúncio indesejado:') do |table|
    # localStorage.getItem('user') é um comando JS, com ele conseguimos obter o id(sessão) do usuário
    user_id = page.execute_script("return localStorage.getItem('user')")

    # Precisamos informar o local do arquivo da imagem 
    thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:imagem]), "rb") # RB serve para salvar a imagem completo sem ele ficaria uma imagem vazia

    # Monto o payload
    @equipo = {
        thumbnail: thumbnail, 
        name: table.rows_hash[:nome], 
        category: table.rows_hash[:categoria], 
        price: table.rows_hash[:preco],
    }

    EquiposService.new.create(@equipo, user_id)

    # visit é para acessar uma página
    # current_path é a pasta atual
    visit current_path # recarrega a página
end
  
Quando('eu solicito a exclusão desse item') do
    # Fizemos o encapsulamento do ato de clicar no item de excluir anúncio
    @dash_page.request_removal(@equipo[:name])
end
  
Quando('confirmo a exclusão') do
    # Fizemos o encapsulamento do ato de confirmar a exclusão do item
    @dash_page.confirm_removal
end
  
Então('não devo ver esse item no meu Dashboard') do
    # Fizemos o encapsulamento do ato de verificar se o anúncio aparece na Dashboard
    expect(@dash_page.has_no_equipo?(@equipo[:name])).to be true
end

# @desistir_exclusão
Quando('não confirmo a solicitação') do
    # Fizemos o encapsulamento do ato de cancelar a exclusão do item
    @dash_page.cancel_removal
end

Então('esse anúncio deve permanecer no meu Dashboard') do
    # já tínhamos feito o encapsulamento do ato de verificar se o anúncio ainda aparece na Dashboard
    expect(@dash_page.equipment_list).to have_content @equipo[:nome]
end