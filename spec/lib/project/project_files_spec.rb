# frozen_string_literal: true

require 'spec_helper'

files_user = api.people.add_user(false, random_email, random_word.capitalize, random_word.capitalize).data
files_project = api.project.create_project(random_word, random_word, files_user['id'], random_word(3), false).data
files_discussion = api.project.add_message(files_project['id'], random_word, random_word, files_user['id']).data
files_task = api.project.add_task(files_project['id'], random_word).data
my_files = api.files.get_my_files.data
new_file = api.files.create_file(my_files['current']['id'], random_word).data

describe '[Project] Discussions' do
  let(:teamlab_module) { :project }

  describe '#upload_file_to_task' do
    it_behaves_like 'an api request' do
      let(:command) { :upload_file_to_task }
      let(:args) { [files_task['id'], [new_file]] }
    end
  end

  describe '#upload_file_to_message' do
    it_behaves_like 'an api request' do
      let(:command) { :upload_file_to_message }
      let(:args) { [files_discussion['id'], [new_file]] }
    end
  end

  describe '#get_task_files' do
    it_behaves_like 'an api request' do
      let(:command) { :get_task_files }
      let(:args) { [files_task['id']] }
    end
  end

  describe '#get_entity_files' do
    it_behaves_like 'an api request' do
      let(:command) { :get_entity_files }
      let(:args) { [files_task['id'], 'Task'] }
    end
  end

  describe '#get_message_files' do
    it_behaves_like 'an api request' do
      let(:command) { :get_message_files }
      let(:args) { [files_discussion['id']] }
    end
  end

  describe '#detach_file_from_task' do
    it_behaves_like 'an api request' do
      let(:command) { :detach_file_from_task }
      let(:args) { [files_task['id'], new_file['id']] }
    end
  end

  describe '#detach_file_from_message' do
    it_behaves_like 'an api request' do
      let(:command) { :detach_file_from_message }
      let(:args) { [files_discussion['id'], new_file['id']] }
    end
  end
end
