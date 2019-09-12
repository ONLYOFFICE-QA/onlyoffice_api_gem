require 'spec_helper'

describe '[Project] Time' do
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

  describe '#add_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_task }
      let(:args) { [random_id(:project), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_task_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_task_time' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_task_time }
      let(:args) { [random_id(:project_task), Time.now.strftime('%Y-%m-%-d'), random_id(:user), @data_collector[:project_ids].last] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_task_time_ids }
      let(:param_names) { %w[id] }
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
      let(:args) { [@data_collector[:project_task_time_ids].sample(rand(2..4)), PROJECT_TASK_TIME_STATUSES.sample] }
    end
  end

  describe '#delete_time_spents' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_time_spents }
      let(:args) { [@data_collector[:project_task_time_ids].pop] }
    end
  end
end
