# frozen_string_literal: true

module Teamlab
  # Module for projects reports methods
  module ProjectsReports
    def create_report_template(name, options = {})
      @request.post(['report'], { name: name }.merge(options))
    end

    def update_report_template(report_id, name, options = {})
      @request.put(['report', report_id.to_s], { name: name }.merge(options))
    end

    def delete_report_template(report_id)
      @request.delete(['report', report_id.to_s])
    end
  end
end
