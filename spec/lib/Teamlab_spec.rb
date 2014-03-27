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

    describe '#add_user' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_user }
        let(:args) { [IS_VISITOR, random_email, NEW_USER_FIRSTNAME, NEW_USER_LASTNAME] }
      end
    end

    describe '#get_user_by_username' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_user_by_username }
        let(:args) { USERNAME_FOR_OPERATIONS }
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
        let(:args) { ['1553123', FOLDER_TITLE] }
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
        let(:args) { [FOLDER_FOR_OPERATIONS_ID, FILE_TO_UPLOAD] }
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

    describe '#get_projects' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_projects }
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

    describe '#upload_file_to_task' do
      it_should_behave_like 'an api request' do
        let(:command) { :upload_file_to_task }
        let(:args) { [TASK_ID, FEW_FILES_IDS] }
      end
    end

    describe '#update_project' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_project }
        let(:args) { [PROJECT_ID_FOR_OPERATIONS, RANDOM_TITLE, RESPONSIBLE_ID, { description: PROJECT_DESCRIPTION}] }
      end
    end

    describe '#update_project_task' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_project_task }
        let(:args) { [TASK_ID, RANDOM_TITLE] }
      end
    end

    describe '#get_projects_teams' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_projects_teams }
        let(:args) { [[PROJECT_ID_FOR_OPERATIONS, ANOTHER_PROJECT_ID]] }
      end
    end

    describe '#get_task_by_filter' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_task_by_filter }
      end
    end

    describe '#add_task' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_task }
        let(:args) { [PROJECT_ID_FOR_OPERATIONS, RANDOM_TITLE] }
      end
    end

    describe '#add_task_from_discussion' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_task_from_discussion }
        let(:args) { [PROJECT_ID_FOR_OPERATIONS, MESSAGE_ID] }
      end
    end

    describe '#update_task_milestone' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_task_milestone }
        let(:args) { [TASK_ID, MILESTONE_ID] }
      end
    end

    describe '#update_milestone' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_milestone }
        let(:args) { [MILESTONE_ID, RANDOM_TITLE, SOME_DATE] }
      end
    end

    describe '#add_task_time' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_task_time }
        let(:args) { [TASK_ID, RANDOM_NOTE, SIMPLE_DATE, USER_ID, 2, PROJECT_ID_FOR_OPERATIONS] }
      end
    end

    describe '#update_task_time' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_task_time }
        let(:args) { [TIME_ID, RANDOM_NOTE, SIMPLE_DATE, USER_ID, 2] }
      end
    end
  end

  describe '[CRM]' do
    let(:teamlab_module) { :crm }

    describe '#get_all_opportunity_stages' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_opportunity_stages }
      end
    end

    describe '#get_curreny_list' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_currency_list }
      end
    end

    describe '#get_opportunity_list' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_opportunity_list }
      end
    end

    describe '#get_result_of_convertation' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_result_of_convertation }
      end
    end

    describe '#create_opportunity_stage' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_opportunity_stage }
        let(:args) { [RANDOM_TITLE, OPPORTUNITY_COLOR_NAME] }
      end
    end

    describe '#update_opportunity_stage' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_opportunity_stage }
        let(:args) { [OPPORTUNITY_ID, RANDOM_TITLE, OPPORTUNITY_COLOR_NAME] }
      end
    end

    describe '#update_opportunity_stage_order' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_opportunity_stage_order }
      end
    end

    describe '#set_opportunity_access_rights' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_opportunity_access_rights }
      end
    end

    describe '#update_opportunity' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_opportunity }
        let(:args) { [OPPORTUNITY_ID, CONTACT_ID, RANDOM_TITLE, RESPONSIBLE_ID, STAGE_ID] }
      end
    end

    describe '#update_opportunity_stage_color' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_opportunity_stage_color }
        let(:args) { [STAGE_ID, OPPORTUNITY_COLOR_NAME] }
      end
    end

    describe '#update_opportunity_stage_color' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_opportunity_stage_color }
        let(:args) { [OPPORTUNITY_ID, OPPORTUNITY_COLOR_NAME] }
      end
    end

    describe '#set_rights_to_opportunity' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_rights_to_opportunity }
        let(:args) { [OPPORTUNITY_ID, IS_PRIVATE, FEW_USER_IDS] }
      end
    end

    describe '#update_opportunity_to_stage' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_opportunity_to_stage }
        let(:args) { [OPPORTUNITY_ID, STAGE_ID] }
      end
    end

    describe '#get_invoice_taxes' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_invoice_taxes }
      end
    end

    describe '#get_cases_by_prefix' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_cases_by_prefix }
        let(:args) { [CONTACT_ID, RANDOM_TITLE] }
      end
    end

    describe '#get_contact_statuses' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_contact_statuses }
      end
    end

    describe '#get_invoice_sample' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_invoice_sample }
      end
    end

    describe '#get_invoices' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_invoices }
      end
    end

    describe '#get_contacts' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_contacts }
      end
    end

    describe '#get_settings' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_settings }
      end
    end

    describe '#get_invoice_items' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_invoice_items }
      end
    end

    describe '#get_invoice_by_id' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_invoice_by_id }
        let(:args) { [INVOICE_ID] }
      end
    end

    describe '#get_simple_contacts' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_simple_contacts }
      end
    end

    describe '#create_task' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_task }
        let(:args) { [RANDOM_TITLE, SOME_DATE, RESPONSIBLE_ID, CATEGORY_ID] }
      end
    end

    describe '#create_invoice_line' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_invoice_line }
        let(:args) { [INVOICE_ID] }
      end
    end

    describe '#create_invoice_tax' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_invoice_tax }
        let(:args) { [RANDOM_TITLE, RANDOM_NOTE] }
      end
    end

    describe '#create_invoice_tax' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_invoice_tax }
        let(:args) { [RANDOM_TITLE, RANDOM_NOTE] }
      end
    end

    describe '#create_contact_type' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_contact_type }
        let(:args) { [RANDOM_TITLE] }
      end
    end

    describe '#create_contact_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_contact_status }
        let(:args) { [RANDOM_TITLE, OPPORTUNITY_COLOR_NAME] }
      end
    end

    describe '#create_person' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_person }
        let(:args) { [NEW_USER_FIRSTNAME, NEW_USER_LASTNAME] }
      end
    end

    describe '#create_company' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_company }
        let(:args) { [RANDOM_TITLE] }
      end
    end

    describe '#create_task_group' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_task_group }
        let(:args) { [RANDOM_TITLE] }
      end
    end

    describe '#add_tag_to_batch_contacts' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_tag_to_batch_contacts }
        let(:args) { [RANDOM_TAGS] }
      end
    end

    describe '#add_tag_to_batch_contacts' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_tag_to_batch_contacts }
        let(:args) { [RANDOM_TAGS] }
      end
    end

    describe '#set_is_portal_configured' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_is_portal_configured }
      end
    end

    describe '#update_task' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_task }
        let(:args) { TASK_ID }
      end
    end

    describe '#update_invoice_tax' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_invoice_tax }
        let(:args) { TAX_ID }
      end
    end

    describe '#update_contact_type' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_contact_type }
        let(:args) { [CONTACT_TYPE_ID, RANDOM_TITLE] }
      end
    end

    describe '#update_contact_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_contact_status }
        let(:args) { [CONTACT_STATUS_ID, {title: RANDOM_TITLE}] }
      end
    end

    describe '#update_crm_contact_tag_setting' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_crm_contact_tag_setting }
      end
    end

    describe '#save_number_settings' do
      it_should_behave_like 'an api request' do
        let(:command) { :save_number_settings }
        let(:args) {[AUTOGENERATED, random_word(3, true), rand(10)]}
      end
    end

    describe '#set_access_to_batch_contact' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_access_to_batch_contact }
      end
    end

    describe '#update_statuses_contact_order' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_statuses_contact_order }
      end
    end

    describe '#save_terms_settings' do
      it_should_behave_like 'an api request' do
        let(:command) { :save_terms_settings }
      end
    end

    describe '#update_crm_contact_status_settings' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_crm_contact_status_settings }
      end
    end

    describe '#update_invoice_patch_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_invoice_patch_status }
        let(:args) { [INVOICE_STATUS, [INVOICE_ID]]}
      end
    end

    describe '#update_contact_status_color' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_contact_status_color }
        let(:args) { [CONTACT_STATUS_ID, OPPORTUNITY_COLOR_NAME]}
      end
    end

    describe '#update_person' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_person }
        let(:args) { [CONTACT_ID]}
      end
    end

    describe '#update_contact_status_by_id' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_contact_status_by_id }
        let(:args) { [CONTACT_ID, CONTACT_STATUS_ID]}
      end
    end

    describe '#update_invoice_line' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_invoice_line }
        let(:args) { [INVOICE_ID]}
      end
    end

    describe '#create_history_category' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_history_category }
        let(:args) { [RANDOM_TITLE, RANDOM_TITLE] }
      end
    end

    describe '#update_history_category' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_history_category }
        let(:args) { [HISTORY_CATEGORY_ID, RANDOM_TITLE] }
      end
    end

    describe '#get_task_list_by_filter' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_task_list_by_filter }
      end
    end

    describe '#get_all_task_categories' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_task_categories }
      end
    end

    describe '#create_task_category' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_task_category }
        let(:args) { [RANDOM_TITLE, RANDOM_NOTE, {description: RANDOM_NOTE, sortOrder: 4 }] }
      end
    end

    describe '#get_contact_upcoming_tasks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_contact_upcoming_tasks }
        let(:args) { [CONTACTS_IDS] }
      end
    end

    describe '#update_task_category' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_task_category }
        let(:args) { [CATEGORY_ID, { title: RANDOM_TITLE, description: RANDOM_NOTE, imageName: RANDOM_NOTE, sortOrder: 4 }] }
      end
    end

    describe '#get_all_contact_types' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_contact_types }
      end
    end

    describe '#get_contact_by_id' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_contact_by_id }
        let(:args) { [CONTACT_ID] }
      end
    end

    describe '#get_all_contact_info_types' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_contact_info_types }
      end
    end

    describe '#get_contacts_by_project_id' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_contacts_by_project_id }
        let(:args) { [PROJECT_ID_FOR_OPERATIONS] }
      end
    end

    describe '#get_contact_type' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_contact_type }
        let(:args) { [CONTACT_TYPE_ID] }
      end
    end

    describe '#get_contact_info' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_contact_info }
        let(:args) { [CONTACT_ID, CONTACT_INFORMATION_ID] }
      end
    end

    describe '#get_company_linked_persons_list' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_company_linked_persons_list }
        let(:args) { [COMPANY_ID] }
      end
    end

    describe '#quick_person_list_creation' do
      it_should_behave_like 'an api request' do
        let(:command) { :quick_person_list_creation }
        let(:args) { [NEW_RANDOM_USERS_ARRAY] }
      end
    end

    describe '#add_contact_info' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_contact_info }
        let(:args) { [CONTACT_ID, INFO_TYPE, RANDOM_NOTE, INFO_CATEGORY] }
      end
    end

    describe '#add_persons_to_company' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_persons_to_company }
        let(:args) { [COMPANY_ID, CONTACT_ID] }
      end
    end

    describe '#link_contact_with_project' do
      it_should_behave_like 'an api request' do
        let(:command) { :link_contact_with_project }
        let(:args) { [CONTACT_ID, PROJECT_ID_FOR_OPERATIONS] }
      end
    end

    describe '#add_contact_address' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_contact_address }
        let(:args) { [CONTACT_ID, CATEGORY_ID, RANDOM_TITLE] }
      end
    end

    describe '#set_contacts_access_rights' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_contacts_access_rights }
        let(:args) { [[CONTACT_ID]] }
      end
    end

    describe '#set_contact_access_rights' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_contact_access_rights }
        let(:args) { [CONTACT_ID] }
      end
    end

    describe '#update_company' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_company }
        let(:args) { [COMPANY_ID, RANDOM_TITLE] }
      end
    end

    describe '#update_contact_info' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_contact_info }
        let(:args) { [CONTACT_INFORMATION_ID, CONTACT_ID, INFO_TYPE, RANDOM_TITLE] }
      end
    end

    describe '#change_contact_photo_by_url' do
      it_should_behave_like 'an api request' do
        let(:command) { :change_contact_photo_by_url }
        let(:args) { [CONTACT_ID, IMAGE_URL] }
      end
    end

    describe '#add_tag_to_case_group_by_filter' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_tag_to_case_group_by_filter }
      end
    end


  end

  describe '[Community]' do
    let(:teamlab_module) { :community }

    describe '#get_all_posts' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_posts }
      end
    end

    describe '#get_blog_tags' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_blog_tags }
      end
    end

    describe '#get_my_posts' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_my_posts }
      end
    end

    describe '#get_post_by_id' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_post }
        let(:args) { [POST_ID] }
      end
    end

    describe '#get_posts_by_tag' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_posts_by_tag }
        let(:args) { [RANDOM_TAGS.sample] }
      end
    end

    describe '#search_posts' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_posts }
        let(:args) { [SEARCH_QUERY] }
      end
    end

    describe '#get_user_posts' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_user_posts }
        let(:args) { [USERNAME_FOR_OPERATIONS] }
      end
    end

    describe '#get_comments' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_comments }
        let(:args) { [POST_ID] }
      end
    end

    describe '#create_post' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_post }
        let(:args) { [RANDOM_TITLE, RANDOM_NOTE] }
      end
    end

    describe '#add_comment' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_comment }
        let(:args) { [POST_ID, RANDOM_NOTE] }
      end
    end

    describe '#update_post' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_post }
        let(:args) { [POST_ID, RANDOM_TITLE, RANDOM_NOTE, {tags: RANDOM_TAGS.join(',')}] }
      end
    end

    describe '#get_all_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_bookmarks }
      end
    end

    describe '#get_all_bookmark_tags' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_bookmark_tags }
      end
    end

    describe '#get_bookmark' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_bookmark }
        let(:args) { [BOOKMARK_ID] }
      end
    end

    describe '#get_bookmarks_added_by_me' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_bookmarks_added_by_me }
      end
    end

    describe '#get_my_favourite_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_my_favourite_bookmarks }
      end
    end

    describe '#get_top_of_day_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_top_of_day_bookmarks }
      end
    end

    describe '#get_top_of_week_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_top_of_week_bookmarks }
      end
    end

    describe '#get_top_of_month_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_top_of_month_bookmarks }
      end
    end

    describe '#get_top_of_year_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_top_of_year_bookmarks }
      end
    end

    describe '#get_bookmarks_by_tag' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_bookmarks_by_tag }
        let(:args) { [RANDOM_TAGS.sample] }
      end
    end

    describe '#get_recently_added_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_recently_added_bookmarks }
      end
    end

    describe '#get_bookmark_comments' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_bookmark_comments }
        let(:args) { [BOOKMARK_ID] }
      end
    end

    describe '#search_bookmarks' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_bookmarks }
        let(:args) { [SEARCH_QUERY] }
      end
    end

    describe '#add_bookmark' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_bookmark }
        let(:args) { [IMAGE_URL, RANDOM_TITLE] }
      end
    end

    describe '#add_comment_to_bookmark' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_comment_to_bookmark }
        let(:args) { [BOOKMARK_ID, RANDOM_NOTE] }
      end
    end

    describe '#get_all_events' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_events }
      end
    end

    describe '#get_my_events' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_my_events }
      end
    end

    describe '#get_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_event }
        let(:args) { [EVENT_ID] }
      end
    end

    describe '#search_events' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_events }
        let(:args) { [SEARCH_QUERY] }
      end
    end

    describe '#create_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_event }
        let(:args) { [RANDOM_TITLE, RANDOM_NOTE] }
      end
    end

    describe '#vote_for_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :vote_for_event }
        let(:args) { [EVENT_ID, 1] }
      end
    end

    describe '#add_comment_to_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_comment_to_event }
        let(:args) { [EVENT_ID, RANDOM_NOTE] }
      end
    end

    describe '#update_event' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_event }
        let(:args) { [EVENT_ID, RANDOM_TITLE, RANDOM_NOTE] }
      end
    end

    describe '#get_forums' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_forums }
      end
    end

    describe '#get_thread_topics' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_thread_topics }
        let(:args) { [THREAD_ID] }
      end
    end

    describe '#get_last_updated_topics' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_last_updated_topics }
      end
    end

    describe '#get_posts' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_posts }
        let(:args) { [TOPIC_ID] }
      end
    end

    describe '#search_topics' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_topics }
        let(:args) { [random_word(5)] }
      end
    end

    describe '#add_thread_to_category' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_thread_to_category }
        let(:args) { [COMMUNITY_CATEGORY_ID, RANDOM_NOTE, {categoryName: RANDOM_TITLE, threadDescription: random_word(4)}] }
      end
    end

    describe '#add_topic_to_thread' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_topic_to_thread }
        let(:args) { [THREAD_ID, RANDOM_TITLE, RANDOM_NOTE] }
      end
    end

    describe '#update_topic_in_thread' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_topic_in_thread }
        let(:args) { [TOPIC_ID] }
      end
    end

    describe '#update_post_in_topic' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_post_in_topic }
        let(:args) { [TOPIC_ID, POST_ID] }
      end
    end

    describe '#get_wiki_pages' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_wiki_pages }
      end
    end

    describe '#get_wiki_page' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_wiki_page }
        let(:args) { [WIKI_PAGE_NAME] }
      end
    end

    describe '#get_wiki_file_info' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_wiki_file_info }
        let(:args) { [WIKI_FILE_NAME] }
      end
    end

    describe '#get_page_history' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_page_history }
        let(:args) { [WIKI_PAGE_NAME] }
      end
    end

    describe '#get_all_page_comments' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_page_comments }
        let(:args) { [WIKI_PAGE_NAME] }
      end
    end

    describe '#search_wiki_pages_by_name' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_wiki_pages_by_name }
        let(:args) { [RANDOM_TITLE] }
      end
    end

    describe '#search_wiki_pages_by_content' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_wiki_pages_by_content }
        let(:args) { [RANDOM_TITLE] }
      end
    end

    describe '#create_page' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_page }
        let(:args) { [RANDOM_TITLE, RANDOM_NOTE] }
      end
    end

    describe '#create_wiki_page_comment' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_wiki_page_comment }
        let(:args) { [WIKI_PAGE_NAME, RANDOM_NOTE] }
      end
    end

    describe '#update_wiki_page' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_wiki_page }
        let(:args) { [WIKI_PAGE_NAME, RANDOM_NOTE] }
      end
    end

    describe '#update_wiki_page_comment' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_wiki_page_comment }
        let(:args) { [WIKI_PAGE_COMMENT_ID, RANDOM_NOTE] }
      end
    end
  end

  describe '[Calendar]' do
    let(:teamlab_module) { :calendar }

    describe '#get_default_access' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_default_access }
      end
    end

    describe '#get_calendar' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_calendar }
        let(:args) { [CALENDAR_ID] }
      end
    end

    describe '#get_subscription_list' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_subscription_list }
      end
    end

    describe '#get_icalc_link' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_icalc_link }
        let(:args) { [CALENDAR_ID] }
      end
    end

    describe '#get_access_parameters' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_access_parameters }
        let(:args) { [CALENDAR_ID] }
      end
    end

    describe '#create_calendar' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_calendar }
        let(:args) { [RANDOM_TITLE] }
      end
    end

    #describe '#create_calendar_by_ical_link' do
    #  it_should_behave_like 'an api request' do
    #    let(:command) { :create_calendar_by_ical_link }         #ХЗ ГДЕ ВЗЯТЬ ЛИНКУ
    #    let(:args) { [RANDOM_TITLE] }
    #  end
    #end


  end

  describe '[Mail]' do
    let(:teamlab_module) { :mail }

    describe '#get_tag_list' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_tag_list }
      end
    end

    describe '#create_tag' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_tag }
        let(:args) { [random_word(4), {style: rand(15)}] }
      end
    end
  end
end