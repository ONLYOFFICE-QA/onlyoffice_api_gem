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

      it 'returns Teamlab::Response object with hash body' do
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

  describe '[Settings]' do
    let(:teamlab_module) { :files }

    describe '#get_my_files' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_my_files }
      end
    end

    describe '#get_trash' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_trash }
      end
    end

    describe '#get_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_folder }
        let(:args) { FOLDER_COMMON_DOCS_ID }
      end
    end

    describe '#new_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :new_folder }
        let(:args) { [FOLDER_COMMON_DOCS_ID, FOLDER_TITLE] }
      end
    end

    describe '#rename_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :rename_folder }
        let(:args) { [FOLDER_FOR_OPERATIONS_ID, FOLDER_TITLE] }
      end
    end

    describe '#get_shared_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_shared_docs }
      end
    end

    describe '#get_common_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_common_docs }
      end
    end

    describe '#search' do
      it_should_behave_like 'an api request' do
        let(:command) { :search }
        let(:args) { FOLDER_TITLE }
      end
    end

    describe '#get_recent_upload_files' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_recent_upload_files }
        let(:args) { FOLDER_COMMON_DOCS_ID }
      end
    end

    describe '#get_share_link' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_share_link }
        let(:args) { [FOLDER_FOR_OPERATIONS_ID, FILES_SHARE_TYPE] }
      end
    end

    describe '#upload_to_my_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :upload_to_my_docs }
        let(:args) { FILE_TO_UPLOAD }
      end
    end

    describe '#upload_to_common_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :upload_to_common_docs }
        let(:args) { FILE_TO_UPLOAD }
      end
    end

    describe '#upload_to_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :upload_to_folder }
        let(:args) { [FOLDER_FOR_OPERATIONS_ID, FILE_TO_UPLOAD] }
      end
    end

    describe '#chunked_upload' do
      it_should_behave_like 'an api request' do
        let(:command) { :chunked_upload }
        let(:args) { [FOLDER_FOR_OPERATIONS_ID, FILE_MORE_THAN_5_MB, FILE_SIZE_IN_BYTES] }
      end
    end

    describe '#create_txt_in_my_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_txt_in_my_docs }
        let(:args) { [NEW_FILE_NAME, NEW_FILE_CONTENT] }
      end
    end

    describe '#create_html_in_my_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_html_in_my_docs }
        let(:args) { [NEW_FILE_NAME, NEW_FILE_CONTENT] }
      end
    end

    describe '#create_txt_in_common_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_txt_in_common_docs }
        let(:args) { [NEW_FILE_NAME, NEW_FILE_CONTENT] }
      end
    end

    describe '#create_html_in_common_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_html_in_common_docs }
        let(:args) { [NEW_FILE_NAME, NEW_FILE_CONTENT] }
      end
    end

    describe '#create_txt' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_txt }
        let(:args) { [FOLDER_FOR_OPERATIONS_ID, NEW_FILE_NAME, NEW_FILE_CONTENT] }
      end
    end

    describe '#create_html' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_html }
        let(:args) { [FOLDER_FOR_OPERATIONS_ID, NEW_FILE_NAME, NEW_FILE_CONTENT] }
      end
    end

    describe '#create_file' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_file }
        let(:args) { [FOLDER_FOR_OPERATIONS_ID, NEW_FILE_NAME] }
      end
    end

    describe '#get_file_info' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_file_info }
        let(:args) { FILE_FOR_OPERATIONS_ID }
      end
    end

    describe '#get_file_history' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_file_history }
        let(:args) { FILE_FOR_OPERATIONS_ID }
      end
    end

    describe '#get_third_party_files' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_third_party_files }
        let(:args) { [THIRD_PARTY_SERVICE, THIRD_PARTY_LOGIN_DATA] }
      end
    end

    describe '#update_file_info' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_file_info }
        let(:args) { [FILE_FOR_OPERATIONS_ID, NEW_FILE_NAME, FILE_FOR_OPERATIONS_VERSION] }
      end
    end

    describe '#finish_importing' do
      it_should_behave_like 'an api request' do
        let(:command) { :finish_importing }
      end
    end

    describe '#import_from_third_party' do
      it_should_behave_like 'an api request' do
        let(:command) { :import_from_third_party }
        let(:args) { [THIRD_PARTY_SERVICE, THIRD_PARTY_FOLDER_ID, IGNORE_COINCIDENCE_FILES, DATA_TO_IMPORT, THIRD_PARTY_LOGIN_DATA] }
      end
    end

    describe '#delete_file' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_file }
        let(:args) { FILE_TO_DELETE_ID }
      end
    end

    describe '#delete_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_folder }
        let(:args) { FOLDER_TO_DELETE_ID }
      end
    end

    describe '#get_file_operations_list' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_file_operations_list }
      end
    end

    describe '#move_files' do
      it_should_behave_like 'an api request' do
        let(:command) { :move_files }
        let(:args) { [FOLDER_FOR_OPERATIONS_ID, { folderIds: [FOLDER_TO_DELETE_ID], fileids: [FILE_TO_DELETE_ID], overwrite: true}] }
      end
    end

    describe '#copy_to_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :copy_to_folder }
        let(:args) { [FOLDER_FOR_OPERATIONS_ID, { folderIds: [FOLDER_TO_DELETE_ID], fileids: [FILE_TO_DELETE_ID], overwrite: true}] }
      end
    end

    describe '#delete' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete }
        let(:args) { [ folderIds: [FOLDER_TO_DELETE_ID], fileids: [FILE_TO_DELETE_ID] ] }
      end
    end

    describe '#finish_all' do
      it_should_behave_like 'an api request' do
        let(:command) { :finish_all }
      end
    end

    describe '#clear_recycle_bin' do
      it_should_behave_like 'an api request' do
        let(:command) { :clear_recycle_bin }
      end
    end

    describe '#mark_as_read' do
      it_should_behave_like 'an api request' do
        let(:command) { :clear_recycle_bin }
      end
    end

    describe '#finish_operations' do
      it_should_behave_like 'an api request' do
        let(:command) { :finish_operations }
        let(:args) { [ folderIds: [FOLDER_FOR_OPERATIONS_ID], fileids: [FILE_FOR_OPERATIONS_ID] ] }
      end
    end

    describe '#get_file_sharing' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_file_sharing }
        let(:args) { FILE_FOR_OPERATIONS_ID }
      end
    end

    describe '#get_folder_sharing' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_folder_sharing }
        let(:args) { FOLDER_FOR_OPERATIONS_ID }
      end
    end

    describe '#share_file' do
      it_should_behave_like 'an api request' do
        let(:command) { :share_file }
        let(:args) { [FILE_FOR_OPERATIONS_ID, USER_ID, ACCESS_TYPE, { notify: NOTIFY_USER, sharingMessage: NOTIFICATION_MESSAGE }] }
      end
    end

    describe '#share_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :share_folder }
        let(:args) { [FOLDER_FOR_OPERATIONS_ID, USER_ID, ACCESS_TYPE, { notify: NOTIFY_USER, sharingMessage: NOTIFICATION_MESSAGE }] }
      end
    end

    describe '#remove_file_sharing_rights' do
      it_should_behave_like 'an api request' do
        let(:command) { :remove_file_sharing_rights }
        let(:args) { [ FILE_FOR_OPERATIONS_ID, [USER_ID] ] }
      end
    end

    describe '#remove_folder_sharing_rights' do
      it_should_behave_like 'an api request' do
        let(:command) { :remove_folder_sharing_rights }
        let(:args) { [ FOLDER_FOR_OPERATIONS_ID, [USER_ID] ] }
      end
    end

    describe '#get_third_party' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_third_party }
      end
    end

    describe '#remove_third_party_account' do
      it_should_behave_like 'an api request' do
        let(:command) { :remove_third_party_account }
        let(:args) { PROVIDER_ID }
      end
    end
  end

  describe '[Project]' do
    let(:teamlab_module) { :project }

    describe '#get_import_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_import_status }
      end
    end

    describe '#add_importing_url_to_queue' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_importing_url_to_queue }
        let(:args) { [BASECAMP_URL, BASECAMP_LOGIN, BASECAMP_PSW, IMPORT_CLOSED_PROJECTS, DISABLE_NOTIFICATONS, IMPORT_USERS_AS_COLLABORATORS] }
      end
    end

    describe '#get_projects_for_import' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_projects_for_import }
      end
    end

    describe '#get_import_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_import_status }
      end
    end

    describe '#get_latest_discussion_messages' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_latest_discussion_messages }
      end
    end

    describe '#get_message_by_filter' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_message_by_filter }
      end
    end

    describe '#get_messages' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_messages }
        let(:args) { PROJECT_ID_FOR_OPERATIONS }
      end
    end

    describe '#get_message' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_message }
        let(:args) { MESSAGE_ID }
      end
    end

    describe '#check_subscription_to_discussion' do
      it_should_behave_like 'an api request' do
        let(:command) { :check_subscription_to_discussion }
        let(:args) { MESSAGE_ID }
      end
    end

    describe '#add_message' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_message }
        let(:args) { [PROJECT_ID_FOR_OPERATIONS, MESSAGE_TITLE, MESSAGE_CONTENT, USERS_TO_DELETE] }
      end
    end

  end
end