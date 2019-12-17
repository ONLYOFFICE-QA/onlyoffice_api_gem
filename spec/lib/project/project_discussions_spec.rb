# frozen_string_literal: true

require 'spec_helper'

describe '[Project] Discussions' do
  let(:teamlab_module) { :project }

  describe '#add_user' do
    it_behaves_like 'an api request' do
      let(:teamlab_module) { :people }
      let(:command) { :add_user }
      let(:args) { [false, random_email, random_word.capitalize, random_word.capitalize] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :user_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_project' do
    it_behaves_like 'an api request' do
      let(:teamlab_module) { :project }
      let(:command) { :create_project }
      let(:args) { [random_word, random_word, random_id(:user), random_word(3), random_bool] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_message' do
    it_behaves_like 'an api request' do
      let(:command) { :add_message }
      let(:args) { [random_id(:project), random_word, random_word, @data_collector[:user_ids].join(',')] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :discussion_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_latest_discussion_messages' do
    it_behaves_like 'an api request' do
      let(:command) { :get_latest_discussion_messages }
    end
  end

  describe '#get_message_by_filter' do
    it_behaves_like 'an api request' do
      let(:command) { :get_message_by_filter }
      let(:args) { [{ projectId: random_id(:project) }] }
    end
  end

  describe '#get_messages' do
    it_behaves_like 'an api request' do
      let(:command) { :get_messages }
      let(:args) { [random_id(:project)] }
    end
  end

  describe '#check_subscription_to_discussion' do
    it_behaves_like 'an api request' do
      let(:command) { :check_subscription_to_discussion }
      let(:args) { [random_id(:discussion)] }
    end
  end

  describe '#update_message' do
    it_behaves_like 'an api request' do
      let(:command) { :update_message }
      let(:args) { [random_id(:discussion), random_id(:project), random_word, random_word] }
    end
  end

  describe '#update_message_status' do
    it_behaves_like 'an api request' do
      let(:command) { :update_message_status }
      let(:args) { [random_id(:discussion), PROJECT_DISCUSSION_STATUSES.sample] }
    end
  end

  describe '#subscribe_to_message_action' do
    it_behaves_like 'an api request' do
      let(:command) { :subscribe_to_message_action }
      let(:args) { [random_id(:discussion)] }
    end
  end
end
