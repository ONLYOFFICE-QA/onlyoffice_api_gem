# frozen_string_literal: true

require 'spec_helper'

describe '[Mail] Settings' do
  let(:teamlab_module) { :mail }

  describe '#always_display_images' do
    it_behaves_like 'an api request' do
      let(:command) { :always_display_images }
    end
  end

  describe '#set_always_display_images' do
    it_behaves_like 'an api request' do
      let(:command) { :set_always_display_images }
      let(:args) { [true] }
    end
  end
end
