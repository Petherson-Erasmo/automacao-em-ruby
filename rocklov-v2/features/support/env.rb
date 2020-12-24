require "capybara"
require "capybara/cucumber"
require "faker"

# Na próxima linha estou configurando o capybara
Capybara.configure do |config|
    # se eu deixar apenas com o :selenium vai ser utilizado o firefox
    config.default_driver = :selenium_chrome
    config.app_host = "http://rocklov-web:3000"
    config.default_max_wait_time = 10 # define o tempo máx que o capybara vai esperar por um elemento na tela
end