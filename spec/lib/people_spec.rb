# frozen_string_literal: true

require_relative '../spec_helper'

configure_test_portal
new_user = api.people.add_user(random_bool, random_email, random_word.capitalize, random_word.capitalize).data

describe '[People]' do
  let(:teamlab_module) { :people }

  describe '#get_people' do
    it_behaves_like 'an api request' do
      let(:command) { :get_people }
    end
  end

  describe '#get_self' do
    it_behaves_like 'an api request' do
      let(:command) { :get_self }
    end
  end

  describe '#search_people' do
    it_behaves_like 'an api request' do
      let(:command) { :search_people }
      let(:args) { [random_word(4)] }
    end
  end

  describe '#filter' do
    it_behaves_like 'an api request' do
      let(:command) { :filter_people }
      let(:args) { [{ activationStatus: 1 }] }
    end
  end

  describe '#add_user' do
    it_behaves_like 'an api request' do
      let(:command) { :add_user }
      let(:args) { [random_bool, random_email, random_word.capitalize, random_word.capitalize] }
    end
  end

  describe '#get_user_by_username' do
    it_behaves_like 'an api request' do
      let(:command) { :get_user_by_username }
      let(:args) { [new_user['userName']] }
    end
  end

  describe '#get_people_by_status' do
    it_behaves_like 'an api request' do
      let(:command) { :get_people_by_status }
      let(:args) { [USER_STATUSES.sample] }
    end
  end

  describe '#get_people_by_search_query' do
    it_behaves_like 'an api request' do
      let(:command) { :get_people_by_search_query }
      let(:args) { [random_word] }
    end
  end

  describe '#search_with_status' do
    it_behaves_like 'an api request' do
      let(:command) { :search_with_status }
      let(:args) { [USER_STATUSES.sample.downcase, random_word] }
    end
  end

  describe '#update_contacts' do
    it_behaves_like 'an api request' do
      let(:command) { :update_contacts }
      let(:args) { [new_user['id'], USER_CONTACTS] }
    end
  end

  describe '#send_invite' do
    it_behaves_like 'an api request' do
      let(:command) { :send_invite }
      let(:args) { [new_user['id']] }
    end
  end

  describe '#delete' do
    it_behaves_like 'an api request' do
      let(:command) { :delete }
      let(:args) { [[]] }
    end
  end

  describe '#update_user' do
    it_behaves_like 'an api request' do
      let(:command) { :update_user }
      let(:args) { [new_user['id'], random_bool, random_email, random_word, random_word, { comment: random_word }] }
    end
  end

  describe '#change_people_type' do
    it_behaves_like 'an api request' do
      let(:command) { :change_people_type }
      let(:args) { [USER_TYPES.sample, new_user['id']] }
    end
  end

  describe '#update_photo' do
    it_behaves_like 'an api request' do
      let(:command) { :update_photo }
      let(:args) { [new_user['id'], PATH_TO_IMAGE] }
    end
  end

  describe '#add_contacts' do
    it_behaves_like 'an api request' do
      let(:command) { :add_contacts }
      let(:args) { [USER_CONTACTS, new_user['id']] }
    end
  end

  describe '#link_account' do
    it_behaves_like 'an api request' do
      let(:command) { :link_account }
      let(:args) { [USER_THIRD_PARTIES_PROFILES.sample] }
    end
  end

  describe '#delete_photo' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_photo }
      let(:args) { [new_user['id']] }
    end
  end

  describe '#delete_contacts' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_contacts }
      let(:args) { [new_user['id'], USER_CONTACTS] }
    end
  end

  describe '#change_people_status' do
    it_behaves_like 'an api request' do
      let(:command) { :change_people_status }
      let(:args) { ['Terminated', new_user['id']] }
    end
  end

  describe '#unlink_account' do
    it_behaves_like 'an api request' do
      let(:command) { :unlink_account }
      let(:args) { [USER_THIRD_PARTIES_PROVIDERS.sample] }
    end
  end

  describe '#delete_user' do
    it_behaves_like 'an api request' do
      let(:command) { :delete_user }
      let(:args) { [new_user['id']] }
    end
  end
end
