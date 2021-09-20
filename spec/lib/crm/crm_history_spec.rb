# frozen_string_literal: true

require 'spec_helper'

history_category_new = api.crm.create_history_category(random_word, random_word).data
history_category_update = api.crm.create_history_category(random_word, random_word).data
history_contact = api.crm.create_person(random_word.capitalize, random_word.capitalize).data
history_event = api.crm.create_event(history_contact['id'], random_word, history_category_new['id']).data

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#create_history_category' do
    it_behaves_like 'an api request' do
      let(:command) { :create_history_category }
      let(:args) { [random_word, random_word] }
    end
  end

  describe '#create_event' do
    it_behaves_like 'an api request' do
      let(:command) { :create_event }
      let(:args) { [history_contact['id'], random_word, history_category_new['id']] }
    end
  end

  describe '#get_event_list_by_filter' do
    it_behaves_like 'an api request' do
      let(:command) { :get_event_list_by_filter }
    end
  end

  describe '#update_history_category' do
    it_behaves_like 'an api request' do
      let(:command) { :update_history_category }
      let(:args) { [history_category_update['id'], random_word] }
    end
  end

  describe '#get_all_history_categories' do
    it_behaves_like 'an api request' do
      let(:command) { :get_all_history_categories }
    end
  end

  describe '#update_history_categories_order' do
    it_behaves_like 'an api request' do
      let(:command) { :update_history_categories_order }
      let(:args) { [history_category_new['title']] }
    end
  end

  describe '#update_history_category_icon' do
    it_behaves_like 'an api request' do
      let(:command) { :update_history_category_icon }
      let(:args) { [history_category_new['id'], random_word] }
    end
  end

  describe '#delete_event_and_related_files' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_event_and_related_files }
      let(:args) { [history_event['id']] }
    end
  end

  describe '#delete_history_category' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_history_category }
      let(:args) { [history_category_update['id']] }
    end
  end
end
