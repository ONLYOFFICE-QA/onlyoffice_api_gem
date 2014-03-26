module Teamlab
  class Calendar

    def initialize
      @request = Teamlab::Request
    end

    def get_default_access
      @request.get(%w(sharing))
    end

    def get_calendar(id)
      @request.get([id.to_s])
    end

    def get_subscription_list
      @request.get(%w(subscriptions))
    end

    def get_icalc_link(calendar_id)
      @request.get([calendar_id.to_s, 'icalurl'])
    end

    def get_access_parameters(calendar_id)
      @request.get([calendar_id.to_s, 'sharing'])
    end

    def get_icalc_feed(calendar_id, signature)
      @request.get([calendar_id.to_s, 'ical', signature.to_s])
    end
  end
end