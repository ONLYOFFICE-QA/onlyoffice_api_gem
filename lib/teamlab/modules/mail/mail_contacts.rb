module Teamlab
  # Methods for working with mail contacts
  module MailContacts
    def get_contact_list_for_auto_complete(term)
      @request.get(%w[contacts], term: term)
    end

    def get_crm_linked_entities(message_id)
      @request.get(%w[crm linked entities], messageId: message_id)
    end
  end
end
