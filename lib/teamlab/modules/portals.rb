module Teamlab

  class Portal
    def initialize
      @request = Teamlab::Request.new('portal')
    end

    def invite_user_url
      @request.get(%w(users invite user))
    end

    def invite_visitor_url
      @request.get(%w(users invite visitor))
    end
  end
end
