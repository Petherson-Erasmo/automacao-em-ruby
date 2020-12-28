require "allure-cucumber" # Importamos a gem/biblioteca do allure
require "capybara"
require "capybara/cucumber"
require "faker"

# Na seguinte linha de comando programamos para carregar um arquivo específico
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))

# Na próxima linha estou configurando o capybara
Capybara.configure do |config|
    # se eu deixar apenas com o :selenium vai ser utilizado o firefox
    config.default_driver = :selenium_chrome
    config.app_host = CONFIG["url"] # passamos a url no arquivo local.yml
    config.default_max_wait_time = 10 # define o tempo máx que o capybara vai esperar por um elemento na tela
end

# Na próxima linha estou configurando o Allure
AllureCucumber.configure do |config|
    config.results_directory = "/logs" # Vou salvar os arquivos na pasta logs
    config.clean_results_directory = true # Esse comando vai limpar a pasta log e gravar novos relatórios 
end