# frozen_string_literal: true

require 'net/http'
require 'json'
require 'httparty'
require_relative 'response'

module Teamlab
  class Request
    include HTTParty

    def initialize(config, api_additive)
      @config = config
      @api_additive = api_additive.to_s
    end

    def post(*args)
      request(:post, args)
    end

    def get(*args)
      request(:get, args)
    end

    def put(*args)
      request(:put, args)
    end

    def delete(*args)
      request(:delete, args)
    end

    private

    def request(type, args)
      command, opts = parse_args(args, type)
      url = generate_request_url(command)
      attempts = 0
      begin
        response = Teamlab::Response.new(HTTParty.send(type, url, opts))
      rescue Timeout::Error => e
        attempts += 1
        retry if attempts < 3
        raise "Can't #{type} to #{url} because of TimeoutError: #{e}"
      rescue StandardError => e
        raise e
      end
      raise("Error #{response.code}: #{response.error}") unless response.success

      response
    end

    def server
      @config&.server || Teamlab.config.server
    end

    def api_path
      @config&.api_path || Teamlab.config.api_path
    end

    def headers
      @config&.headers || Teamlab.config.headers
    end

    def proxy
      @config&.proxy || Teamlab.config.proxy
    end

    def generate_request_url(command)
      server + api_path + @api_additive + CGI.escape(command)
    end

    def parse_args(args, type)
      command = args.first.instance_of?(Array) ? "/#{args.shift.join('/')}" : args.shift.to_s
      opts = {}
      opts[:body] = args.last.instance_of?(Hash) ? args.pop : {}
      opts[:body].delete_if { |_key, value| value == [] }
      opts[:headers] = headers
      opts = init_proxy(opts)
      opts[:query] = opts.delete(:body) if type == :get
      [command, opts]
    end

    # @param opts [Hash] options to init
    # @return [Hash] options
    def init_proxy(opts)
      return opts unless proxy

      opts[:http_proxyaddr] ||= proxy.proxy_address
      opts[:http_proxyport] ||= proxy.proxy_port
      opts[:http_proxyuser] ||= proxy.proxy_user
      opts[:http_proxypass] ||= proxy.proxy_pass
      opts
    end
  end
end
