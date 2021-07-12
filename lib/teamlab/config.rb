# frozen_string_literal: true

require_relative 'request'

module Teamlab
  attr_reader :config

  def self.configure(&block)
    @config ||= Config.new
    yield @config if block
    auth_response = Teamlab::Request.new(nil, 'authentication').post('', userName: @config.username, password: @config.password).body
    raise "Cannot get response token for #{auth_response}" if auth_response['response'].nil? || auth_response['response']['token'].nil?

    @config.token = auth_response['response']['token']
    @config.headers = { 'authorization' => @config.token }
  end

  def self.config
    @config ||= Config.new
  end

  class Config
    attr_accessor :server, :api_path, :api_additive, :username, :password, :token, :headers
    # @return [Net::HTTP::Proxy] connection proxy
    attr_accessor :proxy

    def initialize(params = {})
      default_configuration
      @server = params[:server]
      @username = params[:username]
      @password = params[:password]
    end

    def default_configuration
      @server = 'https://onlyoffice.com'
      @api_path = '/api/2.0/'
      @api_additive = ''
      @username = 'user'
      @password = 'password'
    end
  end
end
