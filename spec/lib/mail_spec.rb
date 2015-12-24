require_relative '../spec_helper'

describe '[Mail]' do

  let(:teamlab_module) { :mail }

  before :all do
    Teamlab.configure do |config|
      config.server = SERVER
      config.username = USERNAME
      config.password = PASSWORD
    end
  end

  describe '#create_tag' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_tag }
      let(:args) { [random_word(4), { style: rand(15) }] }
    end
  end

  describe '#create_account_by_email' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_account_by_email }
      let(:args) { [USERNAME, PASSWORD] }
    end
  end

  describe '#get_filtered_messages' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_filtered_messages }
      let(:args) { [2] }
    end
  end

  describe '#get_message' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_message }
      let(:args) {message_id}
    end
  end

  describe '#get_message_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_message_template }
    end
  end

  describe '#get_account_list' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_account_list }
    end
  end

  describe '#get_tag_list' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_tag_list }
    end
  end
end
