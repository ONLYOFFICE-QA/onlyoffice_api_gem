# frozen_string_literal: true

require 'spec_helper'

describe '[Project] Tags' do
  let(:teamlab_module) { :project }

  describe '#get_project_tags' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_project_tags }
    end
  end

  describe '#get_project_by_tag' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_project_by_tag }
      let(:args) { [random_word(4)] }
    end
  end

  describe '#get_tags_by_name' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_tags_by_name }
      let(:args) { [random_word(4)] }
    end
  end
end
