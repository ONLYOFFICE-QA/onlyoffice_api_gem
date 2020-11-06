# frozen_string_literal: true

# Module for code to cleanup crm
module CrmCleanup
  # Remove all data from crm
  def crm_cleanup
    remove_invoices
  end

  # Remove all crm invoices
  def remove_invoices
    invoices = Teamlab.crm.get_invoices_by_filter.body['response']
    invoices_ids = invoices.map { |invoice| invoice['id'] }
    return if invoices_ids.empty?

    Teamlab.crm.delete_invoices_bulk(invoices_ids)
  end
end
