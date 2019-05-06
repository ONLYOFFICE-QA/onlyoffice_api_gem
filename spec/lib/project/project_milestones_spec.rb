require 'spec_helper'

describe '[Project] Milestones' do
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

  describe '#add_milestone' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_milestone }
      let(:args) { [random_id(:project), random_word, DateTime.commercial(2015).to_s, random_id(:user)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_milestone_ids }
      let(:param_names) { %w[id] }
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
      let(:args) { [{ projectid: random_id(:project) }] }
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

  describe '#delete_milestone' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_milestone }
      let(:args) { [DATA_COLLECTOR[:project_milestone_ids].pop] }
    end
  end
end
