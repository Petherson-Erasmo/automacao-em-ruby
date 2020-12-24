Dado('que acesso a página de cadastro') do
    visit "/signup" 
end

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
