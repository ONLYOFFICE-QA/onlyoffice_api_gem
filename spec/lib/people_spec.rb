require_relative '../spec_helper'

describe '[People]' do
  before :all do
    Teamlab.configure do |config|
      config.server = SERVER
      config.username = USERNAME
      config.password = PASSWORD
    end
  end

  let(:teamlab_module) { :people }

  describe '#get_people' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_people }
    end
  end

  describe '#get_self' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_self }
    end
  end

  describe '#search_people' do
    it_should_behave_like 'an api request' do
      let(:command) { :search_people }
      let(:args) { [random_word(4)] }
    end
  end

  describe '#filter' do
    it_should_behave_like 'an api request' do
      let(:command) { :filter_people }
      let(:args) { [{ activationStatus: 1 }] }
    end
  end

  describe '#add_user' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_user }
      let(:args) { [random_bool, random_email, random_word.capitalize, random_word.capitalize] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :new_user_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_user_by_username' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_user_by_username }
      let(:args) { [random_id(:new_user)] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :emails }
      let(:param_names) { %w[email] }
    end
  end

  describe '#get_people_by_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_people_by_status }
      let(:args) { [USER_STATUSES.sample] }
    end
  end

  describe '#get_people_by_search_query' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_people_by_search_query }
      let(:args) { [random_word] }
    end
  end

  describe '#remind_password' do
    it_should_behave_like 'an api request' do
      let(:command) { :remind_password }
      let(:args) { [DATA_COLLECTOR[:new_user_ids].first, DATA_COLLECTOR[:emails].pop] }
    end
  end

  describe '#search_with_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :search_with_status }
      let(:args) { [USER_STATUSES.sample.downcase, random_word] }
    end
  end

  describe '#update_contacts' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_contacts }
      let(:args) { [random_id(:new_user), USER_CONTACTS] }
    end
  end

  describe '#send_invite' do
    it_should_behave_like 'an api request' do
      let(:command) { :send_invite }
      let(:args) { [DATA_COLLECTOR[:new_user_ids]] }
    end
  end

  describe '#delete' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete }
      let(:args) { [[]] }
    end
  end

  describe '#update_user' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_user }
      let(:args) { [random_id(:new_user), random_bool, random_email, random_word, random_word, { comment: random_word }] }
    end
  end

  describe '#change_people_type' do
    it_should_behave_like 'an api request' do
      let(:command) { :change_people_type }
      let(:args) { [USER_TYPES.sample, DATA_COLLECTOR[:new_user_ids]] }
    end
  end

  describe '#update_photo' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_photo }
      let(:args) { [random_id(:new_user), PATH_TO_IMAGE] }
    end
  end

  describe '#add_contacts' do
    it_should_behave_like 'an api request' do
      let(:command) { :add_contacts }
      let(:args) { [USER_CONTACTS, random_id(:new_user)] }
    end
  end

  describe '#link_account' do
    it_should_behave_like 'an api request' do
      let(:command) { :link_account }
      let(:args) { [USER_THIRD_PARTIES_PROFILES.sample] }
    end
  end

  describe '#delete_photo' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_photo }
      let(:args) { [random_id(:new_user)] }
    end
  end

  describe '#delete_contacts' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_contacts }
      let(:args) { [random_id(:new_user), USER_CONTACTS] }
    end
  end

  describe '#change_people_status' do
    it_should_behave_like 'an api request' do
      let(:command) { :change_people_status }
      let(:args) { ['Terminated', DATA_COLLECTOR[:new_user_ids]] }
    end
  end

  describe '#delete_user' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete_user }
      let(:args) { [DATA_COLLECTOR[:new_user_ids].pop] }
    end
  end

  describe '#unlink_account' do
    it_should_behave_like 'an api request' do
      let(:command) { :unlink_account }
      let(:args) { [USER_THIRD_PARTIES_PROVIDERS.sample] }
    end
  end
end
