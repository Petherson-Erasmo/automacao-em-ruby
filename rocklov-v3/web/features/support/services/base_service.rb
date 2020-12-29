require "httparty"

class BaseService
    include HTTParty
    base_uri "http://rocklov-api:3333" # defini a url padrão
end