Dado('que acesso a página principal') do
    # Estou estanciando a classe LoginPage e guardando na variável login_page
    @login_page = LoginPage.new
    # Na classe LoginPage já programamos para entrar na página, agora basta chamar o método.
    @login_page.open
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |email, password|
    # Quando atualizamos a versão do rocklov-web o dev corrigiu o erro de digitação no campo do placeholder que estava e-email
    # Então, atualizamos o campo e percebemos que se tivéssemos muitos arquivos o impacto para manutenção seria grande.
    # Como solução usamos o padrão Page Object no arquivo login_pages.rb
    # Como solução utilizamos o padrão page object 
    # find("input[placeholder='Seu email']").set email
    # find("input[type=password]").set password
    # click_button "Entrar"

    # Vamos passar a usar o padrão app actions que dá responsabilidades para os métodos, então os comandos da linha de baixo não servem.
    # # Na classe LoginPage já programamos para encontrar o campo email, agora basta chamar o método e informar o valor que queremos.
    # @login_page.campo_email.set email
    # # Na classe LoginPage já programamos para encontrar o campo senha, agora basta chamar o método e informar o valor que queremos.
    # @login_page.campo_senha.set password
    # # Na classe LoginPage já programamos para clicar no botão, agora basta chamar o método.
    # @login_page.botao_entrar

    @login_page.with(email, password) # Padrão app action, esse método é responsável pelo login.
end