# frozen_string_literal: true

module Teamlab
  class Portal
    def initialize(config)
      @request = Teamlab::Request.new(config, 'portal')
    end

    def invite_user_url
      @request.get(%w[users invite user])
    end

    def invite_visitor_url
      @request.get(%w[users invite visitor])
    end
  end
end
