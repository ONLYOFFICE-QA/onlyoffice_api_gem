module Teamlab
  class Calendar
    def initialize
      @request = Teamlab::Request.new('calendar')
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

    def get_event_history_by_id(event_id)
      @request.get(['events', event_id.to_s, 'historybyid'])
    end

    def get_event_history_by_uid(event_uid)
      @request.get(['events', event_uid.to_s, 'historybyuid'])
    end

    def get_icalc_feed(calendar_id, signature)
      @request.get([calendar_id.to_s, 'ical', signature.to_s])
    end

    def get_calendar_events(start_date, end_date)
      @request.get(['eventdays', start_date.to_s, end_date.to_s])
    end

    def get_calendars_and_subscriptions(start_date, end_date)
      @request.get(['calendars', start_date.to_s, end_date.to_s])
    end

    def create_calendar(name, time_zone, options = {})
      @request.post('', { name: name, timeZone: time_zone }.merge(options))
    end

    def create_calendar_by_ical_link(ical_url, name, options = {})
      @request.post(%w(calendarurl), { iCalUrl: ical_url, name: name }.merge(options))
    end

    def add_event(calendar_id, name, options = {})
      @request.post([calendar_id.to_s, 'event'], { name: name }.merge(options))
    end

    def add_icsevent(calendar_id, ics, options = {})
      @request.post(['icsevent'], { calendarId: calendar_id.to_s, ics: ics.to_s }.merge(options))
    end

    def import_ical(calendar_id, file)
      @request.post([calendar_id.to_s, 'import'], somefile: File.new(file))
    end

    def import_events(calendar_id, ical)
      @request.post(['importIcs'], calendarId: calendar_id.to_s, iCalString: ical.to_s)
    end

    def update_calendar(calendar_id, name, time_zone, options = {})
      @request.put([calendar_id.to_s], { name: name, timeZone: time_zone }.merge(options))
    end

    def update_calendar_user_view(calendar_id, name, time_zone, options = {})
      @request.put([calendar_id.to_s, 'view'], { name: name, timeZone: time_zone }.merge(options))
    end

    def manage_subscriptions(states)
      @request.put(%w(subscriptions manage), states: states)
    end

    def update_event(calendar_id, event_id, name, options = {})
      @request.put([calendar_id.to_s, event_id.to_s], { name: name }.merge(options))
    end

    def update_icsevent(calendar_id, event_id, ics, options = {})
      @request.put(['icsevent'], { calendarId: calendar_id.to_s, eventId: event_id.to_s, ics: ics.to_s }.merge(options))
    end

    def delete_calendar(calendar_id)
      @request.delete([calendar_id.to_s])
    end

    def delete_event_series(event_id)
      @request.delete(['events', event_id.to_s])
    end

    def remove_event(event_id, options = {})
      @request.delete(['events', event_id.to_s, 'custom'], options)
    end

    def unsubscribe_from_event(event_id)
      @request.delete(['events', event_id.to_s, 'unsubscribe'])
    end
  end
end
