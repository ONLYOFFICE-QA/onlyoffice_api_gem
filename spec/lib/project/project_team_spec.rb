require 'spec_helper'

describe '[Project] Team' do
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

  describe '#get_project_team' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_project_team }
      let(:args) { [random_id(:project)] }
    end
  end

  describe '#get_projects_teams' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_projects_teams }
      let(:args) { [@data_collector[:project_ids].sample(rand(2..4))] }
    end
  end

  describe '#add_to_team' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_to_team }
      let(:args) { [random_id(:project), random_id(:user)] }
    end
  end

  describe '#update_project_team' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_project_team }
      let(:args) { [random_id(:project), @data_collector[:user_ids].sample(rand(2..4)), { notify: random_bool }] }
    end
  end

  describe '#set_team_security' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_team_security }
      let(:args) { [random_id(:project), random_id(:user), PROJECT_SECURITY_RIGHTS.sample] }
    end
  end

  describe '#remove_from_team' do
    it_should_behave_like 'an api request' do
      let(:command) { :remove_from_team }
      let(:args) { [random_id(:project), random_id(:user)] }
    end
  end
end
