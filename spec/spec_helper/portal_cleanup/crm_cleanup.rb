# frozen_string_literal: true

# Module for code to cleanup crm
module CrmCleanup
  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # Remove all data from crm
  def crm_cleanup(api)
    remove_invoices(api)
    remove_contacts(api)
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # Remove all crm invoices
  def remove_invoices(api)
    invoices = api.crm.get_invoices_by_filter.body['response']
    invoices_ids = invoices.map { |invoice| invoice['id'] }
    return if invoices_ids.empty?

    api.crm.delete_batch_invoices(invoices_ids)
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # Remove all crm contacts(api)
  def remove_contacts(api)
    contacts = api.crm.get_contacts_by_filter.body['response']
    contact_ids = contacts.map { |contact| contact['id'] }
    return if contact_ids.empty?

    api.crm.delete_contact_group(contact_ids)
  end
end
