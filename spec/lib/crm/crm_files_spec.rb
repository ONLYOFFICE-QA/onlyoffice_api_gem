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
      let(:args) { [random_id(:opportunity_stage), random_word, random_id(:user)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :opportunity_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_root_folder_id' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_root_folder_id }
    end
  end

  describe '#get_file_list' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_file_list }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym)] }
    end
  end

  describe '#create_txt' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_txt }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym), random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :file_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#upload_file' do
    it_should_behave_like 'an api request' do
      let(:command) { :upload_file }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym), FILE_FOR_UPLOAD] }
    end
  end

  describe '#associate_file_with_entity' do
    it_should_behave_like 'an api request' do
      let(:command) { :associate_file_with_entity }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym), @data_collector[:file_ids].sample] }
    end
  end

  describe '#delete_file' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_file }
      let(:args) { [@data_collector[:file_ids].pop] }
    end
  end
end
