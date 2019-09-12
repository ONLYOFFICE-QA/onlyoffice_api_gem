require_relative '../spec_helper'

describe '[Group]' do
  let(:teamlab_module) { :group }

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

  describe '#get_groups' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_groups }
    end
  end

  describe '#add_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_group }
      let(:args) { [random_id(:user), random_word, @data_collector[:user_ids]] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :group_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_group }
      let(:args) { [random_id(:group)] }
    end
  end

  describe '#replace_members' do
    it_should_behave_like 'an api request' do
      let(:command) { :replace_members }
      let(:args) { [random_id(:group), @data_collector[:user_ids]] }
    end
  end

  describe '#update_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_group }
      let(:args) { [random_id(:group), { groupManager: random_id(:user), groupName: random_word, members: @data_collector[:user_ids] }] }
    end
  end

  describe '#add_group_users' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_group_users }
      let(:args) { [random_id(:group), @data_collector[:user_ids]] }
    end
  end

  describe '#set_group_manager' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_group_manager }
      let(:args) { [random_id(:group), random_id(:user)] }
    end
  end

  describe '#move_group_members' do
    it_should_behave_like 'an api request' do
      let(:command) { :move_group_members }
      let(:args) { [random_id(:group), random_id(:group)] }
    end
  end

  describe '#remove_group_members' do
    it_should_behave_like 'an api request' do
      let(:command) { :remove_group_members }
      let(:args) { [random_id(:group)] }
    end
  end

  describe '#delete_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_group }
      let(:args) { [@data_collector[:group_ids].pop] }
    end
  end
end
