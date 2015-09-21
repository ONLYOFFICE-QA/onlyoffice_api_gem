# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'teamlab/version'

Gem::Specification.new do |spec|
  spec.name          = "teamlab"
  spec.version       = Teamlab::VERSION
  spec.authors       = ["rzagudaev", 'shockwavenn', 'DaftTrick']
  spec.email         = ["rzagudaev@gmail.com", 'shockwavenn@gmail.com', 'nazarov90@gmail.com']
  spec.description   = %q{Ruby Framework to interact with OnlyOffice\\TeamLab API 2.0}
  spec.summary       = %q{Ruby gem for OnlyOffice\\TeamLab}
  spec.homepage      = 'https://github.com/onlyoffice-testing-robot/GemTeamlab'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '~> 0'
  spec.add_dependency 'activesupport', '~> 0'
  spec.add_dependency 'rspec', '~> 0'
  spec.add_dependency 'httmultiparty', '~> 0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", '~> 0'
end