module Teamlab
  # Methods for working with mail alerts
  module MailAlerts
    def get_alerts_list
      @request.get('alert')
    end

    def delete_alert_by_id(id)
      @request.delete(['alert', id.to_s])
    end
  end
end
