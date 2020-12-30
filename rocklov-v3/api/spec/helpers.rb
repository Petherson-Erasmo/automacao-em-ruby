
module Helpers
    def get_fixtures(item)
        YAML.load(File.read(Dir.pwd + "/spec/fixtures/#{item}.yml"), symbolize_names: true)
    end

    def get_thumb(file_name)
        # O argumento rb faz com que grave o conteúdo completo dentro da variável sem ele fica uma imagem vazia
        return File.open(File.join(Dir.pwd, "spec/fixtures/images", file_name), "rb")
    end

    module_function :get_fixtures # preciso passar esse comando para o método funcionar
    module_function :get_thumb
end