module Teamlab
  # Methods for working with crm invoices
  module CrmInvoices
    def get_invoice_taxes
      @request.get(%w[invoice tax])
    end

    def get_invoice_sample
      @request.get(%w[invoice sample])
    end

    def get_invoices_by_filter(options = {})
      @request.get(%w[invoice filter], options)
    end

    def get_settings
      @request.get(%w[invoice settings])
    end

    def get_invoice_items_by_filter(options = {})
      @request.get(%w[invoiceitem filter], options)
    end

    def get_invoice_by_id(id)
      @request.get(['invoice', id.to_s])
    end

    def get_entity_invoices(entity_type, entity_id)
      @request.get([entity_type.to_s, 'invoicelist', entity_id.to_s])
    end

    def create_invoice(number, issue_date, client_id, due_date, language, currency, exchange_rate, terms, invoice_line, options = {})
      @request.post(%w[invoice], { number: number, issueDate: issue_date, contactId: client_id, dueDate: due_date,
                                   language: language, currency: currency, exchangeRate: exchange_rate, terms: terms,
                                   invoiceLines: invoice_line }.merge(options))
    end

    def create_invoice_line(invoice_id, invoice_item_id, options = {})
      @request.post(%w[invoiceline], { invoiceId: invoice_id, invoiceItemId: invoice_item_id }.merge(options))
    end

    def create_invoice_item(title, description, price, stock_keeping_unit, options = {})
      @request.post(%w[invoiceitem], { title: title, description: description, price: price, sku: stock_keeping_unit.to_s }.merge(options))
    end

    def create_invoice_tax(name, description, options = {})
      @request.post(%w[invoice tax], { name: name, description: description }.merge(options))
    end

    def update_invoice_item(id, title, description, price, stock_keeping_unit, options = {})
      @request.put(['invoiceitem', id.to_s], { title: title, description: description, price: price, sku: stock_keeping_unit.to_s }.merge(options))
    end

    def update_invoice_tax(id, name, options = {})
      @request.put(['invoice', 'tax', id.to_s], { name: name }.merge(options))
    end

    def update_invoice(id, options = {})
      @request.put(['invoice', id.to_s], options)
    end

    def save_number_settings(options = {})
      @request.put(%w[invoice settings name], options)
    end

    def save_terms_settings(options = {})
      @request.put(%w[invoice settings terms], options)
    end

    def update_invoice_patch_status(status, invoice_ids)
      @request.put(['invoice', 'status', status.to_s], invoiceids: invoice_ids)
    end

    def update_invoice_line(invoice_line_id, invoice_id, options = {})
      @request.put(['invoiceline', invoice_line_id], { invoiceId: invoice_id }.merge(options))
    end

    def delete_batch_invoices(*invoice_ids)
      @request.delete(%w[invoice], invoiceids: invoice_ids.flatten)
    end
    alias delete_invoices_bulk delete_batch_invoices

    def delete_batch_items(*ids)
      @request.delete(%w[invoiceitem], ids: ids.flatten)
    end
    alias delete_invoice_items_bulk delete_batch_items

    def delete_invoice_item(id)
      @request.delete(['invoiceitem', id.to_s])
    end

    def delete_invoice_tax(id)
      @request.delete(['invoice', 'tax', id.to_s])
    end

    def delete_invoice(id)
      @request.delete(['invoice', id.to_s])
    end

    def delete_invoice_line(id)
      @request.delete(['invoiceline', id.to_s])
    end

    # @param invoice_item_id [Integer] id of invoice
    # @return [Void]
    def get_invoice_item_by_id(invoice_item_id)
      @request.get(['invoiceitem', invoice_item_id])
    end
  end
end
