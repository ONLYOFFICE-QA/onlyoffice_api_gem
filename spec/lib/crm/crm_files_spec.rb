# frozen_string_literal: true

require 'spec_helper'

entry_type = 'contact'
files_contact = api.crm.create_person(random_word.capitalize, random_word.capitalize).data
file_txt = api.crm.create_txt(entry_type, files_contact['id'], random_word, random_word).data

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#get_root_folder_id' do
    it_behaves_like 'an api request' do
      let(:command) { :get_root_folder_id }
    end
  end

  describe '#get_file_list' do
    it_behaves_like 'an api request' do
      let(:command) { :get_file_list }
      let(:args) { [entry_type, files_contact['id']] }
    end
  end

  describe '#create_txt' do
    it_behaves_like 'an api request' do
      let(:command) { :create_txt }
      let(:args) { [entry_type, files_contact['id'], random_word, random_word] }
    end
  end

  describe '#upload_file' do
    it_behaves_like 'an api request' do
      let(:command) { :upload_file }
      let(:args) { [entry_type, files_contact['id'], FILE_FOR_UPLOAD] }
    end
  end

  describe '#associate_file_with_entity' do
    it_behaves_like 'an api request' do
      let(:command) { :associate_file_with_entity }
      let(:args) { [entry_type, files_contact['id'], file_txt['id']] }
    end
  end

  describe '#delete_file' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_file }
      let(:args) { [file_txt['id']] }
    end
  end
end
