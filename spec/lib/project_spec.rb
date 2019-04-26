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

  describe '#create_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_template }
      let(:args) { [random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_template_ids }
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

  describe '#create_subtask' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_subtask }
      let(:args) { [DATA_COLLECTOR[:project_task_ids].last, random_id(:user), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_subtask_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_task_time' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_task_time }
      let(:args) { [random_id(:project_task), Time.now.strftime('%Y-%m-%-d'), random_id(:user), DATA_COLLECTOR[:new_project_ids].last] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_task_time_ids }
      let(:param_names) { %w[id] }
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

  describe '#create_report_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_report_template }
      let(:args) { [random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :report_template_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#update_report_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_report_template }
      let(:args) { [random_id(:report_template), random_word] }
    end
  end

  describe '#delete_report_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_report_template }
      let(:args) { [DATA_COLLECTOR[:report_template_ids].pop] }
    end
  end

  describe '#get_projects' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_projects }
    end
  end

  describe '#get_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_project }
      let(:args) { [random_id(:new_project)] }
    end
  end

  describe '#get_participated_projects' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_participated_projects }
    end
  end

  describe '#filter_projects' do
    it_should_behave_like 'an api request' do
      let(:command) { :filter_projects }
    end
  end

  describe '#get_followed_projects' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_followed_projects }
    end
  end

  describe '#get_project_by_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_project_by_status }
      let(:args) { [PROJECT_STATUSES.sample] }
    end
  end

  describe '#get_templates' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_templates }
    end
  end

  describe '#get_spent_time' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_spent_time }
      let(:args) { [random_id(:new_project)] }
    end
  end

  describe '#get_project_files' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_project_files }
      let(:args) { [random_id(:new_project)] }
    end
  end

  describe '#get_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_template }
      let(:args) { [random_id(:project_template)] }
    end
  end

  describe '#get_milestones' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_milestones }
      let(:args) { [random_id(:new_project)] }
    end
  end

  describe '#search_all_projects' do
    it_should_behave_like 'an api request' do
      let(:command) { :search_all_projects }
      let(:args) { [random_word] }
    end
  end

  describe '#search_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :search_project }
      let(:args) { [random_id(:new_project), random_word] }
    end
  end

  describe '#get_milestones_with_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_milestones_with_status }
      let(:args) { [random_id(:new_project), PROJECT_MILESTONE_STATUSES.sample] }
    end
  end

  describe '#update_project_tags' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_project_tags }
      let(:args) { [random_id(:new_project), random_word(3)] }
    end
  end

  describe '#update_project_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_project_status }
      let(:args) { [random_id(:new_project), PROJECT_STATUSES.sample] }
    end
  end

  describe '#update_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_template }
      let(:args) { [random_id(:project_template), random_word] }
    end
  end

  describe '#follow_unfollow_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :follow_unfollow_project }
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

  describe '#set_task_order' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_task_order }
      let(:args) { [random_id(:new_project), '123456'] }
    end
  end

  describe '#update_project_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_project_task }
      let(:args) { [random_id(:project_task), random_word] }
    end
  end

  describe '#get_project_team' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_project_team }
      let(:args) { [random_id(:new_project)] }
    end
  end

  describe '#get_projects_teams' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_projects_teams }
      let(:args) { [DATA_COLLECTOR[:new_project_ids].sample(rand(2..4))] }
    end
  end

  describe '#add_to_team' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_to_team }
      let(:args) { [random_id(:new_project), random_id(:user)] }
    end
  end

  describe '#update_project_team' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_project_team }
      let(:args) { [random_id(:new_project), DATA_COLLECTOR[:user_ids].sample(rand(2..4)), { notify: random_bool }] }
    end
  end

  describe '#set_team_security' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_team_security }
      let(:args) { [random_id(:new_project), random_id(:user), PROJECT_SECURITY_RIGHTS.sample] }
    end
  end

  describe '#remove_from_team' do
    it_should_behave_like 'an api request' do
      let(:command) { :remove_from_team }
      let(:args) { [random_id(:new_project), random_id(:user)] }
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
      let(:args) { [random_id(:new_project)] }
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
      let(:args) { [random_id(:new_project)] }
    end
  end

  describe '#get_tasks_with_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_tasks_with_status }
      let(:args) { [random_id(:new_project), PROJECT_TASKS_STATUSES.sample] }
    end
  end

  describe '#update_task_status' do
    it_should_behave_like 'an api request' do
      pending 'http://bugzserver/show_bug.cgi?id=23860'
      let(:command) { :update_task_status }
      let(:args) { [random_id(:project_task), PROJECT_TASKS_STATUSES.sample] }
    end
  end

  describe '#update_subtask' do
    it_should_behave_like 'an api request' do
      pending 'http://bugzserver/show_bug.cgi?id=23860'
      let(:command) { :update_subtask }
      let(:args) { [DATA_COLLECTOR[:project_task_ids].last, random_id(:project_subtask), random_id(:user), random_word] }
    end
  end

  describe '#update_subtask_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_subtask_status }
      let(:args) { [DATA_COLLECTOR[:project_task_ids].last, random_id(:project_subtask), PROJECT_TASKS_STATUSES.sample] }
    end
  end

  describe '#get_project_tags' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_project_tags }
    end
  end

  describe '#get_project_by_tag' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_project_by_tag }
      let(:args) { [random_word(4)] }
    end
  end

  describe '#get_tags_by_name' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_tags_by_name }
      let(:args) { [random_word(4)] }
    end
  end

  describe '#get_upcoming_milestones' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_upcoming_milestones }
    end
  end

  describe '#get_overdue_milestones' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_overdue_milestones }
    end
  end

  describe '#get_milestone' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_milestone }
      let(:args) { [random_id(:project_milestone)] }
    end
  end

  describe '#get_milestones_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_milestones_by_filter }
      let(:args) { [{ projectid: random_id(:new_project) }] }
    end
  end

  describe '#get_milestone_tasks' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_milestone_tasks }
      let(:args) { [random_id(:project_milestone)] }
    end
  end

  describe '#get_milestones_by_month' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_milestones_by_month }
      let(:args) { [rand(2000..Time.now.year.to_i), rand(1..12)] }
    end
  end

  describe '#get_milestones_by_full_date' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_milestones_by_full_date }
      let(:args) { [rand(2000..Time.now.year.to_i), rand(1..12), rand(1..31)] }
    end
  end

  describe '#update_milestone' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_milestone }
      let(:args) { [random_id(:project_milestone), random_word, DateTime.commercial(2015).to_s] }
    end
  end

  describe '#update_milestone_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_milestone_status }
      let(:args) { [random_id(:project_milestone), PROJECT_MILESTONE_STATUSES.sample] }
    end
  end

  describe '#get_time_spent_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_time_spent_by_filter }
    end
  end

  describe '#get_total_time_spent_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_total_time_spent_by_filter }
    end
  end

  describe '#get_time_spent' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_time_spent }
      let(:args) { [random_id(:project_task)] }
    end
  end

  describe '#update_task_time' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_task_time }
      let(:args) { [random_id(:project_task_time), Time.now.strftime('%Y-%m-%-d'), random_id(:user)] }
    end
  end

  describe '#update_time_status_of_payment' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_time_status_of_payment }
      let(:args) { [DATA_COLLECTOR[:project_task_time_ids].sample(rand(2..4)), PROJECT_TASK_TIME_STATUSES.sample] }
    end
  end

  describe '#delete_time_spents' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_time_spents }
      let(:args) { [DATA_COLLECTOR[:project_task_time_ids].pop] }
    end
  end

  describe '#delete_subtask' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_subtask }
      let(:args) { [DATA_COLLECTOR[:project_task_ids].last, DATA_COLLECTOR[:project_subtask_ids].pop] }
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
      let(:command) { :detach_file_from_task }
      let(:args) { [random_id(:discussion), random_id(:file)] }
    end
  end

  describe '#delete_message_comments' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_comment }
      let(:args) { [DATA_COLLECTOR[:comment_ids].pop] }
    end
  end

  describe '#delete_milestone' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_milestone }
      let(:args) { [DATA_COLLECTOR[:project_milestone_ids].pop] }
    end
  end

  describe '#delete_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_task }
      let(:args) { [DATA_COLLECTOR[:project_task_ids].pop] }
    end
  end

  describe '#delete_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_project }
      let(:args) { [DATA_COLLECTOR[:new_project_ids].pop] }
    end
  end

  describe '#delete_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_template }
      let(:args) { [DATA_COLLECTOR[:project_template_ids].pop] }
    end
  end

  describe '#projects_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :projects_settings }
    end
  end
end
