# frozen_string_literal: true
module RubocopConfig
  class Runner
    attr_accessor :pwd

    def initialize(pwd)
      @pwd = pwd
    end

    def perform
      file_name = "#{pwd}/.rubocop.yml"

      File.open(file_name, "w") { |f| f << config }
    end

    def config
      # binding.pry
      @config ||= File.read(
        File.expand_path("../../../config", __FILE__) + "/default.yml"
      )
    end
  end
end
