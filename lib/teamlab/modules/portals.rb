# frozen_string_literal: true

module Teamlab
  class Portal
    def initialize(config = nil)
      @request = Teamlab::Request.new(config, 'portal')
    end

    def invite_user_url
      @request.get(%w[users invite user])
    end

    def invite_visitor_url
      @request.get(%w[users invite visitor])
    end

    # Deletes the current portal immediately
    # WARNING: Do not test this method in specs in this project
    def delete_portal
      @request.delete(%w[deleteportalimmediately])
    end
  end
end
