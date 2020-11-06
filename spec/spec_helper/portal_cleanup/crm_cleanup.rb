# frozen_string_literal: true

# Module for code to cleanup crm
module CrmCleanup
  # Remove all data from crm
  def crm_cleanup
    remove_invoices
    remove_contacts
  end

  # Remove all crm invoices
  def remove_invoices
    invoices = Teamlab.crm.get_invoices_by_filter.body['response']
    invoices_ids = invoices.map { |invoice| invoice['id'] }
    return if invoices_ids.empty?

    Teamlab.crm.delete_batch_invoices(invoices_ids)
  end

  # Remove all crm contacts
  def remove_contacts
    contacts = Teamlab.crm.get_contacts_by_filter.body['response']
    contact_ids = contacts.map { |contact| contact['id'] }
    return if contact_ids.empty?

    Teamlab.crm.delete_contact_group(contact_ids)
  end
end
