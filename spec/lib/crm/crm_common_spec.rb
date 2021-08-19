# frozen_string_literal: true

require 'spec_helper'

currency_rate =  api.crm.create_currency_rate(CURRENCY.sample, CURRENCY.sample, rand(1.00..10.00)).data

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

  describe '#create_currency_rate' do
    it_behaves_like 'an api request' do
      let(:command) { :create_currency_rate }
      let(:args) { [CURRENCY.sample, CURRENCY.sample, rand(1.00..10.00)] }
    end
  end

  describe '#update_currency_rate' do
    it_behaves_like 'an api request' do
      let(:command) { :update_currency_rate }
      let(:args) { [currency_rate['id'], currency_rate['fromCurrency'], currency_rate['toCurrency'], rand(1.00..10.00)] }
    end
  end

  describe '#get_currency_rate_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_currency_rate_by_id }
      let(:args) { [currency_rate['id']] }
    end
  end

  describe '#get_currency_rate_by_currency' do
    it_behaves_like 'an api request' do
      let(:command) { :get_currency_rate_by_currency }
      let(:args) { [currency_rate['fromCurrency'], currency_rate['toCurrency']] }
    end
  end

  describe '#delete_currency_rate_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_currency_rate_by_id }
      let(:args) { [currency_rate['id']] }
    end
  end

  describe '#set_is_portal_configured' do
    it_behaves_like 'an api request' do
      let(:command) { :set_is_portal_configured }
      let(:args) { [{ configured: random_bool }] }
    end
  end
end
