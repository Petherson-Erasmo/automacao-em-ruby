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