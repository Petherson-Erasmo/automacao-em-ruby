Dado('que estou logado como {string} e {string}') do |email, password| 
    visit "/"      
    find("input[placeholder='Seu e-email']").set email
    find("input[type=password]").set password

    click_button "Entrar"
end                                                                          
                                                                               
Dado('que acesso o fomulário de cadastro de anúncio') do
    # Esse step é uma pré-condição, logo precisamos garantir que foi para o formulário de anúncio
    click_button "Criar anúncio"
    # Então colocamos uma checkpoint
    expect(page).to have_css "#equipoForm"
end                                                                          

Dado('que eu tenho o seguinte equipamento:') do |table|
    # Como a tabela que está sendo utilizado é uma tabela de chave/valor precisamos usar um método diferente.
    # O método rows_hash converte a tabela chave/valor para um objeto do ruby, não vai virar um array.
    @anuncio = table.rows_hash
    # A variável anuncio está sendo alocada na memória só nesse step, mas como precisamos dela na step quando precisamos
    # converter ela para uma variável de instância (algo parecido como uma variável global). Usamos o @
end
  
Quando('submeto o cadastro desses itens') do
    # O código Dir.pwd é um recurso do ruby que faz com que conseguimos o diretório de execução do projeto
    # Em seguida passamos o caminho relativo e depois concateno com o nome do arquivo que vem da chave imagem
    img = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:imagem]

    # Apesar do elemento ser exibido no HTML ele está definido como display:none por isso o capybara não encontra
    # para resolver esse problema passamos o visible: false
    find("#thumbnail input[type=file]", visible: false).set img
    # o $ serve para buscar o valor que termina com o valor informado (no caso equipamento)
    # o * serve para buscar o valor que contém o valor informado (no caso equipamento)
    find("input[placeholder$=equipamento]").set @anuncio[:nome]
    # Buscamos pelo elemento que tem o ID category, em seguida buscamos pelo elemento option que contém o texto quem vem
    # da variável anúncio que passa a chave categoria
    # para selecionar usamos o select_option
    find("#category").find('option',text: @anuncio[:categoria]).select_option
    # o ^ serve para buscar o valor que começa com o valor informado (no caso Valor)
    find("input[placeholder^=Valor]").set @anuncio[:preco]

    click_button "Cadastrar"
    sleep 5
end
  
Então('devo ver esse item no meu Dashboard') do
    anuncios = find(".equipo-list")
    expect(anuncios).to have_content @anuncio[:nome]
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
    sleep 5
end