# frozen_string_literal: true

require 'spec_helper'

describe '[Project] Comments' do
  let(:teamlab_module) { :project }

  describe '#create_person' do
    it_behaves_like 'an api request' do
      let(:teamlab_module) { :crm }
      let(:command) { :create_person }
      let(:args) { [random_word.capitalize, random_word.capitalize] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :contact_ids }
      let(:param_names) { %w[id] }
    end
  end

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

  describe '#create_project' do
    it_behaves_like 'an api request' do
      let(:teamlab_module) { :project }
      let(:command) { :create_project }
      let(:args) { [random_word, random_word, random_id(:user), random_word(3), random_bool] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :project_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_projects_for_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :get_projects_for_contact }
      let(:args) { [random_id(:contact)] }
    end
  end

  describe '#add_project_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :add_project_contact }
      let(:args) { [random_id(:project), random_id(:contact)] }
    end
  end

  describe '#delete_project_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_project_contact }
      let(:args) { [random_id(:project), random_id(:contact)] }
    end
  end
end
