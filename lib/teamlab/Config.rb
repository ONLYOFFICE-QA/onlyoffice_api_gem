# encoding: utf-8
require 'active_support/configurable'

module Teamlab
  attr_reader :config

  def self.configure(&block)
    @config ||= Config.new
    yield @config if block_given?

  end

  def self.config
    @config ||= Config.new
  end

  class Config
    include ActiveSupport::Configurable

    config_accessor :server, :api_path, :api_path_method, :username, :password, :token

    def initialize
      default_configuration
    end

    def default_configuration
      self.server = 'https://example.testrail.com'
      self.api_path = '/api/2.0/'
      self.api_path_method = ''
      self.username = 'user'
      self.password = 'password'
    end
  end
end
