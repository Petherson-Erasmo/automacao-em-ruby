# Usando o padrão Page Object
# Esse arquivo vai encapsular o checkpoint que criamos no arquivo cadastro_anuncios.rb e támbem o cadastro do anúncio

class EquipmentPage
    include Capybara::DSL

    def create(equipment) 
        page.has_css?("#equipoForm") 
        upload(equipment[:imagem]) if equipment[:imagem].length > 0

        find("input[placeholder$=equipamento]").set equipment[:nome]

        category_selector(equipment[:categoria]) if equipment[:categoria].length > 0

        find("input[placeholder^=Valor]").set equipment[:preco]

        click_button "Cadastrar"
    end

    def category_selector(category)
        
        find("#category").find('option',text: category).select_option
    end

    def upload(file_name)

        img = Dir.pwd + "/features/support/fixtures/images/" + file_name

        find("#thumbnail input[type=file]", visible: false).set img
    end
end