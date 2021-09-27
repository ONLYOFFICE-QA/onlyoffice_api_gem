# frozen_string_literal: true

require 'spec_helper'

entry_type = 'contact'
tag_user = api.people.add_user(false, random_email, random_word.capitalize, random_word.capitalize).data
tag_contact = api.crm.create_person(random_word.capitalize, random_word.capitalize).data
tag_company = api.crm.create_company(random_word, [tag_user['id']], personList: [tag_contact['id']]).data
# tag_first = api.crm.create_tag(entry_type, random_word(4)).data
# tag_second = api.crm.create_tag(entry_type, random_word(4)).data
tag_third = api.crm.create_tag(entry_type, random_word(4)).data
# unused_tag = api.crm.create_tag(entry_type, random_word(4)).data

describe '[CRM]' do
  let(:teamlab_module) { :crm }

  describe '#add_contact_tag_to_group' do
    it_behaves_like 'an api request' do
      let(:command) { :add_contact_tag_to_group }
      let(:args) { [:company, tag_company['id'], tag_third] }
    end
  end

  # describe '#create_tag' do
  #   it_behaves_like 'an api request' do
  #     let(:command) { :create_tag }
  #     let(:args) { [entry_type, random_word(4)] }
  #   end
  # end
  #
  # describe '#get_tags_for_entity_type' do
  #   it_behaves_like 'an api request' do
  #     let(:command) { :get_tags_for_entity_type }
  #     let(:args) { [entry_type] }
  #   end
  # end
  #
  # describe '#get_all_contact_tags' do
  #   it_behaves_like 'an api request' do
  #     let(:command) { :get_all_contact_tags }
  #     let(:args) { [tag_contact['id']] }
  #   end
  # end
  #
  # describe '#get_entity_tags' do
  #   it_behaves_like 'an api request' do
  #     let(:command) { :get_entity_tags }
  #     let(:args) { [entry_type, tag_contact['id']] }
  #   end
  # end
  #
  # describe '#add_tag_to_case_group_by_filter' do
  #   it_behaves_like 'an api request' do
  #     let(:command) { :add_tag_to_case_group_by_filter }
  #     let(:args) { [tag_first] }
  #   end
  # end
  #
  # describe '#add_tag_group_to_entity' do
  #   it_behaves_like 'an api request' do
  #     let(:command) { :add_tag_group_to_entity }
  #     let(:args) { [entry_type, tag_contact['id'], tag_first] }
  #   end
  # end
  #
  # describe '#add_tag_to_opportunity_group' do
  #   it_behaves_like 'an api request' do
  #     let(:command) { :add_tag_to_opportunity_group }
  #     let(:args) { [tag_first] }
  #   end
  # end
  #
  # describe '#add_tag' do
  #   it_behaves_like 'an api request' do
  #     let(:command) { :add_tag }
  #     let(:args) { [entry_type, tag_contact['id'], tag_second] }
  #   end
  # end
  #
  # describe '#remove_tag' do
  #   it_behaves_like 'an api request' do
  #     let(:command) { :remove_tag }
  #     let(:args) { [entry_type, tag_contact['id'], tag_first] }
  #   end
  # end

  describe '#delete_contact_tag_to_group' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_contact_tag_to_group }
      let(:args) { [:company, tag_company['id'], tag_third] }
    end
  end
  #
  # describe '#delete_tag' do
  #   it_behaves_like 'an api request' do
  #     let(:command) { :delete_tag }
  #     let(:args) { [entry_type, tag_second] }
  #   end
  # end
  #
  # describe '#delete_unused_tags' do
  #   it_behaves_like 'an api request' do
  #     let(:command) { :delete_unused_tags }
  #     let(:args) { [entry_type] }
  #   end
  # end
end
