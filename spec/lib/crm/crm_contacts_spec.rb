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

  describe '#create_contact_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_contact_status }
      let(:args) { [random_word, COLORS_NAMES.sample] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :contact_status_ids }
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

  describe '#add_contact_info' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_contact_info }
      i = -1
      let(:args) { [DATA_COLLECTOR[:new_contact_ids][i += 1], info_type = CONTACT_INFO_TYPES.sample, random_word, random_info_category(info_type)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :contact_info_ids }
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

  describe '#get_contacts_for_mail' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_contacts_for_mail }
      let(:args) { [DATA_COLLECTOR[:new_contact_ids].sample(rand(1..3))] }
    end
  end

  describe '#get_contact_statuses' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_contact_statuses }
    end
  end

  describe '#get_contacts_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_contacts_by_filter }
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

  describe '#create_task_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_task_group }
      let(:args) { [random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :task_group_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#add_tag_to_batch_contacts' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_tag_to_batch_contacts }
      let(:args) { [(1..rand(1..4)).map { random_word(rand(3..6)) }] }
    end
  end

  describe '#update_contact_type' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_contact_type }
      let(:args) { [random_id(:contact_type), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :contact_types_titles }
      let(:param_names) { %w[title] }
    end
  end

  describe '#update_contact_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_contact_status }
      let(:args) { [DATA_COLLECTOR[:contact_status_ids].first, random_word, { color: COLORS_NAMES.sample }] }
    end
  end

  describe '#update_crm_contact_tag_setting' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_crm_contact_tag_setting }
    end
  end

  describe '#set_access_to_batch_contact' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_access_to_batch_contact }
    end
  end

  describe '#update_statuses_contact_order' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_statuses_contact_order }
    end
  end

  describe '#update_crm_contact_status_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_crm_contact_status_settings }
    end
  end

  describe '#update_contact_status_color' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_contact_status_color }
      let(:args) { [DATA_COLLECTOR[:contact_status_ids].first, COLORS_NAMES.sample] }
    end
  end

  describe '#update_person' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_person }
      let(:args) { [random_id(:new_contact), random_word.capitalize, random_word.capitalize] }
    end
  end

  describe '#update_contact_status_by_id' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_contact_status_by_id }
      let(:args) { [random_id(:new_contact), DATA_COLLECTOR[:contact_status_ids].first] }
    end
  end

  describe '#change_contact_photo' do
    it_should_behave_like 'an api request' do
      let(:command) { :change_contact_photo }
      let(:args) { [random_id(:new_contact), IMAGE_FILE] }
    end
  end

  describe '#update_person_and_its_company_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_person_and_its_company_status }
      let(:args) { [random_id(:new_contact), DATA_COLLECTOR[:contact_status_ids].first] }
    end
  end

  describe '#update_company_and_participants_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_company_and_participants_status }
      let(:args) { [random_id(:company), DATA_COLLECTOR[:contact_status_ids].first] }
    end
  end

  describe '#delete_batch_contacts_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_batch_contacts_by_filter }
      let(:args) { [{ tags: [random_word(4)] }] }
    end
  end

  describe '#delete_deal_from_contact' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_deal_from_contact }
      let(:args) { [random_id(:new_contact), random_id(:opportunity)] }
    end
  end

  describe '#get_all_contact_types' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_contact_types }
    end
  end

  describe '#get_contact_by_id' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_contact_by_id }
      let(:args) { [random_id(:new_contact)] }
    end
  end

  describe '#get_all_contact_info_types' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_contact_info_types }
    end
  end

  describe '#link_contact_list_with_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :link_contact_list_with_project }
      let(:args) { [random_id(:project), DATA_COLLECTOR[:new_contact_ids].sample(rand(1..4))] }
    end
  end

  describe '#link_contact_with_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :link_contact_with_project }
      let(:args) { [random_id(:new_contact), random_id(:project)] }
    end
  end

  describe '#get_contacts_by_project_id' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_contacts_by_project_id }
      let(:args) { [random_id(:project)] }
    end
  end

  describe '#get_contact_type' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_contact_type }
      let(:args) { [random_id(:contact_type)] }
    end
  end

  describe '#get_contact_info' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_contact_info }
      let(:args) { [random_id(:new_contact), CONTACT_INFO_TYPES.sample] }
    end
  end

  describe '#get_all_categories' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_categories }
      let(:args) { [CONTACT_INFO_TYPES.sample] }
    end
  end

  describe '#get_company_linked_persons_list' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_company_linked_persons_list }
      let(:args) { [random_id(:company)] }
    end
  end

  describe '#get_contact_information_by_type' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_contact_information_by_type }
      let(:args) { [random_id(:new_contact), CONTACT_INFO_TYPES.sample] }
    end
  end

  describe '#merge_contacts' do
    it_should_behave_like 'an api request' do
      let(:command) { :merge_contacts }
      let(:args) { [DATA_COLLECTOR[:new_contact_ids].pop, random_id(:new_contact)] }
    end
  end

  describe '#set_contacts_access_rights' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_contacts_access_rights }
      let(:args) { [[DATA_COLLECTOR[:new_contact_ids].sample(rand(1..4))]] }
    end
  end

  describe '#update_contact_types_order' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_contact_types_order }
      let(:args) { [DATA_COLLECTOR[:contact_types_titles].sample(rand(1..4))] }
    end
  end

  describe '#set_contact_access_rights' do
    it_should_behave_like 'an api request' do
      let(:command) { :set_contact_access_rights }
      let(:args) { [random_id(:new_contact)] }
    end
  end

  describe '#update_contact_info' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_contact_info }
      let(:args) { [random_id(:contact_info), random_id(:new_contact), random_word] }
    end
  end

  describe '#change_contact_photo_by_url' do
    it_should_behave_like 'an api request' do
      let(:command) { :change_contact_photo_by_url }
      let(:args) { [random_id(:new_contact), IMAGE_URL] }
    end
  end

  describe '#remove_contact_from_project' do
    it_should_behave_like 'an api request' do
      let(:command) { :remove_contact_from_project }
      let(:args) { [random_id(:new_contact), random_id(:project)] }
    end
  end

  describe '#delete_contact_type' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_contact_type }
      let(:args) { [DATA_COLLECTOR[:contact_type_ids].pop] }
    end
  end

  describe '#delete_contact_info' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_contact_info }
      i = -1
      let(:args) { [DATA_COLLECTOR[:new_contact_ids][i += 1], DATA_COLLECTOR[:contact_info_ids][i]] }
    end
  end

  describe '#delete_contact_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_contact_group }
      let(:args) { [DATA_COLLECTOR[:new_contact_ids].pop] }
    end
  end

  describe '#delete_contact' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_contact }
      let(:args) { [DATA_COLLECTOR[:new_contact_ids].pop] }
    end
  end

  describe '#delete_contact_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_contact_status }
      let(:args) { [DATA_COLLECTOR[:contact_status_ids].pop] }
    end
  end
end
