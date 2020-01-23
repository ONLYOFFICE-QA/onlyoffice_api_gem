# frozen_string_literal: true

if ENV['CI'] == 'true'
  require 'simplecov'
  SimpleCov.start
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'faker'
require 'rspec'
require 'onlyoffice_api'
require_relative 'spec_helper/portal_cleanup'
require_relative 'spec_helper/request_helper'
require_relative 'support/http_data'

def configure_test_portal
  Teamlab.configure do |config|
    config.server = ENV['ONLYOFFICE_API_GEM_TEST_PORTAL']
    config.username = ENV['ONLYOFFICE_API_GEM_TEST_USER']
    config.password = ENV['ONLYOFFICE_API_GEM_TEST_PASSWORD']
  end

  reset_portal
end

RSpec.configure do |c|
  c.include PortalCleanup
  c.before(:all) do
    @data_collector = {}
    configure_test_portal
  end
end

shared_examples_for 'an api request' do |*flags|
  before { pending } if flags.include?(:pending)
  before { skip } if flags.include?(:skip)
  before do
    if RequestHelper.current_responce.nil?
      @module = Teamlab.send(teamlab_module)
      puts "#{command}(#{args.join(', ')})"
      RequestHelper.current_responce = args.empty? ? @module.send(command) : @module.send(command, *args)
      if add_data_to_collector
        @data_collector[data_param] ||= []
        response = [RequestHelper.current_responce.data].flatten
        response.each do |cur_response|
          @data_collector[data_param] << param_names.inject(cur_response) { |a, e| a[e] }
        end
      end
    end
  end

  describe 'Successful api request' do
    it 'returns Teamlab::Response object' do
      expect(RequestHelper.current_responce).to be_instance_of(Teamlab::Response)
    end

    it 'returns Teamlab::Response object with successful parameter, set to true' do
      expect(RequestHelper.current_responce.success).to be_truthy
    end

    it 'returns Teamlab::Response object with nil error parameter' do
      expect(RequestHelper.current_responce.error).to be_nil
    end

    it 'returns Teamlab::Response object with hash body' do
      expect(RequestHelper.current_responce.body).to be_instance_of(Hash)
    end
  end

  after(:all) do
    RequestHelper.current_responce = nil
  end
end
