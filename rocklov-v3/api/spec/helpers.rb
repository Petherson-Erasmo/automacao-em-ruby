
module Helpers
    def get_fixtures(item)
        YAML.load(File.read(Dir.pwd + "/spec/fixtures/#{item}.yml"), symbolize_names: true)
    end

    module_function :get_fixtures # preciso passar esse comando para o método funcionar
end