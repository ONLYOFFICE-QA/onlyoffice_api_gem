# frozen_string_literal: true

require 'spec_helper'

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#update_organisation_company_name' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_organisation_company_name }
      let(:args) { [random_word] }
    end
  end

  describe '#update_organisation_address' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_organisation_address }
      let(:args) do
        [street: random_word,
         city: random_word,
         state: random_word,
         zip: random_word,
         country: random_word]
      end
    end
  end
end
