# frozen_string_literal: true

require 'spec_helper'

discussion_user = api.people.add_user(false, random_email, random_word.capitalize, random_word.capitalize).data
discussion_project = api.project.create_project(random_word, random_word, discussion_user['id'], random_word(3), false).data
discussion = api.project.add_message(discussion_project['id'], random_word, random_word, discussion_user['id']).data
discussion_status = 'Open'

describe '[Project] Discussions' do
  let(:teamlab_module) { :project }

  describe '#add_message' do
    it_behaves_like 'an api request' do
      let(:command) { :add_message }
      let(:args) { [discussion_project['id'], random_word, random_word, discussion_user['id']] }
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
      let(:args) { [{ projectId: discussion_project['id'] }] }
    end
  end

  describe '#get_messages' do
    it_behaves_like 'an api request' do
      let(:command) { :get_messages }
      let(:args) { [discussion_project['id']] }
    end
  end

  describe '#get_project_message' do
    it_behaves_like 'an api request' do
      let(:command) { :get_project_message }
      let(:args) { [discussion['id']] }
    end
  end

  describe '#check_subscription_to_discussion' do
    it_behaves_like 'an api request' do
      let(:command) { :check_subscription_to_discussion }
      let(:args) { [discussion['id']] }
    end
  end

  describe '#update_message' do
    it_behaves_like 'an api request' do
      let(:command) { :update_message }
      let(:args) { [discussion['id'], discussion_project['id'], random_word, random_word] }
    end
  end

  describe '#update_message_status' do
    it_behaves_like 'an api request' do
      let(:command) { :update_message_status }
      let(:args) { [discussion['id'], discussion_status] }
    end
  end

  describe '#subscribe_to_message_action' do
    it_behaves_like 'an api request' do
      let(:command) { :subscribe_to_message_action }
      let(:args) { [discussion['id']] }
    end
  end

  describe '#get_discussion_subscribers' do
    it_behaves_like 'an api request' do
      let(:command) { :get_discussion_subscribers }
      let(:args) { [discussion['id']] }
    end
  end

  describe '#delete_message' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_message }
      let(:args) { [discussion['id']] }
    end
  end

  describe '#preview_of_discussion_message' do
    it_behaves_like 'an api request' do
      let(:command) { :preview_of_discussion_message }
      let(:args) { ['<!-- This is a discission message -->'] }
    end
  end
end
