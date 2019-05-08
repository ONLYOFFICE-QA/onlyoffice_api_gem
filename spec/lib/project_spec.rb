require_relative '../spec_helper'

describe '[Project]' do
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

  describe '#add_importing_url_to_queue' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_importing_url_to_queue }
      let(:args) { [BASECAMP_URL, BASECAMP_LOGIN, BASECAMP_PSW, IMPORT_CLOSED_PROJECTS, DISABLE_NOTIFICATONS, IMPORT_USERS_AS_COLLABORATORS] }
    end
  end

  describe '#get_projects_for_import' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_projects_for_import }
      let(:args) { [BASECAMP_URL, BASECAMP_LOGIN, BASECAMP_PSW] }
    end
  end

  describe '#get_import_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_import_status }
    end
  end

  describe '#create_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_project }
      let(:args) { [random_word, random_word, random_id(:user), random_word(3), random_bool, { participants: DATA_COLLECTOR[:user_ids] }] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :new_project_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_task }
      let(:args) { [random_id(:new_project), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_task_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_task_from_discussion' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_task_from_discussion }
      let(:args) { [random_id(:new_project), random_id(:discussion)] }
    end
  end
end
