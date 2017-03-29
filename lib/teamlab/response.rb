module Teamlab
  class Response
    attr_reader :body, :error, :code, :success

    def initialize(http_response)
      @code = http_response.code
      @success = @code < 400
      err_msg = generate_err_msg(http_response) if @code >= 400
      if @success
        @body = http_response.to_hash
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
      "#{JSON.pretty_generate(http_response.parsed_response)}"
    end
  end
end
