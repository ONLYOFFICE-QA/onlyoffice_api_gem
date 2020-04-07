# frozen_string_literal: true

require 'net/http'
require 'json'
require 'httparty'
require_relative 'response'

module Teamlab
  class Request
    include HTTParty

    def initialize(api_additive)
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

    def generate_request_url(command)
      Teamlab.config.server + Teamlab.config.api_path + @api_additive + command
    end

    def parse_args(args, type)
      command = args.first.instance_of?(Array) ? '/' + args.shift.join('/') : args.shift.to_s
      opts = {}
      opts[:body] = args.last.instance_of?(Hash) ? args.pop : {}
      opts[:body].delete_if { |_key, value| value == [] }
      opts[:headers] = Teamlab.config.headers
      opts = init_proxy(opts)
      opts[:query] = opts.delete(:body) if type == :get
      [command, opts]
    end

    # @param opts [Hash] options to init
    # @return [Hash] options
    def init_proxy(opts)
      return opts unless Teamlab.config.proxy

      opts[:http_proxyaddr] ||= Teamlab.config.proxy.proxy_address
      opts[:http_proxyport] ||= Teamlab.config.proxy.proxy_port
      opts[:http_proxyuser] ||= Teamlab.config.proxy.proxy_user
      opts[:http_proxypass] ||= Teamlab.config.proxy.proxy_pass
      opts
    end
  end
end
