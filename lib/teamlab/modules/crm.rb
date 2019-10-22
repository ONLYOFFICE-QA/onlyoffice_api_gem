# frozen_string_literal: true

require_relative 'crm/crm_cases'
require_relative 'crm/crm_common'
require_relative 'crm/crm_contacts'
require_relative 'crm/crm_files'
require_relative 'crm/crm_history'
require_relative 'crm/crm_invoices'
require_relative 'crm/crm_opportunities'
require_relative 'crm/crm_organisation'
require_relative 'crm/crm_tags'
require_relative 'crm/crm_tasks'
require_relative 'crm/crm_user_fields'
module Teamlab
  class Crm
    include CrmCases
    include CrmCommon
    include CrmContacts
    include CrmFiles
    include CrmHistory
    include CrmInvoices
    include CrmOpportunities
    include CrmOrganisation
    include CrmTags
    include CrmTasks
    include CrmUserFields

    def initialize
      @request = Teamlab::Request.new('crm')
    end
  end
end
