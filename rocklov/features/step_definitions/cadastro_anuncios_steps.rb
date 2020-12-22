Dado('que eu tenho o seguinte equipamento:') do |table|
    # Como a tabela que está sendo utilizado é uma tabela de chave/valor precisamos usar um método diferente.
    # O método rows_hash converte a tabela chave/valor para um objeto do ruby, não vai virar um array.
    anuncio = table.rows_hash
end
  
Quando('submeto o cadastro desses itens') do
    # o $ serve para buscar o valor que termina com o valor informado (no caso equipamento)
    # o * serve para buscar o valor que contém o valor informado (no caso equipamento)
    find("input[placeholder$=equipamento]").set anuncio[:nome]
    # Buscamos pelo elemento que tem o ID category, em seguida buscamos pelo elemento option que contém o texto quem vem
    # da variável anúncio que passa a chave categoria
    # para selecionar usamos o select_option
    find("#category").find('option',text: anuncio[:categoria]).select_option
    # o ^ serve para buscar o valor que começa com o valor informado (no caso Valor)
    find("input[placeholder^=Valor]").set anuncio[:preco]

    click_button "Cadastrar"
end
  
Então('devo ver esse item no meu Dashboard') do
    pending # Write code here that turns the phrase above into concrete actions
end