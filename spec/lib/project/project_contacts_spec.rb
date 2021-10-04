# frozen_string_literal: true

require 'spec_helper'

contacts_user = api.people.add_user(false, random_email, random_word.capitalize, random_word.capitalize).data
crm_contact = api.crm.create_person(random_word.capitalize, random_word.capitalize).data
contact_project = api.project.create_project(random_word, random_word, contacts_user['id'], random_word(3), false).data

describe '[Project] Comments' do
  let(:teamlab_module) { :project }

  describe '#get_projects_for_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :get_projects_for_contact }
      let(:args) { [crm_contact['id']] }
    end
  end

  describe '#add_project_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :add_project_contact }
      let(:args) { [contact_project['id'], crm_contact['id']] }
    end
  end

  describe '#delete_project_contact' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_project_contact }
      let(:args) { [contact_project['id'], crm_contact['id']] }
    end
  end
end
