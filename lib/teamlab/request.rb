require 'net/http'
require 'json'
require 'httparty'
require 'httmultiparty'
require_relative 'response'

module Teamlab
  class Request
    # include HTTParty
    include HTTMultiParty

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
      url = URI.encode(generate_request_url(command))
      attempts = 0
      begin
        response = Teamlab::Response.new(HTTMultiParty.send(type, url, opts))
      rescue TimeoutError => timeout_exception
        attempts += 1
        retry if attempts < 3
        raise "Can't #{type} to #{url} because of TimeoutError: #{timeout_exception}"
      rescue Exception => e
        raise e
      end
      fail "Error #{response.code}: #{response.error}" unless response.success
      response
    end

    def generate_request_url(command)
      Teamlab.config.server + Teamlab.config.api_path + @api_additive + command
    end

    def parse_args(args, type)
      command = args.first.instance_of?(Array) ? '/' + args.shift.join('/') : args.shift.to_s
      opts = {}
      opts[:body] = args.last.instance_of?(Hash) ? args.pop : {}
      opts[:headers] = Teamlab.config.headers
      if opts[:body].key?(:somefile)
        opts[:query] = opts.delete(:body)
        opts[:detect_mime_type] = true
      end
      opts[:query] = opts.delete(:body) if type == :get
      [command, opts]
    end
  end
end
