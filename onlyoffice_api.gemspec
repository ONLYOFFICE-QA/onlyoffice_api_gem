# frozen_string_literal: true

require_relative 'lib/teamlab/name'
require_relative 'lib/teamlab/version'

Gem::Specification.new do |s|
  s.name = Teamlab::NAME
  s.version = Teamlab::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 3.0'
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
  s.add_dependency('httparty', '~> 0.16')
  s.license = 'AGPL-3.0'
end
