# frozen_string_literal: true

require 'spec_helper'

describe '[CRM]' do
  let(:teamlab_module) { :crm }

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

  describe '#create_person' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :crm }
      let(:command) { :create_person }
      let(:args) { [random_word.capitalize, random_word.capitalize] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :new_contact_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_opportunity_stage' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :crm }
      let(:command) { :create_opportunity_stage }
      let(:args) { [random_word.capitalize, COLORS_NAMES.sample] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :opportunity_stage_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_opportunity_stage' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :crm }
      let(:command) { :create_opportunity_stage }
      let(:args) { [random_word.capitalize, COLORS_NAMES.sample] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :opportunity_stage_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_opportunity' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_opportunity }
      let(:args) { [@data_collector[:opportunity_stage_ids].last, random_word, random_id(:user)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :opportunity_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_opportunity_for_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_opportunity }
      let(:args) { [@data_collector[:opportunity_stage_ids].last, random_word, random_id(:user)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :opportunity_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_opportunity_contact' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_opportunity_contact }
      i = -1
      let(:args) { [@data_collector[:opportunity_ids].last, @data_collector[:new_contact_ids][i += 1]] }
    end
  end

  describe '#get_all_opportunity_stages' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_opportunity_stages }
    end
  end

  describe '#get_opportunity_list' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_opportunity_list }
    end
  end

  describe '#get_opportunity_stage' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_opportunity_stage }
      let(:args) { [random_id(:opportunity_stage)] }
    end
  end

  describe '#get_opportunity_by_id' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_opportunity_by_id }
      let(:args) { [random_id(:opportunity)] }
    end
  end

  describe '#get_all_opportunity_contacts' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_opportunity_contacts }
      let(:args) { [random_id(:opportunity)] }
    end
  end

  describe '#set_opportunity_access_rights' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_opportunity_access_rights }
      let(:args) { [[random_id(:opportunity)], random_bool, random_id(:user)] }
    end
  end

  describe '#update_opportunity_stage' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_opportunity_stage }
      let(:args) { [@data_collector[:opportunity_stage_ids].first, random_word, COLORS_NAMES.sample] }
    end
  end

  describe '#update_opportunity_stages_order' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_opportunity_stages_order }
      let(:args) { [@data_collector[:opportunity_stage_ids].sample(rand(1..3))] }
    end
  end

  describe '#set_opportunity_access_rights_for_users' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_opportunity_access_rights_for_users }
    end
  end

  describe '#update_opportunity_to_stage' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_opportunity_to_stage }
      let(:args) { [random_id(:opportunity), @data_collector[:opportunity_stage_ids].last] }
    end
  end

  describe '#delete_opportunity_contact' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_opportunity_contact }
      i = -1
      let(:args) { [@data_collector[:opportunity_ids].last, @data_collector[:new_contact_ids][i += 1]] }
    end
  end

  describe '#delete_opportunity_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_opportunity_group }
      let(:args) { [@data_collector[:opportunity_ids].pop] }
    end
  end

  describe '#delete_opportunity' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_opportunity }
      let(:args) { [@data_collector[:opportunity_ids].pop] }
    end
  end

  describe '#delete_opportunity_group_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_opportunity_group_by_filter }
    end
  end

  describe '#delete_opportunity_stage' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_opportunity_stage }
      let(:args) { [@data_collector[:opportunity_stage_ids].pop] }
    end
  end
end
