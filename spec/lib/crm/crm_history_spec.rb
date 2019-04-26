require 'spec_helper'

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#create_history_category' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_history_category }
      let(:args) { [random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_history_category_ids }
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

  describe '#create_event' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_event }
      let(:args) { [random_id(:new_contact), random_word, random_id(:crm_history_category)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_event_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_event_list_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_event_list_by_filter }
    end
  end

  describe '#create_history_category' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_history_category }
      let(:args) { [random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_history_category_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#update_history_category' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_history_category }
      let(:args) { [DATA_COLLECTOR[:crm_history_category_ids][1], random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :history_category_titles }
      let(:param_names) { %w[title] }
    end
  end

  describe '#get_all_history_categories' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_history_categories }
    end
  end

  describe '#get_all_history_categories' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_history_categories }
    end
  end

  describe '#update_history_categories_order' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_history_categories_order }
      let(:args) { [DATA_COLLECTOR[:history_category_titles].shuffle] }
    end
  end

  describe '#update_history_category_icon' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_history_category_icon }
      let(:args) { [random_id(:crm_history_category), random_word] }
    end
  end

  describe '#delete_event_and_related_files' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_event_and_related_files }
      let(:args) { [DATA_COLLECTOR[:crm_event_ids].pop] }
    end
  end

  describe '#delete_history_category' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_history_category }
      let(:args) { [DATA_COLLECTOR[:crm_history_category_ids].pop] }
    end
  end
end
