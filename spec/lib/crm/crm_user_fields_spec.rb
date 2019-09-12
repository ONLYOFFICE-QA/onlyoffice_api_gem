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
      let(:data_param) { :contact_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_user_field' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_user_field }
      let(:args) { [ENTITY_TYPES.last, random_word, 3] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :user_field_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_company' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_company }
      let(:args) { [random_word, [random_id(:user)]] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :company_ids }
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

  describe '#get_user_field_values' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_user_field_values }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym)] }
    end
  end

  describe '#get_user_field_list' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_user_field_list }
      let(:args) { [ENTITY_TYPES.sample.sub('company', 'contact')] }
    end
  end

  describe '#set_user_field_value' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_user_field_value }
      let(:args) { [ENTITY_TYPES.last, random_id(ENTITY_TYPES.last.to_sym), random_id(:user_field), random_word] }
    end
  end

  describe '#update_selected_user_field' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_selected_user_field }
      i = -1
      let(:args) { [ENTITY_TYPES.last, @data_collector[:user_field_ids][i += 1], random_word, 3] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :user_field_title_ids }
      let(:param_names) { %w[label] }
    end
  end

  describe '#update_user_fields_order' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_user_fields_order }
      let(:args) { [ENTITY_TYPES.last, @data_collector[:user_field_ids]] }
    end
  end

  describe '#delete_user_field' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_user_field }
      let(:args) { [ENTITY_TYPES.last, @data_collector[:user_field_ids].pop] }
    end
  end
end
