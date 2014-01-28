# encoding: utf-8
require 'active_support/configurable'
require_relative 'Request'

module Teamlab
  attr_reader :config

  def self.configure(&block)
    @config ||= Config.new
    yield @config if block_given?
    @config.api_additive = 'authentication'
    @config.token = Teamlab::Request.post('', {:userName => @config.username, :password => @config.password}).body['response']['token']
    @config.headers = { 'authorization' => @config.token}
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
      self.server = 'https://example.testrail.com'
      self.api_path = '/api/2.0/'
      self.api_additive = ''
      self.username = 'user'
      self.password = 'password'
    end
  end
end