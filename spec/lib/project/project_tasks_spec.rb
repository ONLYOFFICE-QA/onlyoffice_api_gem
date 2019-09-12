require 'spec_helper'

describe '[Project] Tasks' do
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

  describe '#add_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_task }
      let(:args) { [random_id(:project), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_task_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_task_from_discussion' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_task_from_discussion }
      let(:args) { [random_id(:project), random_id(:discussion)] }
    end
  end

  describe '#create_subtask' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_subtask }
      let(:args) { [@data_collector[:project_task_ids].last, random_id(:user), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_subtask_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_my_tasks' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_my_tasks }
    end
  end

  describe '#get_task_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task_by_filter }
      let(:args) { [{ participant: random_id(:user) }] }
    end
  end

  describe '#get_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task }
      let(:args) { [random_id(:project_task)] }
    end
  end

  describe '#get_tasks' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_tasks }
      let(:args) { [random_id(:project)] }
    end
  end

  describe '#get_my_tasks_by_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_my_tasks_by_status }
      let(:args) { [PROJECT_TASKS_STATUSES.sample] }
    end
  end

  describe '#notify_task_responsible' do
    it_should_behave_like 'an api request' do
      let(:command) { :notify_task_responsible }
      let(:args) { [random_id(:project_task)] }
    end
  end

  describe '#get_all_tasks' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_tasks }
      let(:args) { [random_id(:project)] }
    end
  end

  describe '#get_tasks_with_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_tasks_with_status }
      let(:args) { [random_id(:project), PROJECT_TASKS_STATUSES.sample] }
    end
  end

  describe '#add_link' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_link }
      let(:args) { [@data_collector[:project_task_ids][0], @data_collector[:project_task_ids][1], PROJECT_TASK_LINK_TYPES.first] }
    end
  end

  describe '#update_project_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_project_task }
      let(:args) { [random_id(:project_task), random_word] }
    end
  end

  describe '#update_subtask' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_subtask }
      let(:args) { [@data_collector[:project_task_ids].last, random_id(:project_subtask), random_id(:user), random_word] }
    end
  end

  describe '#update_subtask_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_subtask_status }
      let(:args) { [@data_collector[:project_task_ids].last, random_id(:project_subtask), PROJECT_TASKS_STATUSES.sample] }
    end
  end

  describe '#delete_subtask' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_subtask }
      let(:args) { [@data_collector[:project_task_ids].last, @data_collector[:project_subtask_ids].pop] }
    end
  end

  describe '#update_task_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_task_status }
      let(:args) { [random_id(:project_task), PROJECT_TASKS_STATUSES.sample] }
    end
  end

  describe '#delete_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_task }
      let(:args) { [@data_collector[:project_task_ids].pop] }
    end
  end
end
