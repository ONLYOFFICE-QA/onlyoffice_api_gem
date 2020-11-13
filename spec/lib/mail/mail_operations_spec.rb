# frozen_string_literal: true

require 'spec_helper'

describe '[Mail] Operations' do
  let(:teamlab_module) { :mail }

  describe '#operations' do
    it_behaves_like 'an api request' do
      let(:command) { :operations }
    end
  end
end
