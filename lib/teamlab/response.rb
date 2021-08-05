# frozen_string_literal: true

require_relative 'responce/custom_exceptions'

module Teamlab
  class Response
    attr_reader :body, :error, :code, :success

    def initialize(http_response)
      @code = http_response.code
      @success = @code < 400
      err_msg = generate_err_msg(http_response) if @code >= 400
      if @success
        handle_success_responce(http_response)
      else
        raise TimeoutError, 'Portal is warming up' if http_response.parsed_response.include?('portal is being warmed')
        raise "Error #{@code}\n#{err_msg}" if @code >= 400

        @body = http_response.respond_to?(:parsed_response) && http_response.parsed_response.key?('result') ? http_response.parsed_response['result'] : http_response.to_hash
        @error = @body['error']['message'] if @body.key?('error') && @body['error'].key?('message')
      end
    end

    def generate_err_msg(http_response)
      "API request failed\n\noriginal request:\n"\
        "#{http_response.request.http_method} #{http_response.request.path}\nbody: "\
        "#{JSON.pretty_generate(http_response.request.options[:body])}"\
        "\n\nresponse:\n"\
        "#{prettify_response(http_response.parsed_response)}"
    end

    def prettify_response(msg)
      JSON.pretty_generate(msg)
    rescue Encoding::UndefinedConversionError
      msg.force_encoding(Encoding::UTF_8)
    end

    # @return [Hash] data of response
    def data
      @body['response']
    end

    # Check if responce is succeed, has nil error and has hash body
    # @param [Symbol] current api method
    # @return [Boolean] result of responce check
    def correct?(command)
      result = @success && @error.nil? && @body.is_a?(Hash)
      raise("Response should be always successful for #{command}") unless @success
      raise("Response should not contain errors for #{command}") unless @error.nil?
      raise("Response should be Hash for #{command}") unless @body.is_a?(Hash)

      result
    end

    private

    # Sometime in strange situation, like maybe nginx errors
    # API requests return not JSON, but html or other data
    # @param [Teamlab::Responce] responce to check
    # @return [Nil] is body responce correct and raise exception in any other situation
    def check_responce_body(responce)
      return if stream_data_request?(responce)

      JSON.parse(responce.body)
    rescue JSON::ParserError => e
      request_info = "#{responce.request.http_method} #{responce.request.uri}"
      raise NoJsonInResponce, "Request `#{request_info}` responce body is not a json\n "\
                              "Parsing error: \n#{e}\n"
    end

    # Handle success responce
    # @param [Teamlab::Responce] responce to handle
    # @return [nil] if everything is fine or exception
    def handle_success_responce(responce)
      check_responce_body(responce)
      @body = responce.to_hash
    end

    # Check if request for stream data
    # Those request has no body, but data stream in responce
    # @param [Teamlab::Responce] responce to check
    # @return [Boolean] result of check
    def stream_data_request?(responce)
      calendar_ical_request_regexp = %r{.*/calendar/\d*/ical/\S*}
      uri = responce.request.uri.to_s

      return true if calendar_ical_request_regexp.match?(uri)

      false
    end
  end
end
