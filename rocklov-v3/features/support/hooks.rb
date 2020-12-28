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

# Com o After do vamos executar os comandos depois do step Então
After do
    temp_shot = page.save_screenshot("logs/temp_screenshot.png") # Dentro do argumento passamos o local de onde vamos salvar a imagem

    # Na seguinte linha de comando fazemos com que o screenshot seja anexado ao cenário que está sendo executado
    Allure.add_attachment(
        name: "Screenshot",
        type: Allure::ContentType::PNG,
        source: File.open(temp_shot)
    )
end