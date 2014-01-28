require 'net/http'
require 'json'
require 'httparty'
require_relative 'Response'

module Teamlab
  class Request
    include HTTParty

    def self.post(*args)
      request(:post, args)
    end

    def self.get(*args)
      request(:get, args)
    end

    def self.put(*args)
      request(:put, args)
    end

    def self.delete(*args)
      request(:delete, args)
    end

    private

    def self.request(type, args)
      command, opts = parse_args(args)
      url = generate_request_url(command)
      attempts = 0
      begin
        response = Teamlab::Response.new(HTTParty.send(type, url, opts))
      rescue TimeoutError
        attempts += 1
        retry if attempts < 3
        raise 'Can\'t ' + type.to_s + ' ' + url.to_s
      rescue Exception => e
        fail e#'Unexpected exception intercepted calling Teamlab'
      end
      fail response.error.to_s unless response.success
      response
    end

    def self.generate_request_url(command)
      Teamlab.config.server + Teamlab.config.api_path + Teamlab.config.api_additive + command
    end

    def self.parse_args(args)
      command = args.first.instance_of?(Array) ? '/' + args.shift.join('/') : ''
      opts = {}
      opts[:body] = (args.last.instance_of?(Hash) ? args.pop : {})
      opts[:headers] = opts[:headers] ? Teamlab.config.headers.merge(opts[:headers]) : Teamlab.config.headers
      [command, opts]
    end
  end
end