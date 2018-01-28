require 'erb'
require 'yaml'

class YamlLoader
  def self.read_yaml(yaml_path)
    YAML::load(ERB.new(File.read(yaml_path)).result)
  end
end
