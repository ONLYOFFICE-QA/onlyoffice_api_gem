require_relative '../spec_helper'

describe Teamlab do

  before :all do
    Teamlab.configure do |config|
      config.server = SERVER
      config.username = USERNAME
      config.password = PASSWORD
    end
  end

  shared_examples_for 'an api request' do
    before do
      @module = Teamlab.send(teamlab_module)
      @response = args.empty? ? @module.send(command) : @module.send(command, *args)
    end

    context 'Successful api request' do

      it 'returns Teamlab::Response object' do
        @response.should be_instance_of(Teamlab::Response)
      end

      it 'returns Teamlab::Response object with successful parameter, set to true' do
        @response.success.should be_true
      end

      it 'returns Teamlab::Response object with nil error parameter' do
        @response.error.should be_nil
      end

      it 'returns Teamlab::response object with hash body' do
        @response.body.should be_instance_of(Hash)
      end
    end
  end

  describe '[People]' do
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
        let(:args) { SEARCH_USER_NAME }
      end
    end

    describe '#filter' do
      it_should_behave_like 'an api request' do
        let(:command) { :filter_people }
        let(:args) { USER_FILTER }
      end
    end

    describe '#get_user_by_username' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_user_by_username }
        let(:args) { USER_ID }
      end
    end

    describe '#get_people_by_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_people_by_status }
        let(:args) { USER_STATUS }
      end
    end

    describe '#get_people_by_search_query' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_people_by_search_query }
        let(:args) { SEARCH_QUERY }
      end
    end

    describe '#remind_password' do
      it_should_behave_like 'an api request' do
        let(:command) { :remind_password }
        let(:args) { [USER_ID, USER_EMAIL] }
      end
    end

    describe '#search_with_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_with_status }
        let(:args) { [USER_STATUS, SEARCH_QUERY] }
      end
    end

    describe '#add_user' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_user }
        let(:args) { [IS_VISITOR, random_email, NEW_USER_FIRSTNAME, NEW_USER_LASTNAME] }
      end
    end

    describe '#active' do
      it_should_behave_like 'an api request' do
        let(:command) { :active }
        let(:args) { [] }
      end
    end

    describe '#update_contacts' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_contacts }
        let(:args) { [USER_ID, USER_CONTACTS] }
      end
    end

    describe '#send_invite' do
      it_should_behave_like 'an api request' do
        let(:command) { :send_invite }
        let(:args) { [FEW_USER_IDS] }
      end
    end

    describe '#delete' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete }
        let(:args) { [USERS_TO_DELETE] }
      end
    end

    describe '#update_user' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_user }
        let(:args) { [USER_ID, IS_VISITOR, random_email, NEW_USER_FIRSTNAME, NEW_USER_LASTNAME, { comment: NEW_USER_FIRSTNAME + ' ' + NEW_USER_LASTNAME}] }
      end
    end

    describe '#change_people_type' do
      it_should_behave_like 'an api request' do
        let(:command) { :change_people_type }
        let(:args) { [ USER_TYPE, FEW_USER_IDS] }
      end
    end

    describe '#update_photo' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_photo }
        let(:args) { [USER_ID, PATH_TO_IMAGE] }
      end
    end

    describe '#change_people_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :change_people_status }
        let(:args) { [ USER_STATUS, FEW_USER_IDS] }
      end
    end

    describe '#add_contacts' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_contacts }
        let(:args) { [ USER_CONTACTS, USER_ID] }
      end
    end

    describe '#delete_user' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_user }
        let(:args) { USERS_TO_DELETE.first }
      end
    end

    describe '#delete_photo' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_photo }
        let(:args) { USERS_TO_DELETE.first }
      end
    end

    describe '#delete_contacts' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_contacts }
        let(:args) { [USER_ID, USER_CONTACTS] }
      end
    end
  end

  describe '[Group]' do
    let(:teamlab_module) { :group }

    describe '#get_groups' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_groups }
      end
    end

    describe '#get_group' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_group }
        let(:args) { GROUP_ID }
      end
    end

    describe '#add_group' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_group }
        let(:args) { [USER_ID, GROUP_NAME, FEW_USER_IDS] }
      end
    end

    describe '#replace_members' do
      it_should_behave_like 'an api request' do
        let(:command) { :replace_members }
        let(:args) { [GROUP_ID_FOR_OPERATIONS, FEW_USER_IDS] }
      end
    end

    describe '#update_group' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_group }
        let(:args) { [GROUP_ID_FOR_OPERATIONS, GROUP_UPDATE_OPTIONS] }
      end
    end

    describe '#add_group_users' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_group_users }
        let(:args) { [GROUP_ID_FOR_OPERATIONS, FEW_USER_IDS] }
      end
    end

    describe '#set_group_manager' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_group_manager }
        let(:args) { [GROUP_ID_FOR_OPERATIONS, USER_ID] }
      end
    end

    describe '#move_group_members' do
      it_should_behave_like 'an api request' do
        let(:command) { :move_group_members }
        let(:args) { [GROUP_ID_FOR_OPERATIONS, GROUP_ID] }
      end
    end

    describe '#delete_group' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_group }
        let(:args) { GROUP_ID_TO_DELETE }
      end
    end

    describe '#remove_group_members' do
      it_should_behave_like 'an api request' do
        let(:command) { :remove_group_members }
        let(:args) { GROUP_ID_FOR_OPERATIONS }
      end
    end
  end

  describe '[Settings]' do
    let(:teamlab_module) { :settings }

    describe '#get_settings' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_settings }
      end
    end

    describe '#get_logo' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_logo }
      end
    end

    describe '#get_usage_quota' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_usage_quota }
      end
    end

    describe '#get_version' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_version }
      end
    end

    describe '#get_security' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_security }
        let(:args) { [SETTINGS_ENTITY_IDS] }
      end
    end

    describe '#get_admin_security' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_admin_security }
        let(:args) { [SETTINGS_TALK_MODULE_ID, SETTINGS_TEST_USER] }
      end
    end

    describe '#get_product_admin' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_product_admin }
        let(:args) { [SETTINGS_TALK_MODULE_ID] }
      end
    end

    describe '#set_version' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_version }
        let(:args) { [SETTINGS_VERSION] }
      end
    end

    describe '#set_security' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_security }
        let(:args) { [SETTINGS_TALK_MODULE_ID, SETTINGS_FOR_TALK] }
      end
    end

    describe '#set_access' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_access }
        let(:args) { [SETTINGS_TALK_MODULE_ID] }
      end
    end

    describe '#set_product_admin' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_product_admin }
        let(:args) { [SETTINGS_TALK_MODULE_ID, SETTINGS_TEST_USER] }
      end
    end
  end
end