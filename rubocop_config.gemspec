# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rubocop_config/version"

Gem::Specification.new do |spec|
  spec.name          = "rubocop_config"
  spec.version       = RubocopConfig::VERSION
  spec.authors       = ["npezza93"]
  spec.email         = ["npezza93@gmail.com"]

  spec.summary       = "Creates up to date .rubocop.yml file"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\)

  spec.executables   = ["rubocop-config"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop", "~> 0.49"
  spec.add_development_dependency "pry"
end
