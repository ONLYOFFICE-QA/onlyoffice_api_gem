# frozen_string_literal: true

require_relative 'lib/teamlab/name'
require_relative 'lib/teamlab/version'

Gem::Specification.new do |s|
  s.name = Teamlab::NAME
  s.version = Teamlab::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.5'
  s.authors = ['ONLYOFFICE', 'Pavel Lobashov', 'rzagudaev', 'DaftTrick']
  s.summary = 'Ruby gem for OnlyOffice. Formerly known as `teamlab`.'
  s.description = 'Ruby Framework to interact with OnlyOffice API 2.0'
  s.homepage = 'https://github.com/ONLYOFFICE/onlyoffice_api_gem'
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}",
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage,
    'rubygems_mfa_required' => 'true'
  }
  s.email = %w[rzagudaev@gmail.com shockwavenn@gmail.com nazarov90@gmail.com]
  s.files = Dir['lib/**/*']
  s.add_runtime_dependency('httparty', '~> 0.16')
  s.add_development_dependency('faker', '~> 2')
  s.add_development_dependency('overcommit', '~> 0')
  s.add_development_dependency('rake', '~> 13')
  s.add_development_dependency('rspec', '~> 3')
  s.add_development_dependency('rubocop', '>= 0.49.0')
  s.add_development_dependency('rubocop-performance', '~> 1')
  s.add_development_dependency('rubocop-rake', '~> 0')
  s.add_development_dependency('rubocop-rspec', '~> 2')
  s.add_development_dependency('simplecov-cobertura', '~> 1')
  s.add_development_dependency('yard', '>= 0.9.20')
  s.license = 'AGPL-3.0'
end
