# frozen_string_literal: true

require 'spec_helper'

describe '[Project] Discussions' do
  let(:teamlab_module) { :project }

  describe '#add_user' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :people }
      let(:command) { :add_user }
      let(:args) { [false, random_email, random_word.capitalize, random_word.capitalize] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :user_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_project' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :project }
      let(:command) { :create_project }
      let(:args) { [random_word, random_word, random_id(:user), random_word(3), random_bool] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_my_files' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :files }
      let(:command) { :get_my_files }
      let(:add_data_to_collector) { true }
      let(:data_param) { :my_documents_ids }
      let(:param_names) { %w[current id] }
    end
  end

  describe '#create_file' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :files }
      let(:command) { :create_file }
      let(:args) { [random_id(:my_documents), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :file_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_message' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_message }
      let(:args) { [random_id(:project), random_word, random_word, @data_collector[:user_ids].join(',')] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :discussion_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_task }
      let(:args) { [random_id(:project), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_task_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_task_files' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task_files }
      let(:args) { [random_id(:project_task)] }
    end
  end

  describe '#get_entity_files' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_entity_files }
      let(:args) { [random_id(:project_task), 'Task'] }
    end
  end

  describe '#get_message_files' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_message_files }
      let(:args) { [random_id(:discussion)] }
    end
  end

  describe '#upload_file_to_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :upload_file_to_task }
      let(:args) { [random_id(:project_task), [random_id(:file)]] }
    end
  end

  describe '#upload_file_to_message' do
    it_should_behave_like 'an api request' do
      let(:command) { :upload_file_to_message }
      let(:args) { [random_id(:discussion), [random_id(:file)]] }
    end
  end

  describe '#detach_file_from_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :detach_file_from_task }
      let(:args) { [random_id(:project_task), random_id(:file)] }
    end
  end

  describe '#detach_file_from_message' do
    it_should_behave_like 'an api request' do
      let(:command) { :detach_file_from_message }
      let(:args) { [random_id(:discussion), random_id(:file)] }
    end
  end
end
