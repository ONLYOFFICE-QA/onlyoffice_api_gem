# frozen_string_literal: true

require 'spec_helper'

opportunity_user = api.people.add_user(true, random_email, random_word.capitalize, random_word.capitalize).data
opportunity_contact = api.crm.create_person(random_word.capitalize, random_word.capitalize).data
opportunity_stage = api.crm.create_opportunity_stage(random_word.capitalize, COLORS_NAMES.sample).data
second_opportunity_stage = api.crm.create_opportunity_stage(random_word.capitalize, COLORS_NAMES.sample).data
opportunity_new = api.crm.create_opportunity(opportunity_stage['id'], random_word, opportunity_user['id']).data
second_opportunity = api.crm.create_opportunity(opportunity_stage['id'], random_word, opportunity_user['id']).data

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#create_opportunity_stage' do
    it_behaves_like 'an api request' do
      let(:teamlab_module) { :crm }
      let(:command) { :create_opportunity_stage }
      let(:args) { [random_word.capitalize, COLORS_NAMES.sample] }
    end
  end

  describe '#create_opportunity' do
    it_behaves_like 'an api request' do
      let(:command) { :create_opportunity }
      let(:args) { [opportunity_stage['id'], random_word, opportunity_user['id']] }
    end
  end

  describe '#add_opportunity_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :add_opportunity_contact }
      let(:args) { [opportunity_new['id'], opportunity_contact['id']] }
    end
  end

  describe '#get_all_opportunity_stages' do
    it_behaves_like 'an api request' do
      let(:command) { :get_all_opportunity_stages }
    end
  end

  describe '#get_opportunity_list' do
    it_behaves_like 'an api request' do
      let(:command) { :get_opportunity_list }
    end
  end

  describe '#get_opportunity_stage' do
    it_behaves_like 'an api request' do
      let(:command) { :get_opportunity_stage }
      let(:args) { [opportunity_stage['id']] }
    end
  end

  describe '#get_opportunity_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_opportunity_by_id }
      let(:args) { [opportunity_new['id']] }
    end
  end

  describe '#get_all_opportunity_contacts' do
    it_behaves_like 'an api request' do
      let(:command) { :get_all_opportunity_contacts }
      let(:args) { [opportunity_new['id']] }
    end
  end

  describe '#get_contact_opportunities' do
    it_behaves_like 'an api request' do
      let(:command) { :get_contact_opportunities }
      let(:args) { [opportunity_contact['id']] }
    end
  end

  describe '#set_opportunity_access_rights' do
    it_behaves_like 'an api request' do
      let(:command) { :set_opportunity_access_rights }
      let(:args) { [[opportunity_new['id']], true, opportunity_user['id']] }
    end
  end

  describe '#update_opportunity_stage' do
    it_behaves_like 'an api request' do
      let(:command) { :update_opportunity_stage }
      let(:args) { [second_opportunity_stage['id'], random_word, COLORS_NAMES.sample] }
    end
  end

  describe '#update_opportunity_stages_order' do
    it_behaves_like 'an api request' do
      let(:command) { :update_opportunity_stages_order }
      let(:args) { [[second_opportunity_stage['id'], opportunity_stage['id']]] }
    end
  end

  describe '#set_opportunity_access_rights_for_users' do
    it_behaves_like 'an api request' do
      let(:command) { :set_opportunity_access_rights_for_users }
    end
  end

  describe '#update_opportunity_to_stage' do
    it_behaves_like 'an api request' do
      let(:command) { :update_opportunity_to_stage }
      let(:args) { [second_opportunity['id'], second_opportunity_stage['id']] }
    end
  end

  describe '#delete_opportunity_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_opportunity_contact }
      let(:args) { [opportunity_new['id'], opportunity_contact['id']] }
    end
  end

  describe '#delete_opportunity_group' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_opportunity_group }
      let(:args) { [[second_opportunity['id']]] }
    end
  end

  describe '#delete_opportunity' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_opportunity }
      let(:args) { [opportunity_new['id']] }
    end
  end

  describe '#delete_opportunity_group_by_filter' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_opportunity_group_by_filter }
    end
  end

  describe '#delete_opportunity_stage' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_opportunity_stage }
      let(:args) { [opportunity_stage['id']] }
    end
  end
end
