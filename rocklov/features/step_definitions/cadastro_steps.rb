Dado('que acesso a página de cadastro') do
    visit "http://rocklov-web:3000/signup"
end
  
Quando('submeto o meu cadastro completo') do
    find("#fullName").set "Petherson Erasmo"
    find("#email").set Faker::Internet.free_email # Substituí o e-mail por esse comando da biblioteca Faker.
    find("#password").set "pet123"
    click_button "Cadastrar"
end
  
Então('sou redirecionado para o Dashboard') do
    # O expect é um recurso de validação do rspec. O page é um objeto do capybara
    expect(page).to have_css ".dashboard"
end

# sem_nome
Quando('submeto o meu cadastro sem o nome') do
    find("#email").set Faker::Internet.free_email # Substituí o e-mail por esse comando da biblioteca Faker.
    find("#password").set "pet123"
    click_button "Cadastrar"
end
  
Então('vejo a mensagem de alerta: Oops. Informe seu nome completo!') do
    # A seguir faço duas validações uma com o texto e a outra se o texto está com o css correto.
    alert = find(".alert-dark")
    expect(alert.text).to eql "Oops. Informe seu nome completo!"
end

# sem_email
Quando('submeto o meu cadastro sem o email') do
    find("#fullName").set "Petherson Erasmo"
    find("#password").set "pet123"
    click_button "Cadastrar"
end
  
Então('vejo a mensagem de alerta: Oops. Informe um email válido!') do
        # A seguir faço duas validações uma com o texto e a outra se o texto está com o css correto.
        alert = find(".alert-dark")
        expect(alert.text).to eql "Oops. Informe um email válido!"
end

# email_incorreto 
# Como o step Então é igual ao step de sem_email eu preciso fazer a penas o quando 
Quando('submeto o meu cadastro com o email incorreto') do
    find("#fullName").set "Petherson Erasmo"
    find("#email").set "email*incorreto,com"
    find("#password").set "pet123"
    click_button "Cadastrar"
end

# sem_senha
Quando('submeto o meu cadastro sem a senha') do
    find("#fullName").set "Petherson Erasmo"
    find("#email").set Faker::Internet.free_email # Substituí o e-mail por esse comando da biblioteca Faker.
    click_button "Cadastrar"
end
  
Então('vejo a mensagem de alerta: Oops. Informe sua senha secreta!') do
    # A seguir faço duas validações uma com o texto e a outra se o texto está com o css correto.
    alert = find(".alert-dark")
    expect(alert.text).to eql "Oops. Informe sua senha secreta!"
end