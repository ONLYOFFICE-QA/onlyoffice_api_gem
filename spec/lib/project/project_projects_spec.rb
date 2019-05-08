require 'spec_helper'

describe '[Project] Projects' do
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

  describe '#get_projects' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_projects }
    end
  end

  describe '#get_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_project }
      let(:args) { [random_id(:project)] }
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

  describe '#get_project_files' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_project_files }
      let(:args) { [random_id(:project)] }
    end
  end

  describe '#get_milestones' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_milestones }
      let(:args) { [random_id(:project)] }
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
      let(:args) { [random_id(:project), random_word] }
    end
  end

  describe '#get_milestones_with_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_milestones_with_status }
      let(:args) { [random_id(:project), PROJECT_MILESTONE_STATUSES.sample] }
    end
  end

  describe '#update_project_tags' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_project_tags }
      let(:args) { [random_id(:project), random_word(3)] }
    end
  end

  describe '#update_project_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_project_status }
      let(:args) { [random_id(:project), PROJECT_STATUSES.sample] }
    end
  end

  describe '#follow_unfollow_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :follow_unfollow_project }
      let(:args) { [random_id(:project)] }
    end
  end

  describe '#update_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_project }
      let(:args) { [random_id(:project), random_word, random_id(:user), { private: random_bool, notify: random_bool }] }
    end
  end

  describe '#delete_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_project }
      let(:args) { [DATA_COLLECTOR[:project_ids].pop] }
    end
  end
end
