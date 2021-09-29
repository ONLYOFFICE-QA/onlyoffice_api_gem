# frozen_string_literal: true

require 'spec_helper'

tasks_user = api.people.add_user(false, random_email, random_word.capitalize, random_word.capitalize).data
first_task_category = api.crm.create_task_category(random_word, random_word).data
second_task_category = api.crm.create_task_category(random_word, random_word).data
third_task_category = api.crm.create_task_category(random_word, random_word).data
task = api.crm.create_task(random_word, DateTime.commercial(2015).to_s, tasks_user['id'], first_task_category['id']).data

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#create_task_category' do
    it_behaves_like 'an api request' do
      let(:command) { :create_task_category }
      let(:args) { [random_word, random_word] }
    end
  end

  describe '#update_task_category' do
    it_behaves_like 'an api request' do
      let(:command) { :update_task_category }
      let(:args) { [third_task_category['id'], random_word] }
    end
  end

  describe '#create_task' do
    it_behaves_like 'an api request' do
      let(:command) { :create_task }
      let(:args) { [random_word, DateTime.commercial(2015).to_s, tasks_user['id'], first_task_category['id']] }
    end
  end

  describe '#update_task' do
    it_behaves_like 'an api request' do
      let(:command) { :update_task }
      let(:args) { [task['id'], random_word, DateTime.commercial(2015).to_s, second_task_category['id']] }
    end
  end

  describe '#get_task_list_by_filter' do
    it_behaves_like 'an api request' do
      let(:command) { :get_task_list_by_filter }
    end
  end

  describe '#get_all_task_categories' do
    it_behaves_like 'an api request' do
      let(:command) { :get_all_task_categories }
    end
  end

  describe '#get_task_by_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_task_by_id }
      let(:args) { [task['id']] }
    end
  end

  describe '#get_task_category' do
    it_behaves_like 'an api request' do
      let(:command) { :get_task_category }
      let(:args) { [second_task_category['id']] }
    end
  end

  describe '#close_task' do
    it_behaves_like 'an api request' do
      let(:command) { :close_task }
      let(:args) { [task['id']] }
    end
  end

  describe '#resume_task' do
    it_behaves_like 'an api request' do
      let(:command) { :resume_task }
      let(:args) { [task['id']] }
    end
  end

  describe '#update_task_categories_order' do
    it_behaves_like 'an api request' do
      let(:command) { :update_task_categories_order }
      let(:args) { [second_task_category['title']] }
    end
  end

  describe '#update_task_category_icon' do
    it_behaves_like 'an api request' do
      let(:command) { :update_task_category_icon }
      let(:args) { [first_task_category['id'], random_word] }
    end
  end

  describe '#delete_task' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_task }
      let(:args) { [task['id']] }
    end
  end

  describe '#delete_task_category' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_task_category }
      let(:args) { [second_task_category['id']] }
    end
  end
end
