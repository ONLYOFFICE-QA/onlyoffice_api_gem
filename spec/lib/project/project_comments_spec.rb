require 'spec_helper'

describe '[Project] Comments' do
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

  describe '#add_message' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_message }
      let(:args) { [random_id(:project), random_word, random_word, DATA_COLLECTOR[:user_ids].join(',')] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :discussion_ids }
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

  describe '#delete_message_comments' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_comment }
      let(:args) { [DATA_COLLECTOR[:comment_ids].pop] }
    end
  end
end
