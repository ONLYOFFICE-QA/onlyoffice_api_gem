# encoding: utf-8
require 'active_support/configurable'
require_relative 'request'

module Teamlab
  attr_reader :config

  def self.configure(&_block)
    warn '[DEPRECATION] This gem has been renamed to `onlyoffice_api` and will no longer be supported. Please switch to `onlyoffice_api` gem as soon as possible.'
    @config ||= Config.new
    yield @config if block_given?
    auth_response = Teamlab::Request.new('authentication').post('', userName: @config.username, password: @config.password).body
    fail "Cannot get response token for #{auth_response}" if auth_response['response'].nil? || auth_response['response']['token'].nil?
    @config.token = auth_response['response']['token']
    @config.headers = { 'authorization' => @config.token }
  end

  def self.config
    @config ||= Config.new
  end

  class Config
    include ActiveSupport::Configurable

    config_accessor :server, :api_path, :api_additive, :username, :password, :token, :headers

    def initialize
      default_configuration
    end

    def default_configuration
      self.server = 'https://teamlab.com'
      self.api_path = '/api/2.0/'
      self.api_additive = ''
      self.username = 'user'
      self.password = 'password'
    end
  end
end
