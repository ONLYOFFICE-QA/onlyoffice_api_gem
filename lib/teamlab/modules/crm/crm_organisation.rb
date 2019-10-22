# frozen_string_literal: true

module Teamlab
  # Methods for working with crm cases
  module CrmOrganisation
    def update_organisation_company_name(title)
      @request.put(%w[settings organisation base], companyName: title)
    end

    def update_organisation_address(options = {})
      @request.put(%w[settings organisation address], options)
    end
  end
end
