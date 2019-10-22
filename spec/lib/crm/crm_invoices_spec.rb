# frozen_string_literal: true

require 'spec_helper'

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#create_person' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :crm }
      let(:command) { :create_person }
      let(:args) { [random_word.capitalize, random_word.capitalize] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :new_contact_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_invoice_item' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice_item }
      let(:args) { [random_word, random_word, rand, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_item_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_invoice_item' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice_item }
      let(:args) { [random_word, random_word, rand, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_item_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_invoice_item_by_id' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_invoice_item_by_id }
      let(:args) { [random_id(:invoice_item)] }
    end
  end

  describe '#create_invoice' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice }
      let(:args) { [random_word, DUE_DATE, random_id(:new_contact), DUE_DATE, LANGUAGE.sample, CURRENCY.sample, rand(1000), random_word, { invoiceItemID: @data_collector[:invoice_item_ids].first }] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_invoice' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice }
      let(:args) { [random_word, DUE_DATE, random_id(:new_contact), DUE_DATE, LANGUAGE.sample, CURRENCY.sample, rand(1000), random_word, { invoiceItemID: @data_collector[:invoice_item_ids].first }] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_invoice_line' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice_line }
      let(:args) { [@data_collector[:invoice_ids].first, @data_collector[:invoice_item_ids].first] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_line_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_invoice_item_for_batch' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice_item }
      let(:args) { [random_word, random_word, rand, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_item_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_invoice_tax' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice_tax }
      let(:args) { [random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_tax_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_invoice_taxes' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_invoice_taxes }
    end
  end

  describe '#get_invoice_sample' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_invoice_sample }
    end
  end

  describe '#get_invoices_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_invoices_by_filter }
    end
  end

  describe '#get_invoices_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_invoices_settings }
    end
  end

  describe '#get_invoice_items_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_invoice_items_by_filter }
    end
  end

  describe '#get_entity_invoices' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_entity_invoices }
      let(:args) { [:contact, random_id(:new_contact)] }
    end
  end

  describe '#update_invoice_item' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_invoice_item }
      let(:args) { [@data_collector[:invoice_item_ids].first, random_word, random_word, rand, random_word] }
    end
  end

  describe '#update_invoice_tax' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_invoice_tax }
      let(:args) { [random_id(:invoice_tax), random_word] }
    end
  end

  describe '#save_number_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :save_number_settings }
    end
  end

  describe '#save_terms_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :save_terms_settings }
    end
  end

  describe '#update_invoice_group_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_invoice_group_status }
      let(:args) { [INVOICE_STATUSES.sample, [@data_collector[:invoice_ids].sample]] }
    end
  end

  describe '#update_invoice_line' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_invoice_line }
      let(:args) { [random_id(:invoice_line), @data_collector[:invoice_ids].first, invoiceItemId: @data_collector[:invoice_item_ids].first] }
    end
  end

  describe '#delete_invoice_item' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_invoice_item }
      let(:args) { [@data_collector[:invoice_item_ids].pop] }
    end
  end

  describe '#delete_invoice_tax' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_invoice_tax }
      let(:args) { [@data_collector[:invoice_tax_ids].pop] }
    end
  end

  describe '#delete_invoice_line' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_invoice_line }
      let(:args) { [@data_collector[:invoice_line_ids].pop] }
    end
  end

  describe '#update_invoice' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_invoice }
      let(:args) do
        [@data_collector[:invoice_ids].first,
         issueDate: DUE_DATE,
         dueDate: DUE_DATE,
         contactId: random_id(:new_contact),
         language: LANGUAGE.sample,
         currency: CURRENCY.sample,
         exchangeRate: rand(1000),
         terms: random_word,
         invoiceLines: [{ invoiceItemID: @data_collector[:invoice_item_ids].first }]]
      end
    end
  end

  describe '#delete_invoice' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_invoice }
      let(:args) { [@data_collector[:invoice_ids].pop] }
    end
  end

  describe '#delete_batch_invoices' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_batch_invoices }
      let(:args) { [@data_collector[:invoice_ids].pop] }
    end
  end

  describe '#delete_batch_items' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_batch_items }
      let(:args) { [@data_collector[:invoice_item_ids].pop, @data_collector[:invoice_item_ids].pop] }
    end
  end
end
