require 'net/http'
require 'json'
require 'httparty'

module Testrail
  class Request
    include HTTParty

    def self.post(*args)
      request(:post, args)
    end

    def self.get(*args)
      request(:get, args)
    end

    private

    def self.request(type, args)
      command, opts = parse_args(args)
      url = generate_request_url(command)
      attempts = 0
      begin
        response = HTTParty.send(type, url, opts)
      rescue TimeoutError
        attempts += 1
        retry if attempts < 3
        raise 'Can\'t ' + type.to_s + ' ' + url.to_s
      rescue Exception
        fail 'Unexpected exception intercepted calling Testrail'
      end
      fail response.parsed_response['error'] if response.code >= 400
      response.parsed_response
    end

    def self.generate_request_url(command)
      Testrail.config.server + Testrail.config.api_path + command
    end

    def self.parse_args(args)
      command = args.shift
      opts = {}
      opts[:body] = (args.last.instance_of?(Hash) ? args.pop : {}).to_json
      opts[:headers] = opts[:headers] ? Testrail.config.headers.merge(opts[:headers]) : Testrail.config.headers
      opts[:basic_auth] = { username: Testrail.config.username, password: Testrail.config.password }
      command += '/' + args.shift.map { |key, value| "#{key}=#{value}" }.join('&').sub(/\w+=/, '') unless args.empty?
      [command, opts]
    end
  end
end
