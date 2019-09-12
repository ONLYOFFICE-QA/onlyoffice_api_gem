# frozen_string_literal: true

require 'bundler'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks

desc 'Test All'
task :test do
  RSpec::Core::RakeTask.new(:spec)
  Rake::Task['spec'].execute
end
task default: [:test]
