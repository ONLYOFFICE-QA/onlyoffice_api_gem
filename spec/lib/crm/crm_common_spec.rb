# frozen_string_literal: true

require 'spec_helper'

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#get_curreny_list' do
    it_behaves_like 'an api request' do
      let(:command) { :get_currency_list }
    end
  end

  describe '#get_result_of_convertation' do
    it_behaves_like 'an api request' do
      let(:command) { :get_result_of_convertation }
    end
  end

  describe '#get_summary_table' do
    it_behaves_like 'an api request' do
      let(:command) { :get_summary_table }
      let(:args) { [CURRENCY.sample] }
    end
  end

  describe '#update_crm_currency' do
    it_behaves_like 'an api request' do
      let(:command) { :update_crm_currency }
      let(:args) { [CURRENCY.sample] }
    end
  end

  describe '#get_all_currency_rates' do
    it_behaves_like 'an api request' do
      let(:command) { :get_all_currency_rates }
    end
  end

  describe '#set_currency_rate' do
    it_behaves_like 'an api request' do
      let(:command) { :set_currency_rate }
      let(:args) { [CURRENCY.sample, CURRENCY.sample, rand(1.00..10.00)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :new_currency_rate_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_currency_rate_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_currency_rate_by_id }
      let(:args) { [random_id(:new_currency_rate)] }
    end
  end

  describe '#delete_currency_rate_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_currency_rate_by_id }
      let(:args) { [@data_collector[:new_currency_rate_ids].pop] }
    end
  end

  describe '#set_is_portal_configured' do
    it_behaves_like 'an api request' do
      let(:command) { :set_is_portal_configured }
      let(:args) { [{ configured: random_bool }] }
    end
  end
end
