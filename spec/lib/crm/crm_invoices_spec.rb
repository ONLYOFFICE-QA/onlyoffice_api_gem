# frozen_string_literal: true

require 'spec_helper'

invoices_contact = api.crm.create_person(random_word.capitalize, random_word.capitalize).data
invoice_item_new = api.crm.create_invoice_item(random_word, random_word, rand, random_word).data
second_invoice_item = api.crm.create_invoice_item(random_word, random_word, rand, random_word).data
third_invoice_item = api.crm.create_invoice_item(random_word, random_word, rand, random_word).data
invoice_new = api.crm.create_invoice(random_word, DUE_DATE, invoices_contact['id'], DUE_DATE, LANGUAGE.sample, CURRENCY.sample, rand(1000), random_word, { invoiceItemID: invoice_item_new['id'] }).data
second_invoice = api.crm.create_invoice(random_word, DUE_DATE, invoices_contact['id'], DUE_DATE, LANGUAGE.sample, CURRENCY.sample, rand(1000), random_word, { invoiceItemID: invoice_item_new['id'] }).data
invoice_line_new = api.crm.create_invoice_line(invoice_new['id'], invoice_item_new['id']).data
invoice_tax_new = api.crm.create_invoice_tax(random_word, random_word).data

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#create_invoice_item' do
    it_behaves_like 'an api request' do
      let(:command) { :create_invoice_item }
      let(:args) { [random_word, random_word, rand, random_word] }
    end
  end

  describe '#get_invoice_item_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_invoice_item_by_id }
      let(:args) { [invoice_item_new['id']] }
    end
  end

  describe '#create_invoice' do
    it_behaves_like 'an api request' do
      let(:command) { :create_invoice }
      let(:args) { [random_word, DUE_DATE, invoices_contact['id'], DUE_DATE, LANGUAGE.sample, CURRENCY.sample, rand(1000), random_word, { invoiceItemID: invoice_item_new['id'] }] }
    end
  end

  describe '#create_invoice_line' do
    it_behaves_like 'an api request' do
      let(:command) { :create_invoice_line }
      let(:args) { [invoice_new['id'], invoice_item_new['id']] }
    end
  end

  describe '#get_invoice_taxes' do
    it_behaves_like 'an api request' do
      let(:command) { :get_invoice_taxes }
    end
  end

  describe '#get_invoice_sample' do
    it_behaves_like 'an api request' do
      let(:command) { :get_invoice_sample }
    end
  end

  describe '#get_invoices_by_filter' do
    it_behaves_like 'an api request' do
      let(:command) { :get_invoices_by_filter }
    end
  end

  describe '#get_invoices_settings' do
    it_behaves_like 'an api request' do
      let(:command) { :get_invoices_settings }
    end
  end

  describe '#get_invoice_items_by_filter' do
    it_behaves_like 'an api request' do
      let(:command) { :get_invoice_items_by_filter }
    end
  end

  describe '#get_entity_invoices' do
    it_behaves_like 'an api request' do
      let(:command) { :get_entity_invoices }
      let(:args) { [:contact, invoices_contact['id']] }
    end
  end

  describe '#check_invoice_existence_by_number' do
    it_behaves_like 'an api request' do
      let(:command) { :check_invoice_existence_by_number }
      let(:args) { [invoice_new['number']] }
    end
  end

  describe '#get_invoice_by_number' do
    it_behaves_like 'an api request' do
      let(:command) { :get_invoice_by_number }
      let(:args) { [invoice_new['number']] }
    end
  end

  describe '#update_invoice_item' do
    it_behaves_like 'an api request' do
      let(:command) { :update_invoice_item }
      let(:args) { [invoice_item_new['id'], random_word, random_word, rand, random_word] }
    end
  end

  describe '#update_invoice_tax' do
    it_behaves_like 'an api request' do
      let(:command) { :update_invoice_tax }
      let(:args) { [invoice_tax_new['id'], random_word] }
    end
  end

  describe '#save_number_settings' do
    it_behaves_like 'an api request' do
      let(:command) { :save_number_settings }
    end
  end

  describe '#save_terms_settings' do
    it_behaves_like 'an api request' do
      let(:command) { :save_terms_settings }
    end
  end

  describe '#update_invoice_group_status' do
    it_behaves_like 'an api request' do
      let(:command) { :update_invoice_group_status }
      let(:args) { ['Draft', [invoice_new['id']]] }
    end
  end

  describe '#update_invoice_line' do
    it_behaves_like 'an api request' do
      let(:command) { :update_invoice_line }
      let(:args) { [invoice_line_new['id'], invoice_new['id'], { invoiceItemId: invoice_item_new['id'] }] }
    end
  end

  describe '#delete_invoice_tax' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_invoice_tax }
      let(:args) { [invoice_tax_new['id']] }
    end
  end

  describe '#delete_invoice_line' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_invoice_line }
      let(:args) { [invoice_line_new['id']] }
    end
  end

  describe '#update_invoice' do
    it_behaves_like 'an api request' do
      let(:command) { :update_invoice }
      let(:args) do
        [second_invoice['id'],
         { issueDate: DUE_DATE,
           dueDate: DUE_DATE,
           contactId: invoices_contact['id'],
           language: LANGUAGE.sample,
           currency: CURRENCY.sample,
           exchangeRate: rand(1000),
           terms: random_word,
           invoiceLines: [{ invoiceItemID: invoice_item_new['id'] }] }]
      end
    end
  end

  describe '#delete_invoice_item' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_invoice_item }
      let(:args) { [third_invoice_item['id']] }
    end
  end

  describe '#delete_invoice' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_invoice }
      let(:args) { [invoice_new['id']] }
    end
  end

  describe '#delete_batch_invoices' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_batch_invoices }
      let(:args) { [second_invoice['id']] }
    end
  end

  describe '#delete_batch_items' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_batch_items }
      let(:args) { [second_invoice_item['id']] }
    end
  end
end
