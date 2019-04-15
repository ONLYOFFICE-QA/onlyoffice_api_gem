lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'teamlab/version'

Gem::Specification.new do |spec|
  spec.name          = 'onlyoffice_api'
  spec.version       = Teamlab::VERSION
  spec.authors       = %w[ONLYOFFICE rzagudaev shockwavenn DaftTrick]
  spec.email         = ['rzagudaev@gmail.com', 'shockwavenn@gmail.com', 'nazarov90@gmail.com']
  spec.description   = 'Ruby Framework to interact with OnlyOffice API 2.0'
  spec.summary       = 'Ruby gem for OnlyOffice. Formerly known as `teamlab`.'
  spec.homepage      = 'https://github.com/ONLYOFFICE/onlyoffice_api_gem'
  spec.license       = 'AGPL-3.0'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'httparty', '~> 0.16'
  spec.add_runtime_dependency 'rspec', '~> 3.3'
end
