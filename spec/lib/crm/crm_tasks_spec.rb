# frozen_string_literal: true

require 'spec_helper'

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#add_user' do
    it_behaves_like 'an api request' do
      let(:teamlab_module) { :people }
      let(:command) { :add_user }
      let(:args) { [false, random_email, random_word.capitalize, random_word.capitalize] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :user_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#create_task_category' do
    it_behaves_like 'an api request' do
      let(:command) { :create_task_category }
      let(:args) { [random_word, random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_task_category_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#update_task_category' do
    it_behaves_like 'an api request' do
      let(:command) { :update_task_category }
      i = -1
      let(:args) { [@data_collector[:crm_task_category_ids][i += 1], random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_task_category_titles }
      let(:param_names) { %w[title] }
    end
  end

  describe '#create_task' do
    it_behaves_like 'an api request' do
      let(:command) { :create_task }
      let(:args) { [random_word, DateTime.commercial(2015).to_s, random_id(:user), random_id(:crm_task_category)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :crm_task_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#update_task' do
    it_behaves_like 'an api request' do
      let(:command) { :update_task }
      let(:args) { [random_id(:crm_task), random_word, DateTime.commercial(2015).to_s, random_id(:crm_task_category)] }
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
      let(:args) { [random_id(:crm_task)] }
    end
  end

  describe '#get_task_category' do
    it_behaves_like 'an api request' do
      let(:command) { :get_task_category }
      let(:args) { [random_id(:crm_task_category)] }
    end
  end

  describe '#close_task' do
    it_behaves_like 'an api request' do
      let(:command) { :close_task }
      let(:args) { [random_id(:crm_task)] }
    end
  end

  describe '#resume_task' do
    it_behaves_like 'an api request' do
      let(:command) { :resume_task }
      let(:args) { [random_id(:crm_task)] }
    end
  end

  describe '#update_task_categories_order' do
    it_behaves_like 'an api request' do
      let(:command) { :update_task_categories_order }
      let(:args) { [@data_collector[:crm_task_category_titles].shuffle] }
    end
  end

  describe '#update_task_category_icon' do
    it_behaves_like 'an api request' do
      let(:command) { :update_task_category_icon }
      let(:args) { [random_id(:crm_task_category), random_word] }
    end
  end

  describe '#delete_task' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_task }
      let(:args) { [@data_collector[:crm_task_ids].pop] }
    end
  end

  describe '#delete_task_category' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_task_category }
      let(:args) { [@data_collector[:crm_task_category_ids].pop] }
    end
  end
end
