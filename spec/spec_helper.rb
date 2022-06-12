# frozen_string_literal: true

if ENV['CI']
  require 'simplecov'
  SimpleCov.start
  require 'simplecov-cobertura'
  SimpleCov.formatter = SimpleCov::Formatter::CoberturaFormatter
end

require 'faker'
require 'rspec'
require 'rspec/retry'
require 'onlyoffice_api'
require_relative 'spec_helper/portal_cleanup'
require_relative 'spec_helper/request_helper'
require_relative 'support/http_data'

include PortalCleanup

def api
  @api ||= Teamlab::OnlyofficeApiInstance.new(server: ENV.fetch('ONLYOFFICE_API_GEM_TEST_PORTAL', 'unknown_server'),
                                              username: ENV.fetch('ONLYOFFICE_API_GEM_TEST_USER', 'unknown_user'),
                                              password: ENV.fetch('ONLYOFFICE_API_GEM_TEST_PASSWORD', 'unknown_pass'))
end

def configure_test_portal
  reset_portal(api)
end

configure_test_portal

RSpec.configure do |config|
  config.before(:all) do
    @data_collector = {}
  end

  config.default_retry_count = 3
  config.verbose_retry = true
end

shared_examples_for 'an api request' do |*flags|
  before { pending } if flags.include?(:pending)
  before { skip } if flags.include?(:skip)
  before do
    if RequestHelper.current_responce.nil?
      @module = api.send(teamlab_module)
      logger.info("Send request: `#{command}(#{args.join(', ')})`")
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

    it 'returns Teamlab::Response object with successful parameter, nil error and hash body' do
      expect(RequestHelper.current_responce).to be_correct(command)
    end
  end

  after(:all) do
    RequestHelper.current_responce = nil
  end
end
