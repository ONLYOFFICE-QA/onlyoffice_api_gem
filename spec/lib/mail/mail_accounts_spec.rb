# frozen_string_literal: true

require 'spec_helper'

describe '[Mail] Accounts' do
  let(:teamlab_module) { :mail }

  describe '#create_account_by_email' do
    it_behaves_like 'an api request' do
      let(:command) { :create_account_by_email }
      let(:args) { [EMAIL, EMAIL_PASS] }
    end
  end

  describe '#set_default_account' do
    it_behaves_like 'an api request' do
      let(:command) { :set_default_account }
      let(:args) { [EMAIL, true] }
    end
  end

  describe '#get_account_list' do
    it_behaves_like 'an api request' do
      let(:command) { :get_account_list }
    end
  end
end
