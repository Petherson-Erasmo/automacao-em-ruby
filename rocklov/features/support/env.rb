require "capybara"
require "capybara/cucumber"
require "faker"

# Na próxima linha estou configurando o capybara
Capybara.configure do |config|
    # se eu deixar apenas com o :selenium vai ser utilizado o firefox
    config.default_driver = :selenium_chrome
end