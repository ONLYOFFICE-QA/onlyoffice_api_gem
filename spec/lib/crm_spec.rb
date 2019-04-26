require_relative '../spec_helper'

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

  describe '#create_person__for_group' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :crm }
      let(:command) { :create_person }
      let(:args) { [random_word.capitalize, random_word.capitalize] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :new_contact_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_contact_type' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_contact_type }
      let(:args) { [random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :contact_type_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_contact_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_contact_status }
      let(:args) { [random_word, COLORS_NAMES.sample] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :contact_status_ids }
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

  describe '#get_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_settings }
    end
  end

  describe '#create_task_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_task_group }
      let(:args) { [random_word] }
    end
  end

  describe '#save_smtp_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :save_smtp_settings }
    end
  end

  describe '#save_number_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :save_number_settings }
    end
  end

  describe '#save_terms_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :save_terms_settings }
    end
  end

  describe '#get_event_list_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_event_list_by_filter }
    end
  end

  describe '#add_persons_to_company' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_persons_to_company }
      i = -1
      let(:args) { [DATA_COLLECTOR[:company_ids].last, DATA_COLLECTOR[:new_contact_ids][i += 1]] }
    end
  end

  describe '#quick_company_list_creation' do
    it_should_behave_like 'an api request' do
      let(:command) { :quick_company_list_creation }
      let(:args) { [random_word] }
    end
  end

  describe '#update_company' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_company }
      let(:args) { [random_id(:company), random_word] }
    end
  end

  describe '#delete_event_and_related_files' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_event_and_related_files }
      let(:args) { [DATA_COLLECTOR[:crm_event_ids].pop] }
    end
  end

  describe '#delete_person_from_company' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_person_from_company }
      i = -1
      let(:args) { [DATA_COLLECTOR[:company_ids].last, DATA_COLLECTOR[:new_contact_ids][i += 1]] }
    end
  end

  describe '#update_crm_entity_creation_date' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_crm_entity_creation_date }
      let(:args) { ['contact', random_id(:new_contact)] }
    end
  end

  describe '#update_crm_entity_modification_date' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_crm_entity_modification_date }
      let(:args) { ['contact', random_id(:new_contact)] }
    end
  end
end
