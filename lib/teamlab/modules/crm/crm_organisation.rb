module Teamlab
  # Methods for working with crm cases
  module CrmOrganisation
    def update_organisation_company_name(title)
      @request.put(%w[settings organisation base], companyName: title)
    end

    def update_organisation_address(text)
      @request.put(%w[settings organisation address], companyAddress: text)
    end
  end
end
