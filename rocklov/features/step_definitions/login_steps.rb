Dado('que acesso a página principal') do
    visit "/" # passamos a usar a rota padrão no arquivo env.rb
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
    find("input[placeholder='Seu e-email']").set email
    find("input[type=password]").set password

    click_button "Entrar"
end

# O step Então está sendo usada no arquivo shared_steps.rb já que é o mesmo comportamento dos aquivos cadastro e login.