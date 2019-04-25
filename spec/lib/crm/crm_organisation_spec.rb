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
    it_should_behave_like 'an api request', :skip do
      skip 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=39993'
      let(:command) { :update_organisation_address }
      let(:args) { [random_word] }
    end
  end
end
