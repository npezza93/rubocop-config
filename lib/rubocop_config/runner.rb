# frozen_string_literal: true

require "erb"
require "yaml"

module RubocopConfig
  class Runner
    attr_accessor :pwd, :config_override_file

    def initialize(pwd, config_override_file = nil)
      @pwd = pwd
      @config_override_file = config_override_file
    end

    def perform
      file_name = "#{pwd}/.rubocop.yml"
      puts "Building .rubocop.yml file..."
      File.open(file_name, "w") { |f| f << config.to_yaml }
    end

    def config
      @config ||= YAML.safe_load(ERB.new(File.read(config_file)).result)
    end

    def config_file
      config_override_file ||
        (File.expand_path("../../config", __dir__) + "/default.yml")
    end
  end
end
