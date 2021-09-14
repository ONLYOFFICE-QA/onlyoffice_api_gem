# frozen_string_literal: true

require 'spec_helper'

contacts_user = api.people.add_user(false, random_email, random_word.capitalize, random_word.capitalize).data
contact_type = api.crm.create_contact_type(random_word).data
contact_type_order = api.crm.create_contact_type(random_word).data
contact_status = api.crm.create_contact_status(random_word, COLORS_NAMES.sample).data
contact_status_to_delete = api.crm.create_contact_status(random_word, COLORS_NAMES.sample).data
first_contact = api.crm.create_person(random_word.capitalize, random_word.capitalize).data
second_contact = api.crm.create_person(random_word.capitalize, random_word.capitalize).data
first_contact_to_merge = api.crm.create_person(random_word.capitalize, random_word.capitalize).data
second_contact_to_merge = api.crm.create_person(random_word.capitalize, random_word.capitalize).data
contact_info = api.crm.add_contact_info(second_contact['id'], info_type = CONTACT_INFO_TYPES.sample, random_word, random_info_category(api, info_type)).data
new_company = api.crm.create_company(random_word, [contacts_user['id']], personList: [second_contact['id']]).data
opportunity_stage = api.crm.create_opportunity_stage(random_word.capitalize, COLORS_NAMES.sample).data
new_opportunity = api.crm.create_opportunity(opportunity_stage['id'], random_word, contacts_user['id']).data
new_project = api.project.create_project(random_word, random_word, contacts_user['id'], random_word(3), random_bool).data
address_info = api.crm.add_address_info(first_contact['id'], street: random_word, city: random_word, state: random_word, zip: random_word, country: random_word).data

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#create_contact_type' do
    it_behaves_like 'an api request' do
      let(:command) { :create_contact_type }
      let(:args) { [random_word] }
    end
  end

  describe '#create_contact_status' do
    it_behaves_like 'an api request' do
      let(:command) { :create_contact_status }
      let(:args) { [random_word, COLORS_NAMES.sample] }
    end
  end

  describe '#create_person' do
    it_behaves_like 'an api request' do
      let(:teamlab_module) { :crm }
      let(:command) { :create_person }
      let(:args) { [random_word.capitalize, random_word.capitalize] }
    end
  end

  describe '#add_contact_info' do
    it_behaves_like 'an api request' do
      let(:command) { :add_contact_info }
      let(:args) { [first_contact['id'], info_type = CONTACT_INFO_TYPES.sample, random_word, random_info_category(api, info_type)] }
    end
  end

  describe '#get_contacts_for_mail' do
    it_behaves_like 'an api request' do
      let(:command) { :get_contacts_for_mail }
      let(:args) { [first_contact['id']] }
    end
  end

  describe '#get_contact_statuses' do
    it_behaves_like 'an api request' do
      let(:command) { :get_contact_statuses }
    end
  end

  describe '#get_contacts_by_filter' do
    it_behaves_like 'an api request' do
      let(:command) { :get_contacts_by_filter }
    end
  end

  describe '#create_company' do
    it_behaves_like 'an api request' do
      let(:command) { :create_company }
      let(:args) { [random_word, [contacts_user['id']]] }
    end
  end

  describe '#create_task_group' do
    it_behaves_like 'an api request' do
      let(:command) { :create_task_group }
      let(:args) { [random_word] }
    end
  end

  describe '#add_tag_to_batch_contacts' do
    it_behaves_like 'an api request' do
      let(:command) { :add_tag_to_batch_contacts }
      let(:args) { [(1..rand(1..4)).map { random_word(rand(3..6)) }] }
    end
  end

  describe '#update_contact_status' do
    it_behaves_like 'an api request' do
      let(:command) { :update_contact_status }
      let(:args) { [contact_status['id'], random_word, { color: COLORS_NAMES.sample }] }
    end
  end

  describe '#update_crm_contact_tag_setting' do
    it_behaves_like 'an api request' do
      let(:command) { :update_crm_contact_tag_setting }
    end
  end

  describe '#set_access_to_batch_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :set_access_to_batch_contact }
    end
  end

  describe '#update_statuses_contact_order' do
    it_behaves_like 'an api request' do
      let(:command) { :update_statuses_contact_order }
    end
  end

  describe '#update_crm_contact_status_settings' do
    it_behaves_like 'an api request' do
      let(:command) { :update_crm_contact_status_settings }
    end
  end

  describe '#update_contact_status_color' do
    it_behaves_like 'an api request' do
      let(:command) { :update_contact_status_color }
      let(:args) { [contact_status['id'], COLORS_NAMES.sample] }
    end
  end

  describe '#update_person' do
    it_behaves_like 'an api request' do
      let(:command) { :update_person }
      let(:args) { [second_contact['id'], random_word.capitalize, random_word.capitalize] }
    end
  end

  describe '#update_contact_status_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :update_contact_status_by_id }
      let(:args) { [second_contact['id'], contact_status['id']] }
    end
  end

  describe '#update_crm_entity_creation_date' do
    it_behaves_like 'an api request' do
      let(:command) { :update_crm_entity_creation_date }
      let(:args) { ['contact', second_contact['id']] }
    end
  end

  describe '#update_crm_entity_modification_date' do
    it_behaves_like 'an api request' do
      let(:command) { :update_crm_entity_modification_date }
      let(:args) { ['contact', second_contact['id']] }
    end
  end

  describe '#change_contact_photo' do
    it_behaves_like 'an api request' do
      let(:command) { :change_contact_photo }
      let(:args) { [second_contact['id'], IMAGE_FILE] }
    end
  end

  describe '#update_person_and_its_company_status' do
    it_behaves_like 'an api request' do
      let(:command) { :update_person_and_its_company_status }
      let(:args) { [first_contact['id'], contact_status['id']] }
    end
  end

  describe '#update_company_and_participants_status' do
    it_behaves_like 'an api request' do
      let(:command) { :update_company_and_participants_status }
      let(:args) { [new_company['id'], contact_status['id']] }
    end
  end

  describe '#delete_batch_contacts_by_filter' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_batch_contacts_by_filter }
      let(:args) { [{ tags: [random_word(4)] }] }
    end
  end

  describe '#delete_deal_from_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_deal_from_contact }
      let(:args) { [first_contact['id'], new_opportunity['id']] }
    end
  end

  describe '#get_all_contact_types' do
    it_behaves_like 'an api request' do
      let(:command) { :get_all_contact_types }
    end
  end

  describe '#get_contact_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_contact_by_id }
      let(:args) { [first_contact['id']] }
    end
  end

  describe '#get_all_contact_info_types' do
    it_behaves_like 'an api request' do
      let(:command) { :get_all_contact_info_types }
    end
  end

  describe '#link_contact_list_with_project' do
    it_behaves_like 'an api request' do
      let(:command) { :link_contact_list_with_project }
      let(:args) { [new_project['id'], first_contact['id']] }
    end
  end

  describe '#add_persons_to_company' do
    it_behaves_like 'an api request' do
      let(:command) { :add_persons_to_company }
      let(:args) { [new_company['id'], first_contact['id']] }
    end
  end

  describe '#link_contact_with_project' do
    it_behaves_like 'an api request' do
      let(:command) { :link_contact_with_project }
      let(:args) { [first_contact['id'], new_project['id']] }
    end
  end

  describe '#add_contact_opportunity' do
    it_behaves_like 'an api request' do
      let(:command) { :add_contact_opportunity }
      let(:args) { [second_contact['id'], new_opportunity['id']] }
    end
  end

  describe '#get_contacts_by_project_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_contacts_by_project_id }
      let(:args) { [new_project['id']] }
    end
  end

  describe '#get_contact_type' do
    it_behaves_like 'an api request' do
      let(:command) { :get_contact_type }
      let(:args) { [contact_type['id']] }
    end
  end

  describe '#get_contact_info' do
    it_behaves_like 'an api request' do
      let(:command) { :get_contact_info }
      let(:args) { [second_contact['id'], contact_info['id']] }
    end
  end

  describe '#get_all_categories' do
    it_behaves_like 'an api request' do
      let(:command) { :get_all_categories }
      let(:args) { [CONTACT_INFO_TYPES.sample] }
    end
  end

  describe '#get_company_linked_persons_list' do
    it_behaves_like 'an api request' do
      let(:command) { :get_company_linked_persons_list }
      let(:args) { [new_company['id']] }
    end
  end

  describe '#get_contact_information' do
    it_behaves_like 'an api request' do
      let(:command) { :get_contact_information }
      let(:args) { [second_contact['id']] }
    end
  end

  describe '#get_contact_information_by_type' do
    it_behaves_like 'an api request' do
      let(:command) { :get_contact_information_by_type }
      let(:args) { [second_contact['id'], CONTACT_INFO_TYPES.sample] }
    end
  end

  describe '#quick_person_list_creation' do
    it_behaves_like 'an api request' do
      let(:command) { :quick_person_list_creation }
      let(:args) { [[[random_word, random_word], [random_word, random_word]]] }
    end
  end

  describe '#quick_company_list_creation' do
    it_behaves_like 'an api request' do
      let(:command) { :quick_company_list_creation }
      let(:args) { [random_word] }
    end
  end

  describe '#merge_contacts' do
    it_behaves_like 'an api request' do
      let(:command) { :merge_contacts }
      let(:args) { [first_contact_to_merge['id'], second_contact_to_merge['id']] }
    end
  end

  describe '#set_contacts_access_rights' do
    it_behaves_like 'an api request' do
      let(:command) { :set_contacts_access_rights }
      let(:args) { [first_contact['id']] }
    end
  end

  describe '#update_company' do
    it_behaves_like 'an api request' do
      let(:command) { :update_company }
      let(:args) { [new_company['id'], random_word] }
    end
  end

  describe '#update_contact_types_order' do
    it_behaves_like 'an api request' do
      let(:command) { :update_contact_types_order }
      let(:args) { [contact_type_order['title'], contact_type['title']] }
    end
  end

  describe '#update_contact_type' do
    it_behaves_like 'an api request' do
      let(:command) { :update_contact_type }
      let(:args) { [contact_type['id'], random_word] }
    end
  end

  describe '#set_contact_access_rights' do
    it_behaves_like 'an api request' do
      let(:command) { :set_contact_access_rights }
      let(:args) { [first_contact['id']] }
    end
  end

  describe '#get_contact_access_rights' do
    it_behaves_like 'an api request' do
      let(:command) { :get_contact_access_rights }
      let(:args) { [first_contact['id']] }
    end
  end

  describe '#update_contact_info' do
    it_behaves_like 'an api request' do
      let(:command) { :update_contact_info }
      let(:args) { [contact_info['id'], second_contact['id'], random_word] }
    end
  end

  describe '#change_contact_photo_by_url' do
    it_behaves_like 'an api request' do
      let(:command) { :change_contact_photo_by_url }
      let(:args) { [first_contact['id'], IMAGE_URL] }
    end
  end

  describe '#remove_contact_from_project' do
    it_behaves_like 'an api request' do
      let(:command) { :remove_contact_from_project }
      let(:args) { [second_contact['id'], new_project['id']] }
    end
  end

  describe '#delete_contact_type' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_contact_type }
      let(:args) { [contact_type['id']] }
    end
  end

  describe '#delete_contact_info' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_contact_info }
      let(:args) { [second_contact['id'], contact_info['id']] }
    end
  end

  describe '#delete_contact_status' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_contact_status }
      let(:args) { [contact_status_to_delete['id']] }
    end
  end

  describe '#delete_contact_group' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_contact_group }
      let(:args) { [first_contact['id']] }
    end
  end

  describe '#delete_person_from_company' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_person_from_company }
      let(:args) { [new_company['id'], second_contact['id']] }
    end
  end

  describe '#delete_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_contact }
      let(:args) { [second_contact['id']] }
    end
  end

  describe '#add_address_info' do
    it_behaves_like 'an api request' do
      let(:command) { :add_address_info }
      let(:args) do
        [second_contact['id'],
         { street: random_word,
           city: random_word,
           state: random_word,
           zip: random_word,
           country: random_word,
           isPrimary: true }]
      end
    end
  end

  describe '#update_address_info' do
    it_behaves_like 'an api request' do
      let(:command) { :update_address_info }
      let(:args) do
        [first_contact['id'],
         address_info['id'],
         { street: random_word,
           city: random_word,
           state: random_word,
           zip: random_word,
           country: random_word }]
      end
    end
  end
end
