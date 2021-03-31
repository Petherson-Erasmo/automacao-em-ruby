require "allure-cucumber" # Importamos a gem/biblioteca do allure
require "capybara"
require "capybara/cucumber"
require "faker"

# Na seguinte linha de comando programamos para carregar um arquivo específico
CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}")) # É uma constante

case ENV["BROWSER"]
    when "firefox"
        @driver = :selenium
    when "fire_headless"
        @driver = :selenium_headless
    when "chrome"
        @driver = :selenium_chrome
    when "chrome_headless"

        Capybara.register_driver :selenium_chrome_headless do |app|
            Capybara::Selenium::Driver.load_selenium
            browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
              opts.args << '--headless'
              opts.args << '--disable-gpu'
              opts.args << '--disable-site-isolation-trials'
              opts.args << '--no-sandbox'
              opts.args << '--disable-dev-shm-usage'
            end
            Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
          end

        @driver = :selenium_chrome_headless
    else
    # O raise não tentar executar os teste ele vai mostrar logo a mensagem
        raise "Variável @drive não definida, por favor defina qual navegador vai ser utilizado no arquivo cucumber.yml"
end

# Na próxima linha estou configurando o capybara
Capybara.configure do |config|
    # Se eu deixar apenas com o :selenium vai ser utilizado o firefox
    config.default_driver = @driver
    config.app_host = CONFIG["url"] # passamos a url no arquivo local.yml
    config.default_max_wait_time = 10 # define o tempo máx que o capybara vai esperar por um elemento na tela
end

# Na próxima linha estou configurando o Allure
AllureCucumber.configure do |config|
    config.results_directory = "/logs" # Vou salvar os arquivos na pasta logs
    config.clean_results_directory = true # Esse comando vai limpar a pasta log e gravar novos relatórios 
end