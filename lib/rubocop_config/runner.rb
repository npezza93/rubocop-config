# frozen_string_literal: true
require "erb"
require "yaml"

module RubocopConfig
  class Runner
    attr_accessor :pwd

    def initialize(pwd)
      @pwd = pwd
    end

    def perform
      file_name = "#{pwd}/.rubocop.yml"

      File.open(file_name, "w") { |f| f << config.to_yaml }
    end

    def config
      # binding.pry
      @config ||= YAML.safe_load(ERB.new(File.read(
        File.expand_path("../../../config", __FILE__) + "/default.yml"
      )).result)
    end
  end
end
