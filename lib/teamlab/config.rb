require_relative 'request'

module Teamlab
  attr_reader :config

  def self.configure(&_block)
    @config ||= Config.new
    yield @config if block_given?
    auth_response = Teamlab::Request.new('authentication').post('', userName: @config.username, password: @config.password).body
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

    def initialize
      default_configuration
    end

    def default_configuration
      @server = 'https://teamlab.com'
      @api_path = '/api/2.0/'
      @api_additive = ''
      @username = 'user'
      @password = 'password'
    end
  end
end
