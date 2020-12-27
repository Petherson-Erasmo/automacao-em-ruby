# Esse arquivo serve para executar comandos antes e/ou depois dos cenários.

# Com o before do vamos executar os comandos antes de uma determinada step
Before do
    @login_page = LoginPage.new
    @alert = Alert.new
    @signup_page = SignupPages.new
    @dash_page = DashPage.new
    @equipment_page = EquipmentPage.new

    # page.driver.browser.manage.window.maximize # essa linha faz com que maximize a tela do browser
    page.current_window.resize_to(1440, 900)
end