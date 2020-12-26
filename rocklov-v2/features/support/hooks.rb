# Esse arquivo serve para executar comandos antes e/ou depois dos cenários.

# Com o before do vamos executar os comandos antes de uma determinada step
Before do
    # Estou estanciando a classe LoginPage e guardando na variável login_page
    @login_page = LoginPage.new
    # Estou estanciando a classe Alert do arquivo alert.rb
    @alert = Alert.new

    @signup_page = SignupPages.new

    @dash_page = DashPage.new

    @equipment_page = EquipmentPage.new
end