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

  describe '#create_opportunity' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_opportunity }
      let(:args) { [random_id(:opportunity_stage), random_word, random_id(:user)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :opportunity_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_opportunity_for_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_opportunity }
      let(:args) { [random_id(:opportunity_stage), random_word, random_id(:user)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :opportunity_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_invoice_item' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice_item }
      let(:args) { [random_word, random_word, rand, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_item_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_invoice_item_by_id' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_invoice_item_by_id }
      let(:args) { [random_id(:invoice_item)] }
    end
  end

  describe '#create_invoice' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice }
      let(:args) { [random_word, DUE_DATE, random_id(:new_contact), DUE_DATE, LANGUAGE.sample, CURRENCY.sample, rand(1000), random_word, { invoiceItemID: random_id(:invoice_item) }] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_ids }
      let(:param_names) { %w[id] }
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

  describe '#create_invoice_line' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice_line }
      let(:args) { [random_id(:invoice), random_id(:invoice_item)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_line_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_invoice_item_for_batch' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice_item }
      let(:args) { [random_word, random_word, rand, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_item_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_invoice_tax' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_invoice_tax }
      let(:args) { [random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :invoice_tax_ids }
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

  describe '#update_history_category' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_history_category }
      i = -1
      let(:args) { [DATA_COLLECTOR[:crm_history_category_ids][i += 1], random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :history_category_titles }
      let(:param_names) { %w[title] }
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

  describe '#create_task_category' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_task_category }
      let(:args) { [random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_task_category_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#update_task_category' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_task_category }
      i = -1
      let(:args) { [DATA_COLLECTOR[:crm_task_category_ids][i += 1], random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_task_category_titles }
      let(:param_names) { %w[title] }
    end
  end

  describe '#create_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_task }
      let(:args) { [random_word, DateTime.commercial(2015).to_s, random_id(:user), random_id(:crm_task_category)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_task_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#quick_person_list_creation' do
    it_should_behave_like 'an api request' do
      let(:command) { :quick_person_list_creation }
      let(:args) { [[[random_word, random_word], [random_word, random_word]]] }
    end
  end

  describe '#add_opportunity_contact' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_opportunity_contact }
      i = -1
      let(:args) { [DATA_COLLECTOR[:opportunity_ids].last, DATA_COLLECTOR[:new_contact_ids][i += 1]] }
    end
  end

  describe '#create_task_template_container' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_task_template_container }
      let(:args) { [ENTITY_TYPES.sample.sub('company', 'contact'), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :task_template_container_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_task_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_task_template }
      let(:args) { [DATA_COLLECTOR[:task_template_container_ids].last, random_word, random_id(:crm_task_category)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :task_template_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_user_field' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_user_field }
      let(:args) { [ENTITY_TYPES.last, random_word, rand(6)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :user_field_ids }
      let(:param_names) { %w[id] }
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

  describe '#get_result_of_convertation' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_result_of_convertation }
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
      let(:args) { [random_id(:opportunity_stage), random_word, COLORS_NAMES.sample] }
    end
  end

  describe '#update_opportunity_stages_order' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_opportunity_stages_order }
      let(:args) { [DATA_COLLECTOR[:opportunity_stage_ids].sample(rand(1..3))] }
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
      let(:args) { [random_id(:opportunity), random_id(:opportunity_stage)] }
    end
  end

  describe '#get_invoice_taxes' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_invoice_taxes }
    end
  end

  describe '#get_invoice_sample' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_invoice_sample }
    end
  end

  describe '#get_invoices_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_invoices_by_filter }
    end
  end

  describe '#get_settings' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_settings }
    end
  end

  describe '#get_invoice_items_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_invoice_items_by_filter }
    end
  end

  describe '#get_entity_invoices' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_entity_invoices }
      let(:args) { [:contact, random_id(:new_contact)] }
    end
  end

  describe '#create_task_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_task_group }
      let(:args) { [random_word] }
    end
  end

  describe '#add_contact_tag_to_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_contact_tag_to_group }
      let(:args) { [:company, random_id(:company), random_word(4)] }
    end
  end

  describe '#add_deal_to_contact' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_deal_to_contact }
      let(:args) { [random_id(:new_contact), random_id(:opportunity)] }
    end
  end

  describe '#update_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_task }
      let(:args) { [random_id(:crm_task), random_word, DateTime.commercial(2015).to_s, random_id(:crm_task_category)] }
    end
  end

  describe '#update_invoice_item' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_invoice_item }
      let(:args) { [random_id(:invoice_item), random_word, random_word, rand, random_word] }
    end
  end

  describe '#update_invoice_tax' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_invoice_tax }
      let(:args) { [random_id(:invoice_tax), random_word] }
    end
  end

  describe '#update_organisation_company_name' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_organisation_company_name }
      let(:args) { [random_word] }
    end
  end

  describe '#update_organisation_address' do
    it_should_behave_like 'an api request', :skip do
      skip 'https://bugzilla.onlyoffice.com/show_bug.cgi?id=39993'
      let(:command) { :update_organisation_address }
      let(:args) { [random_word] }
    end
  end

  describe '#update_invoice' do
    it_should_behave_like 'an api request' do
      pending 'http://bugzserver/show_bug.cgi?id=23886'
      let(:command) { :update_invoice }
      let(:args) { [random_id(:invoice)] }
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

  describe '#update_invoice_patch_status' do
    it_should_behave_like 'an api request' do
      pending 'http://bugzserver/show_bug.cgi?id=23886'
      let(:command) { :update_invoice_patch_status }
      let(:args) { [INVOICE_STATUSES.sample, DATA_COLLECTOR[:invoice_ids].sample(rand(1..3))] }
    end
  end

  describe '#update_invoice_line' do
    it_should_behave_like 'an api request' do
      pending 'http://bugzserver/show_bug.cgi?id=23886, http://bugzserver/show_bug.cgi?id=23888'
      let(:command) { :update_invoice_line }
      let(:args) { [random_id(:invoice_line), random_id(:invoice)] }
    end
  end

  describe '#get_event_list_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_event_list_by_filter }
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

  describe '#get_task_list_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task_list_by_filter }
    end
  end

  describe '#get_all_task_categories' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_task_categories }
    end
  end

  describe '#get_task_by_id' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task_by_id }
      let(:args) { [random_id(:crm_task)] }
    end
  end

  describe '#get_task_category' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task_category }
      let(:args) { [random_id(:crm_task_category)] }
    end
  end

  describe '#close_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :close_task }
      let(:args) { [random_id(:crm_task)] }
    end
  end

  describe '#resume_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :resume_task }
      let(:args) { [random_id(:crm_task)] }
    end
  end

  describe '#update_task_categories_order' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_task_categories_order }
      let(:args) { [DATA_COLLECTOR[:crm_task_category_titles].shuffle] }
    end
  end

  describe '#update_task_category_icon' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_task_category_icon }
      let(:args) { [random_id(:crm_task_category), random_word] }
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

  describe '#get_root_folder_id' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_root_folder_id }
    end
  end

  describe '#associate_file_with_entity' do
    it_should_behave_like 'an api request' do
      let(:command) { :associate_file_with_entity }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym), DATA_COLLECTOR[:file_ids].sample(rand(1..4))] }
    end
  end

  describe '#create_txt' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_txt }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_file_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_file_list' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_file_list }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym)] }
    end
  end

  describe '#upload_file' do
    it_should_behave_like 'an api request' do
      let(:command) { :upload_file }
      let(:args) { [entity = ENTITY_TYPES.sample, random_id(entity.to_sym), FILE_FOR_UPLOAD] }
    end
  end

  describe '#create_tag' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_tag }
      let(:args) { [ENTITY_TYPES.last, random_word(4)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_tag_ids }
      let(:param_names) { %w[] }
    end
  end

  describe '#get_tags_for_entity_type' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_tags_for_entity_type }
      let(:args) { [ENTITY_TYPES.sample] }
    end
  end

  describe '#get_all_contact_tags' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_contact_tags }
      let(:args) { [random_id(:new_contact)] }
    end
  end

  describe '#get_entity_tags' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_all_contact_tags }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym)] }
    end
  end

  describe '#add_tag_to_case_group_by_filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_tag_to_case_group_by_filter }
      let(:args) { [random_id(:crm_tag)] }
    end
  end

  describe '#add_tag_group_to_entity' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_tag_group_to_entity }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym), random_id(:crm_tag)] }
    end
  end

  describe '#add_tag_to_opportunity_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_tag_to_opportunity_group }
      let(:args) { [random_id(:crm_tag)] }
    end
  end

  describe '#add_tag' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_tag }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym), random_id(:crm_tag)] }
    end
  end

  describe '#get_task_template_container_list' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task_template_container_list }
      let(:args) { [ENTITY_TYPES.sample.sub('company', 'contact')] }
    end
  end

  describe '#update_task_template_container' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_task_template_container }
      let(:args) { [random_id(:task_template_container), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :task_template_container_title_ids }
      let(:param_names) { %w[title] }
    end
  end

  describe '#get_task_template_container' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task_template_container }
      let(:args) { [random_id(:task_template_container)] }
    end
  end

  describe '#get_task_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task_template }
      let(:args) { [random_id(:task_template)] }
    end
  end

  describe '#get_task_template_list_by_container_id' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_task_template_list_by_container_id }
      let(:args) { [random_id(:task_template_container)] }
    end
  end

  describe '#update_task_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_task_template }
      i = -1
      let(:args) { [DATA_COLLECTOR[:task_template_container_ids].last, DATA_COLLECTOR[:task_template_ids][i += 1], random_word] }
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
      let(:args) { [ENTITY_TYPES.last, DATA_COLLECTOR[:user_field_ids][i += 1], random_word, rand(6)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :user_field_title_ids }
      let(:param_names) { %w[label] }
    end
  end

  describe '#update_user_fields_order' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_user_fields_order }
      let(:args) { [DATA_COLLECTOR[:user_field_title_ids].sample(rand(1..4))] }
    end
  end

  describe '#delete_user_field' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_user_field }
      let(:args) { [ENTITY_TYPES.last, DATA_COLLECTOR[:user_field_ids].pop] }
    end
  end

  describe '#delete_invoice_item' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_invoice_item }
      let(:args) { [DATA_COLLECTOR[:invoice_item_ids].pop] }
    end
  end

  describe '#delete_invoice_tax' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_invoice_tax }
      let(:args) { [DATA_COLLECTOR[:invoice_tax_ids].pop] }
    end
  end

  describe '#delete_invoice_line' do
    it_should_behave_like 'an api request' do
      pending 'http://bugzserver/show_bug.cgi?id=23886, http://bugzserver/show_bug.cgi?id=23888'
      let(:command) { :delete_invoice_line }
      let(:args) { [DATA_COLLECTOR[:invoice_line_ids].pop] }
    end
  end

  describe '#delete_invoice' do
    it_should_behave_like 'an api request' do
      pending 'http://bugzserver/show_bug.cgi?id=23886'
      let(:command) { :delete_invoice }
      let(:args) { [DATA_COLLECTOR[:invoice_ids].pop] }
    end
  end

  describe '#delete_opportunity_contact' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_opportunity_contact }
      i = -1
      let(:args) { [DATA_COLLECTOR[:opportunity_ids].last, DATA_COLLECTOR[:new_contact_ids][i += 1]] }
    end
  end

  describe '#delete_batch_invoices' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_batch_invoices }
      let(:args) { [DATA_COLLECTOR[:invoice_ids].pop, DATA_COLLECTOR[:invoice_ids].pop] }
    end
  end

  describe '#delete_batch_items' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_batch_items }
      let(:args) { [DATA_COLLECTOR[:invoice_item_ids].pop, DATA_COLLECTOR[:invoice_item_ids].pop] }
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

  describe '#delete_task' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_task }
      let(:args) { [DATA_COLLECTOR[:crm_task_ids].pop] }
    end
  end

  describe '#delete_task_category' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_task_category }
      let(:args) { [DATA_COLLECTOR[:crm_task_category_ids].pop] }
    end
  end

  describe '#delete_person_from_company' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_person_from_company }
      i = -1
      let(:args) { [DATA_COLLECTOR[:company_ids].last, DATA_COLLECTOR[:new_contact_ids][i += 1]] }
    end
  end

  describe '#delete_file' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_file }
      let(:args) { [DATA_COLLECTOR[:crm_file_ids].pop] }
    end
  end

  describe '#delete_tag' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_tag }
      let(:args) { [ENTITY_TYPES.last, DATA_COLLECTOR[:crm_tag_ids].pop] }
    end
  end

  describe '#remove_tag' do
    it_should_behave_like 'an api request' do
      let(:command) { :remove_tag }
      let(:args) { [(entity = ENTITY_TYPES.sample).sub('company', 'contact'), random_id(entity.to_sym), random_id(:crm_tag)] }
    end
  end

  describe '#delete_unused_tags' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_unused_tags }
      let(:args) { [ENTITY_TYPES.sample.sub('company', 'contact')] }
    end
  end

  describe '#delete_task_template' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_task_template }
      let(:args) { [DATA_COLLECTOR[:task_template_ids].pop] }
    end
  end

  describe '#delete_task_template_container' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_task_template_container }
      let(:args) { [DATA_COLLECTOR[:task_template_container_ids].pop] }
    end
  end

  describe '#delete_opportunity_group' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_opportunity_group }
      let(:args) { [DATA_COLLECTOR[:opportunity_ids].pop] }
    end
  end

  describe '#delete_opportunity' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_opportunity }
      let(:args) { [DATA_COLLECTOR[:opportunity_ids].pop] }
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
      let(:args) { [DATA_COLLECTOR[:opportunity_stage_ids].pop] }
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
