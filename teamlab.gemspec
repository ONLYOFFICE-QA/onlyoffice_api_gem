# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'teamlab/version'

Gem::Specification.new do |spec|
  spec.name          = "teamlab"
  spec.version       = Teamlab::VERSION
  spec.authors       = ["rzagudaev"]
  spec.email         = ["roman-zagudaev@yandex.ru"]
  spec.description   = %q{Ruby Framework to interact with TeamLab API 2.0}
  spec.summary       = %q{Ruby gem for TeamLab}
  spec.homepage      = 'https://bitbucket.org/rzagudaev/gemteamlab/overview'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty',      '~> 0.11.0'
  spec.add_dependency 'activesupport', '~> 3.1'
  spec.add_dependency 'rspec'
  spec.add_dependency 'httmultiparty'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end