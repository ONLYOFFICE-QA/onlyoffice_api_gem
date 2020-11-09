# frozen_string_literal: true

module Teamlab
  # Methods for working with mailserver domains
  module MailserverDomains
    # @return [Hash] Returns list of the web domains associated with tenant
    def tenant_domain_list
      @request.get(%w[domains get])
    end
  end
end
