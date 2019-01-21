module Teamlab
  # Methods for working with crm invoices
  module CrmInvoices
    # @param invoice_item_id [Integer] id of invoice
    # @return [Void]
    def get_invoice_item_by_id(invoice_item_id)
      @request.get(['invoiceitem', invoice_item_id])
    end
  end
end
