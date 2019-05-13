require 'spec_helper'

describe '[Mail] Messages' do
  let(:teamlab_module) { :mail }

  describe '#get_filtered_messages' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_filtered_messages }
      let(:args) { [1] }
    end
  end

  describe '#get_message' do
    it_should_behave_like 'an api request', :pending do
      pending('TODO: Correctly connect account to have list of messages')
      let(:command) { :get_message }
      let(:args) { 1 }
    end
  end

  describe '#get_message_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_message_template }
    end
  end
end
