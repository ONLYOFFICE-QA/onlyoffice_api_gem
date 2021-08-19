# frozen_string_literal: true

module Teamlab
  # Methods for working with crm common methods
  module CrmCommon
    def get_currency_list
      @request.get(%w[settings currency])
    end

    def get_result_of_convertation(options = {})
      @request.get(%w[settings currency convert], options)
    end

    def get_summary_table(currency)
      @request.get(%w[settings currency summarytable], currency: currency)
    end

    def update_crm_currency(currency)
      @request.put(%w[settings currency], currency: currency)
    end

    def get_all_currency_rates
      @request.get(%w[currency rates], {})
    end

    def create_currency_rate(from = 'EUR', to = 'USD', rate = '1.0')
      @request.post(%w[currency rates], fromCurrency: from, toCurrency: to, rate: rate)
    end

    def get_currency_rate_by_id(id)
      @request.get(['currency', 'rates', id.to_s], {})
    end

    # Get currency rate by currencies
    # @param from_currency [String] rate from currency
    # @param to_currency [String] rate to currency
    # @return [Hash] currency rate data
    def get_currency_rate_by_currency(from_currency, to_currency)
      @request.get(['currency', 'rates', from_currency.to_s, to_currency.to_s])
    end

    def delete_currency_rate_by_id(id)
      @request.delete(['currency', 'rates', id.to_s], {})
    end

    def set_is_portal_configured(options = {})
      @request.put(%w[settings], options)
    end

    # Update currency rate object
    # @param id [String] id of rate currency
    # @param from [String] rate from currency
    # @param to [String] rate to currency
    # @param rate [String] currency rate
    # @return [Hash] currency and rate data
    def update_currency_rate(id, from, to, rate)
      @request.put(['currency', 'rates', id.to_s], fromCurrency: from, toCurrency: to, rate: rate)
    end
  end
end
