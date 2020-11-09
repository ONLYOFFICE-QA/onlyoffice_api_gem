# frozen_string_literal: true

require 'spec_helper'

describe '[Mail] Accounts' do
  let(:teamlab_module) { :mailserver }

  describe '#tenant_domain_list' do
    it_behaves_like 'an api request' do
      let(:command) { :tenant_domain_list }
    end
  end
end
