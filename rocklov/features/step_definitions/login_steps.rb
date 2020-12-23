Dado('que acesso a página principal') do
    # visit "/" # passamos a usar a rota padrão no arquivo env.rb

    # Estou estanciando a classe LoginPage e guardando na variável login_page
    @login_page = LoginPage.new
    # Na classe LoginPage já programamos para entrar na página, agora basta chamar o método.
    @login_page.abrir_pagina
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
    # Quando atualizamos a versão do rocklov-web o dev corrigiu o erro de digitação no campo do placeholder que estava e-email
    # Então, atualizamos o campo e percebemos que se tivéssemos muitos arquivos o impacto para manutenção seria grande.
    # Como solução usamos o padrão Page Object no arquivo login_pages.rb
    # Como solução utilizamos o padrão page object 
    # find("input[placeholder='Seu email']").set email
    # find("input[type=password]").set password
    # click_button "Entrar"

    # Na classe LoginPage já programamos para encontrar o campo email, agora basta chamar o método e informar o valor que queremos.
    @login_page.campo_email.set email
    # Na classe LoginPage já programamos para encontrar o campo senha, agora basta chamar o método e informar o valor que queremos.
    @login_page.campo_senha.set password
    # Na classe LoginPage já programamos para clicar no botão, agora basta chamar o método.
    @login_page.botao_entrar
end

# O step Então está sendo usada no arquivo shared_steps.rb já que é o mesmo comportamento dos aquivos cadastro e login.