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

    # Returns a project report template with the ID specified in the request
    # @param report_id [Symbol, String] Report template ID
    # @return [Hash] Project report template
    def report_template(report_id)
      @request.get(['report', report_id.to_s])
    end

    def delete_report_template(report_id)
      @request.delete(['report', report_id.to_s])
    end
  end
end
