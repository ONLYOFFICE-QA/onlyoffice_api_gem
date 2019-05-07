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

  describe '#add_milestone' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_milestone }
      let(:args) { [random_id(:new_project), random_word, DateTime.commercial(2015).to_s, random_id(:user)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_milestone_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_task_comment' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_task_comment }
      let(:args) { [random_id(:project_task), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :comment_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_message_comment' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_message_comment }
      let(:args) { [random_id(:discussion), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :comment_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_comment' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_comment }
      let(:args) { [random_id(:comment)] }
    end
  end

  describe '#get_task_comments' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task_comments }
      let(:args) { [random_id(:project_task)] }
    end
  end

  describe '#get_message_comments' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_message_comments }
      let(:args) { [random_id(:discussion)] }
    end
  end

  describe '#update_comment' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_comment }
      let(:args) { [random_id(:comment), random_word] }
    end
  end

  describe '#get_milestones' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_milestones }
      let(:args) { [random_id(:new_project)] }
    end
  end

  describe '#get_tasks_by_ids' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_tasks_by_ids }
      let(:args) { [DATA_COLLECTOR[:project_task_ids].sample(rand(2..4))] }
    end
  end

  describe '#get_task_order' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task_order }
      let(:args) { [random_id(:new_project)] }
    end
  end

  describe '#get_simple_task_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_simple_task_by_filter }
      let(:args) { [random_id(:new_project)] }
    end
  end

  describe '#add_link' do
    it_should_behave_like 'an api request' do
      pending 'http://bugzserver/show_bug.cgi?id=23861'
      let(:command) { :add_link }
      let(:args) { [random_id(:project_task), random_id(:project_task), PROJECT_TASK_LINK_TYPES.sample] }
    end
  end

  describe '#update_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_project }
      let(:args) { [random_id(:new_project), random_word, random_id(:user), { private: random_bool, notify: random_bool }] }
    end
  end

  describe '#projects_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :projects_settings }
    end
  end
end
