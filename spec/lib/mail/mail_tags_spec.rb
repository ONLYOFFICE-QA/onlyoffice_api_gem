# frozen_string_literal: true

require 'spec_helper'

describe '[Mail] Tags' do
  let(:teamlab_module) { :mail }

  describe '#create_tag' do
    it_behaves_like 'an api request' do
      let(:command) { :create_tag }
      let(:args) { [random_word(4), { style: rand(15) }] }
    end
  end

  describe '#get_tag_list' do
    it_behaves_like 'an api request' do
      let(:command) { :get_tag_list }
    end
  end
end
