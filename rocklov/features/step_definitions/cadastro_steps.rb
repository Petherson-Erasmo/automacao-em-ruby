Dado('que acesso a página de cadastro') do
    visit "http://rocklov-web:3000/signup"
end
  
# Esse step vai ser substituído pelo próximo step já que vou usar o datatable.
# Quando('submeto o meu cadastro completo') do

#     # Na linha a seguir estou encapsulando a função remove_user
#     MongoDB.new.remove_user("pethersone@gmail.com")

#     find("#fullName").set "Petherson Erasmo"
#     find("#email").set "pethersone@gmail.com" # Substituí o e-mail por esse comando da biblioteca Faker.
#     find("#password").set "pet123"
#     click_button "Cadastrar"
# end

Quando('submeto o seguinte formulário de cadastro:') do |table|
    # Aqui estou transformando a table do arquivo cadastro.feature em um objeto ruby para ter acesso nas informações
    # O table é o objeto que recebe da tabela do aquivo cadastro.feature

    # Depois o método hashes converte a variavel_user em um array
    # Converte a tabela do arquivo cadastro.feature em um array
    # o método .first é apena para obter o primeiro item do array
    variavel_user = table.hashes.first

    MongoDB.new.remove_user(variavel_user[:email])
    
    find("#fullName").set variavel_user[:nome]
    find("#email").set variavel_user[:email]
    find("#password").set variavel_user[:senha]
    click_button "Cadastrar"
end
  
Então('sou redirecionado para o Dashboard') do
    # O expect é um recurso de validação do rspec. O page é um objeto do capybara
    expect(page).to have_css ".dashboard"
end

# # sem_nome
# O seguinte step foi substituído pelo 1° step "Quando"
# Quando('submeto o meu cadastro sem o nome') do
#     find("#email").set Faker::Internet.free_email # Substituí o e-mail por esse comando da biblioteca Faker.
#     find("#password").set "pet123"
#     click_button "Cadastrar"
# end
  
# Com o novo step Então('vejo a mensagem de alerta: {string}') do |expect_alert| eu não preciso mais das próximas linhas
# Então('vejo a mensagem de alerta: Oops. Informe seu nome completo!') do
#     # A seguir faço duas validações uma com o texto e a outra se o texto está com o css correto.
#     alert = find(".alert-dark")
#     expect(alert.text).to eql "Oops. Informe seu nome completo!"
# end

# # sem_email
# O seguinte step foi substituído pelo 1° step "Quando"
# Quando('submeto o meu cadastro sem o email') do
#     find("#fullName").set "Petherson Erasmo"
#     find("#password").set "pet123"
#     click_button "Cadastrar"
# end
  
# Com o novo step Então('vejo a mensagem de alerta: {string}') do |expect_alert| eu não preciso mais das próximas linhas
# Então('vejo a mensagem de alerta: Oops. Informe um email válido!') do
#         # A seguir faço duas validações uma com o texto e a outra se o texto está com o css correto.
#         alert = find(".alert-dark")
#         expect(alert.text).to eql "Oops. Informe um email válido!"
# end

# # email_incorreto
# O seguinte step foi substituído pelo 1° step "Quando"
# # Como o step Então é igual ao step de sem_email eu preciso fazer a penas o quando 
# Quando('submeto o meu cadastro com o email incorreto') do
#     find("#fullName").set "Petherson Erasmo"
#     find("#email").set "email*incorreto,com"
#     find("#password").set "pet123"
#     click_button "Cadastrar"
# end

# # sem_senha
# O seguinte step foi substituído pelo 1° step "Quando"
# Quando('submeto o meu cadastro sem a senha') do
#     find("#fullName").set "Petherson Erasmo"
#     find("#email").set Faker::Internet.free_email # Substituí o e-mail por esse comando da biblioteca Faker.
#     click_button "Cadastrar"
# end

# Com o novo step Então('vejo a mensagem de alerta: {string}') do |expect_alert| eu não preciso mais das próximas linhas
# Então('vejo a mensagem de alerta: Oops. Informe sua senha secreta!') do
#     # A seguir faço duas validações uma com o texto e a outra se o texto está com o css correto.
#     alert = find(".alert-dark")
#     expect(alert.text).to eql "Oops. Informe sua senha secreta!"
# end

Então('vejo a mensagem de alerta: {string}') do |expect_alert| # O expect_alert é um argumento.
    alert = find(".alert-dark")
    expect(alert.text).to eql expect_alert
end