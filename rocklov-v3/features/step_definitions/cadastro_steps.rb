Dado('que acesso a página de cadastro') do
    # O visit está encapsulado no arquivo signup_page.rb
    @signup_page.open 
end

Quando('submeto o seguinte formulário de cadastro:') do |table|
    # Aqui estou transformando a table do arquivo cadastro.feature em um objeto ruby para ter acesso nas informações
    # O table é o objeto que recebe da tabela do aquivo cadastro.feature

    # Depois o método hashes converte a user em um array
    # Converte a tabela do arquivo cadastro.feature em um array
    # o método .first é apena para obter o primeiro item do array
    user = table.hashes.first

    MongoDB.new.remove_user(user[:email])
    
    # Os comandos para cadastrar o usuário foram encapsulado no arquivo signup_page.rb
    # Chamamos a variável e invocamos o método register que recebe o objeto user (tudo em ruby vira um objeto)
    @signup_page.register(user)
end
