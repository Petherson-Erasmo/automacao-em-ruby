# Usando o padrão Page Object
# Esse arquivo vai encapsular o checkpoint que criamos no arquivo cadastro_anuncios.rb e támbem o cadastro do anúncio

class EquipmentPage
    include Capybara::DSL

    def create(equipment) # Esse argumento recebe as informçaões da váriável @anuncio do arquivo cadastro_anuncio.rb
        # Não é certo utilizar o expect dentro dessa class ex: "expect(page).to have_css "#equipoForm""
        page.has_css?("#equipoForm") # Sempre que tiver um método com uma ? significa que ele retornar verdadeiro ou falso
        # Deixamos de fazer uma validação com o expect e validamos com o timeout do capybara (esperamos o elemento até ele aparecer)
    
        # O código Dir.pwd é um recurso do ruby que faz com que conseguimos o diretório de execução do projeto
        # Em seguida passamos o caminho relativo e depois concateno com o nome do arquivo que vem da chave imagem
        img = Dir.pwd + "/features/support/fixtures/images/" + equipment[:imagem]

        # Apesar do elemento ser exibido no HTML ele está definido como display:none por isso o capybara não encontra
        # para resolver esse problema passamos o visible: false
        find("#thumbnail input[type=file]", visible: false).set img

        # o $ serve para buscar o valor que termina com o valor informado (no caso equipamento)
        # o * serve para buscar o valor que contém o valor informado (no caso equipamento)
        find("input[placeholder$=equipamento]").set equipment[:nome]

        # Buscamos pelo elemento que tem o ID category, em seguida buscamos pelo elemento option que contém o texto quem vem
        # da variável anúncio que passa a chave categoria
        # para selecionar usamos o select_option
        find("#category").find('option',text: equipment[:categoria]).select_option

        # o ^ serve para buscar o valor que começa com o valor informado (no caso Valor)
        find("input[placeholder^=Valor]").set equipment[:preco]

        click_button "Cadastrar"
    end

end