module Teamlab

  class Response

    attr_reader :body, :error, :code, :success

    def initialize(http_response)
      @code = http_response.code
      @success = @code < 400
      fail 'Error 404' if @code == 404
      fail TimeoutError, 'Portal is warming up' if http_response.parsed_response.include?('portal is being warmed')
      @body = http_response.respond_to?(:parsed_response) && http_response.parsed_response.key?('result') ? http_response.parsed_response['result'] : http_response.to_hash
      @error = @body['error']['message'] if @body.key?('error') && @body['error'].key?('message')
    end
  end
end