# frozen_string_literal: true

require 'spec_helper'

comments_user = api.people.add_user(false, random_email, random_word.capitalize, random_word.capitalize).data
comments_project = api.project.create_project(random_word, random_word, comments_user['id'], random_word(3), random_bool).data
comments_task = api.project.add_task(comments_project['id'], random_word).data
discussion = api.project.add_message(comments_project['id'], random_word, random_word, comments_user['id']).data
task_comment = api.project.add_task_comment(comments_task['id'], random_word).data
type = 'task'

describe '[Project] Comments' do
  let(:teamlab_module) { :project }

  describe '#add_task_comment' do
    it_behaves_like 'an api request' do
      let(:command) { :add_task_comment }
      let(:args) { [comments_task['id'], random_word] }
    end
  end

  describe '#add_message_comment' do
    it_behaves_like 'an api request' do
      let(:command) { :add_message_comment }
      let(:args) { [discussion['id'], random_word] }
    end
  end

  describe '#get_comment' do
    it_behaves_like 'an api request' do
      let(:command) { :get_comment }
      let(:args) { [task_comment['id']] }
    end
  end

  describe '#get_task_comments' do
    it_behaves_like 'an api request' do
      let(:command) { :get_task_comments }
      let(:args) { [comments_task['id']] }
    end
  end

  describe '#get_message_comments' do
    it_behaves_like 'an api request' do
      let(:command) { :get_message_comments }
      let(:args) { [discussion['id']] }
    end
  end

  describe '#add_project_comment' do
    it_behaves_like 'an api request' do
      let(:command) { :add_project_comment }
      let(:args) { [comments_task['id'], random_word, type] }
    end
  end

  describe '#get_a_comment_preview' do
    it_behaves_like 'an api request' do
      let(:command) { :get_a_comment_preview }
      let(:args) { ['<!-- This is a comment -->'] }
    end
  end

  describe '#update_comment' do
    it_behaves_like 'an api request' do
      let(:command) { :update_comment }
      let(:args) { [task_comment['id'], random_word] }
    end
  end

  describe '#delete_message_comments' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_comment }
      let(:args) { [task_comment['id']] }
    end
  end
end
