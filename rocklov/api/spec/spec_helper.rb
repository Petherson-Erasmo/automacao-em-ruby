require_relative "routes/equipos"
require_relative "routes/sessions"
require_relative "routes/signup"
require_relative "libs/mongo"
require_relative "helpers"
require "digest/md5" # O mongo criptografa a senha com o tipo md5 com essa biblioteca conseguimos criptografar a string da senha 

def to_md5(pass) # recebo a senha no formato string
  return Digest::MD5.hexdigest(pass) # e retorna no formato md5
end

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do # vai ser executado uma única vez para todos os cenários
    # Criamos uma semente com todos os usuários necessários para os testes
    users = [
      { nome: "Erasmo Carlos", email: "erasmo@gmail.com", password: to_md5("pet123")},
      { nome: "Tomate", email: "tom@te.com.br", password: to_md5("pet123")},
      { nome: "Gandalf", email: "gandalf@gmail.com", password: to_md5("pet123")},
      { nome: "Tony Stark", email: "tonyst@rk.com", password: to_md5("pet123")},
      { nome: "Peter Parker", email: "peter@parker.com", password: to_md5("pet123")},
    ]
    
    MongoDB.new.drop_danger # apaga os dados do banco
    MongoDB.new.insert_users(users) # insere todos os usuários
  end

end
