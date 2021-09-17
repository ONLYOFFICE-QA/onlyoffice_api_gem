# frozen_string_literal: true

require 'spec_helper'

new_user_field = api.crm.create_user_field(ENTITY_TYPES.last, random_word, 3).data
custom_field_contact = api.crm.create_person(random_word.capitalize, random_word.capitalize).data

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#create_user_field' do
    it_behaves_like 'an api request' do
      let(:command) { :create_user_field }
      let(:args) { [ENTITY_TYPES.first, random_word, 3] }
    end
  end

  describe '#get_user_field_values' do
    it_behaves_like 'an api request' do
      let(:command) { :get_user_field_values }
      let(:args) { [ENTITY_TYPES.last, custom_field_contact['id']] }
    end
  end

  describe '#get_user_field_list' do
    it_behaves_like 'an api request' do
      let(:command) { :get_user_field_list }
      let(:args) { [ENTITY_TYPES.last] }
    end
  end

  describe '#set_user_field_value' do
    it_behaves_like 'an api request' do
      let(:command) { :set_user_field_value }
      let(:args) { [ENTITY_TYPES.last, custom_field_contact['id'], new_user_field['id'], random_word] }
    end
  end

  describe '#update_selected_user_field' do
    it_behaves_like 'an api request' do
      let(:command) { :update_selected_user_field }
      let(:args) { [ENTITY_TYPES.last, new_user_field['id'], random_word, 3] }
    end
  end

  describe '#update_user_fields_order' do
    it_behaves_like 'an api request' do
      let(:command) { :update_user_fields_order }
      let(:args) { [ENTITY_TYPES.last, new_user_field['id']] }
    end
  end

  describe '#delete_user_field' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_user_field }
      let(:args) { [ENTITY_TYPES.last, new_user_field['id']] }
    end
  end
end
