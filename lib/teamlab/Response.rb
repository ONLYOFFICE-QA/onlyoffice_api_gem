module Teamlab

  class Response

    attr_reader :body, :error, :code, :success

    def initialize(http_response)
      if http_response.is_a?(String) && http_response.code < 400
        @body = {:'response' => http_response.to_s}
        @success = true
        @code = 201
      else
        @code = http_response.code
        @success = @code < 400
        fail "Error #{@code}" if @code >= 400
        fail TimeoutError, 'Portal is warming up' if http_response.parsed_response.include?('portal is being warmed')
        @body = http_response.respond_to?(:parsed_response) && http_response.parsed_response.key?('result') ? http_response.parsed_response['result'] : http_response.to_hash
        @error = @body['error']['message'] if @body.key?('error') && @body['error'].key?('message')      
      end
    end
  end
end