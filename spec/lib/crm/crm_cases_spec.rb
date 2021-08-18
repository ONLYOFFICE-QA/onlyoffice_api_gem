# frozen_string_literal: true

require 'spec_helper'

crm_case_user = api.crm.create_person(random_word.capitalize, random_word.capitalize).data
crm_case = api.crm.create_case(random_word, { members: crm_case_user['id'] }).data
crm_case_for_group_deleting = api.crm.create_case(random_word).data
case_for_group_deleting_by_filter = api.crm.create_case(random_word).data

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#create_case' do
    it_behaves_like 'an api request' do
      let(:command) { :create_case }
      let(:args) { [random_word, { members:crm_case_user['id'] }] }
    end
  end
  describe '#get_cases_by_prefix' do
    it_behaves_like 'an api request' do
      let(:command) { :get_cases_by_prefix }
      let(:args) { [crm_case_user['id'], random_word] }
    end
  end

  describe '#get_case_list' do
    it_behaves_like 'an api request' do
      let(:command) { :get_case_list }
    end
  end

  describe '#add_case_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :add_case_contact }
      let(:args) { [crm_case_for_group_deleting['id'], crm_case_user['id']] }
    end
  end

  describe '#get_case_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_case_by_id }
      let(:args) { [crm_case['id']] }
    end
  end

  describe '#get_all_case_contacts' do
    it_behaves_like 'an api request' do
      let(:command) { :get_all_case_contacts }
      let(:args) { [crm_case['id']] }
    end
  end

  describe '#set_case_access_rights' do
    it_behaves_like 'an api request' do
      let(:command) { :set_case_access_rights }
      let(:args) { [crm_case['id'], { isPrivate: random_bool }] }
    end
  end

  describe '#update_case' do
    it_behaves_like 'an api request' do
      let(:command) { :update_case }
      let(:args) { [crm_case['id'], random_word] }
    end
  end

  describe '#set_case_access_rights_by_filter' do
    it_behaves_like 'an api request' do
      let(:command) { :set_case_access_rights_by_filter }
      let(:args) { [{ contactId: crm_case_user['id'], isPrivate: random_bool }] }
    end
  end

  describe '#close_case' do
    it_behaves_like 'an api request' do
      let(:command) { :close_case }
      let(:args) { [crm_case_for_group_deleting['id']] }
    end
  end

  describe '#resume_case' do
    it_behaves_like 'an api request' do
      let(:command) { :resume_case }
      let(:args) { [crm_case_for_group_deleting['id']] }
    end
  end

  describe '#set_rights_to_case' do
    it_behaves_like 'an api request' do
      let(:command) { :set_rights_to_case }
      let(:args) { [crm_case['id'], { isPrivate: random_bool }] }
    end
  end

  describe '#delete_case_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_case_contact }
      let(:args) { [crm_case['id'], crm_case_user['id']] }
    end
  end

  describe '#delete_case' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_case }
      let(:args) { [crm_case['id']] }
    end
  end

  describe '#delete_case_group' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_case_group }
      let(:args) { [crm_case_for_group_deleting['id']] }
    end
  end

  describe '#delete_case_group_by_filter' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_case_group }
      let(:args) { [{ contactId: case_for_group_deleting_by_filter['id'] }] }
    end
  end
end
