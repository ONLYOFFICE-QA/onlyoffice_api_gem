# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'teamlab/version'

Gem::Specification.new do |spec|
  spec.name          = 'teamlab'
  spec.version       = Teamlab::VERSION
  spec.authors       = %w(rzagudaev shockwavenn DaftTrick)
  spec.email         = ['rzagudaev@gmail.com', 'shockwavenn@gmail.com', 'nazarov90@gmail.com']
  spec.description   = 'Ruby Framework to interact with OnlyOffice\\TeamLab API 2.0'
  spec.summary       = 'Ruby gem for OnlyOffice\\TeamLab'
  spec.homepage      = 'https://github.com/onlyoffice-testing-robot/GemTeamlab'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'httparty', '~> 0.13'
  spec.add_runtime_dependency 'activesupport', '~> 4'
  spec.add_runtime_dependency 'rspec', '~> 3.3'
  spec.add_runtime_dependency 'httmultiparty', '~> 0.3.16'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.1'
  spec.post_install_message = <<-MESSAGE
!    The 'teamlab' gem has been deprecated and has been replaced by 'onlyoffice_api'.
!    See: https://rubygems.org/gems/onlyoffice_api
!    And: https://github.com/onlyoffice/onlyoffice_api_gem
  MESSAGE
end
