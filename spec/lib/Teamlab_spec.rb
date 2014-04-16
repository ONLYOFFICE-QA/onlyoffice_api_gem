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
      DATA_COLLECTOR[data_param] << param_names.inject(@response.body['response']) { |resp, param| resp[param] } if add_data_to_collector
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
        let(:args) { random_word(4) }
      end
    end

    describe '#filter' do
      it_should_behave_like 'an api request' do
        let(:command) { :filter_people }
        let(:args) { { activationStatus: 1 } }
      end
    end

    describe '#add_user' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_user }
        let(:args) { [random_bool, random_email, random_word.capitalize, random_word.capitalize] }
        let(:add_data_to_collector) { true }
        let(:data_param) {:new_user_ids}
        let(:param_names) {%w(id)}
      end
    end

    describe '#get_user_by_username' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_user_by_username }
        let(:args) { DATA_COLLECTOR[:new_user_ids].first }
        let(:add_data_to_collector) { true }
        let(:data_param) {:emails}
        let(:param_names) {%w(email)}
      end
    end

    describe '#get_people_by_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_people_by_status }
        let(:args) { USER_STATUSES.sample }
      end
    end

    describe '#get_people_by_search_query' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_people_by_search_query }
        let(:args) { random_word }
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
        let(:args) { [random_id(:new_user), random_bool, random_email, random_word, random_word, { comment: random_word}] }
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

    describe '#change_people_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :change_people_status }
        let(:args) { [ USER_STATUSES.sample, DATA_COLLECTOR[:new_user_ids]] }
      end
    end

    describe '#add_contacts' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_contacts }
        let(:args) { [ USER_CONTACTS, random_id(:new_user)] }
      end
    end

    describe '#delete_photo' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_photo }
        let(:args) { random_id(:new_user) }
      end
    end

    describe '#delete_contacts' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_contacts }
        let(:args) { [random_id(:new_user), USER_CONTACTS] }
      end
    end

    describe '#delete_user' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_user }
        let(:args) { DATA_COLLECTOR[:new_user_ids].pop }
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

    describe '#add_group' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_group }
        let(:args) { [random_id(:user), random_word, DATA_COLLECTOR[:user_ids]] }
        let(:add_data_to_collector) { true }
        let(:data_param) {:group_ids}
        let(:param_names) {%w(id)}
      end
    end

    describe '#get_group' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_group }
        let(:args) { random_id(:group) }
      end
    end

    describe '#replace_members' do
      it_should_behave_like 'an api request' do
        let(:command) { :replace_members }
        let(:args) { [random_id(:group), DATA_COLLECTOR[:user_ids]] }
      end
    end

    describe '#update_group' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_group }
        let(:args) { [random_id(:group), { groupManager: random_id(:user), groupName: random_word, members: DATA_COLLECTOR[:user_ids] }] }
      end
    end

    describe '#add_group_users' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_group_users }
        let(:args) { [random_id(:group), DATA_COLLECTOR[:user_ids]] }
      end
    end

    describe '#set_group_manager' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_group_manager }
        let(:args) { [random_id(:group), random_id(:user)] }
      end
    end

    describe '#move_group_members' do
      it_should_behave_like 'an api request' do
        let(:command) { :move_group_members }
        let(:args) { [random_id(:group), random_id(:group)] }
      end
    end

    describe '#remove_group_members' do
      it_should_behave_like 'an api request' do
        let(:command) { :remove_group_members }
        let(:args) { random_id(:group) }
      end
    end

    describe '#delete_group' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_group }
        let(:args) { DATA_COLLECTOR[:group_ids].pop }
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
        let(:args) { [random_settings_entity_id] }
      end
    end

    describe '#get_admin_security' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_admin_security }
        let(:args) { [random_settings_entity_id, random_id(:user)] }
      end
    end

    describe '#get_product_admin' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_product_admin }
        let(:args) { [random_settings_entity_id] }
      end
    end

    describe '#set_version' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_version }
        let(:args) { [rand(2..50)] }
      end
    end

    describe '#set_security' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_security }
        let(:args) { [random_settings_entity_id, {enabled: random_bool}] }
      end
    end

    describe '#set_access' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_access }
        let(:args) { [random_settings_entity_id, random_bool] }
      end
    end

    describe '#set_product_admin' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_product_admin }
        let(:args) { [random_settings_entity_id, random_id(:user)] }
      end
    end
  end

  describe '[Files]' do

    let(:teamlab_module) { :files }

    describe '#get_my_files' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_my_files }
        #let(:add_data_to_collector) { true }
        #let(:data_param) {:my_documents_ids}
        #let(:param_names) {%w(current id)}
      end
    end

    describe '#get_trash' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_trash }
        let(:add_data_to_collector) { true }
        let(:data_param) {:trash_documents_ids}
        let(:param_names) {%w(current id)}
      end
    end

    describe '#get_shared_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_shared_docs }
        let(:add_data_to_collector) { true }
        let(:data_param) {:shared_documents_ids}
        let(:param_names) {%w(current id)}
      end
    end

    describe '#get_common_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_common_docs }
        let(:add_data_to_collector) { true }
        let(:data_param) {:common_documents_ids}
        let(:param_names) {%w(current id)}
      end
    end

    describe '#new_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :new_folder }
        let(:args) { [random_id(:my_documents), random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) {:new_folder_ids}
        let(:param_names) {%w(current id)}
      end
    end

    describe '#get_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_folder }
        let(:args) { random_id(:new_folder) }
      end
    end

    describe '#rename_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :rename_folder }
        let(:args) { [random_id(:new_folder), random_word] }
      end
    end

    describe '#search' do
      it_should_behave_like 'an api request' do
        let(:command) { :search }
        let(:args) { random_word }
      end
    end

    describe '#get_recent_upload_files' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_recent_upload_files }
        let(:args) { [random_id(:my_documents)] }
      end
    end

    describe '#create_file' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_file }
        let(:args) { [random_id(:new_folder), random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) {:new_file_ids}
        let(:param_names) {%w(id)}
      end
    end

    describe '#generate_shared_link' do
      it_should_behave_like 'an api request' do
        let(:command) { :generate_shared_link }
        let(:args) { [random_id(:new_file), FILES_SHARE_TYPES.sample] }
      end
    end

    #describe '#upload_to_my_docs' do
    #  it_should_behave_like 'an api request' do
    #    let(:command) { :upload_to_my_docs }
    #    let(:args) { FILE_TO_UPLOAD }
    #  end
    #end
    #
    #describe '#upload_to_common_docs' do
    #  it_should_behave_like 'an api request' do
    #    let(:command) { :upload_to_common_docs }
    #    let(:args) { FILE_TO_UPLOAD }
    #  end
    #end
    #
    #describe '#upload_to_folder' do
    #  it_should_behave_like 'an api request' do
    #    let(:command) { :upload_to_folder }
    #    let(:args) { [random_id(:new_folder), FILE_TO_UPLOAD] }
    #  end
    #end
    #
    #describe '#chunked_upload' do
    #  it_should_behave_like 'an api request' do
    #    let(:command) { :chunked_upload }
    #    let(:args) { [random_id(:new_folder), FILE_TO_UPLOAD] }
    #  end
    #end

    describe '#create_txt_in_my_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_txt_in_my_docs }
        let(:args) { [random_word, random_word(rand(100))] }
        #let(:add_data_to_collector) { true }
        #let(:data_param) {:some_file_ids}
        #let(:param_names) {%w(current id)}
      end
    end

    describe '#create_html_in_my_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_html_in_my_docs }
        let(:args) { [random_word, random_word(rand(100))] }
        #let(:add_data_to_collector) { true }
        #let(:data_param) {:some_file_ids}
        #let(:param_names) {%w(current id)}
      end
    end

    describe '#create_txt_in_common_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_txt_in_common_docs }
        let(:args) { [random_word, random_word(rand(100))] }
        #let(:add_data_to_collector) { true }
        #let(:data_param) {:some_file_ids}
        #let(:param_names) {%w(current id)}
      end
    end

    describe '#create_html_in_common_docs' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_html_in_common_docs }
        let(:args) { [random_word, random_word(rand(100))] }
        #let(:add_data_to_collector) { true }
        #let(:data_param) {:some_file_ids}
        #let(:param_names) {%w(current id)}
      end
    end

    describe '#create_txt' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_txt }
        let(:args) { [random_id(:new_folder), random_word, random_word(rand(100))] }
        #let(:add_data_to_collector) { true }
        #let(:data_param) {:some_file_ids}
        #let(:param_names) {%w(current id)}
      end
    end

    describe '#create_html' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_html }
        let(:args) { [random_id(:new_folder), random_word, random_word(rand(100))] }
        #let(:add_data_to_collector) { true }
        #let(:data_param) {:some_file_ids}
        #let(:param_names) {%w(current id)}
      end
    end

    describe '#get_file_info' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_file_info }
        let(:args) { [random_id(:new_file)] }
      end
    end

    describe '#get_file_history' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_file_history }
        let(:args) { [random_id(:new_file)] }
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
        let(:args) { [random_id(:new_file), random_word, 1] }
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
        let(:args) { [THIRD_PARTY_SERVICE, THIRD_PARTY_FOLDER_ID, random_bool, [], THIRD_PARTY_LOGIN_DATA] }
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
        let(:args) { [random_id(:new_folder), { fileids: DATA_COLLECTOR[:new_file_ids].sample(rand(1..4)), overwrite: random_bool}] }
      end
    end

    describe '#copy_to_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :copy_to_folder }
        let(:args) { [random_id(:new_folder), { fileids: DATA_COLLECTOR[:new_file_ids].sample(rand(1..4)), overwrite: random_bool}] }
      end
    end

    describe '#delete' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete }
        let(:args) { [ folderIds: [], fileids: [] ] }
      end
    end

    describe '#finish_all' do
      it_should_behave_like 'an api request' do
        let(:command) { :finish_all }
      end
    end

    describe '#mark_as_read' do
      it_should_behave_like 'an api request' do
        let(:command) { :mark_as_read }
      end
    end

    describe '#finish_operations' do
      it_should_behave_like 'an api request' do
        let(:command) { :finish_operations }
        let(:args) { [ folderIds: [random_id(:new_folder)], fileids: [random_id(:new_file)] ] }
      end
    end

    describe '#get_file_sharing' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_file_sharing }
        let(:args) { [random_id(:new_file)] }
      end
    end

    describe '#get_folder_sharing' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_folder_sharing }
        let(:args) { [random_id(:new_folder)] }
      end
    end

    describe '#share_file' do
      it_should_behave_like 'an api request' do
        let(:command) { :share_file }
        let(:args) { [random_id(:new_file), random_id(:user), 1, { notify: random_bool, sharingMessage: random_word }] }
      end
    end

    describe '#share_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :share_folder }
        let(:args) { [random_id(:new_folder), random_id(:user), 1, { notify: random_bool, sharingMessage: random_word }] }
      end
    end

    describe '#remove_file_sharing_rights' do
      it_should_behave_like 'an api request' do
        let(:command) { :remove_file_sharing_rights }
        let(:args) { [ random_id(:new_file), [random_id(:user)] ] }
      end
    end

    describe '#remove_folder_sharing_rights' do
      it_should_behave_like 'an api request' do
        let(:command) { :remove_folder_sharing_rights }
        let(:args) { [ random_id(:new_folder), [random_id(:user)] ] }
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

    describe '#delete_file' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_file }
        let(:args) { [DATA_COLLECTOR[:new_file_ids].pop] }
      end
    end

    describe '#delete_folder' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_folder }
        let(:args) { [DATA_COLLECTOR[:new_folder_ids].pop] }
      end
    end

    describe '#clear_recycle_bin' do
      it_should_behave_like 'an api request' do
        let(:command) { :clear_recycle_bin }
      end
    end
  end

  describe '[Project]' do

    describe 'Preparing enviroment' do
      describe '#add_user' do
        it_should_behave_like 'an api request' do
          let(:teamlab_module) { :people }
          let(:command) { :add_user }
          let(:args) { [false, random_email, random_word.capitalize, random_word.capitalize] }
          let(:add_data_to_collector) { true }
          let(:data_param) { :user_ids }
          let(:param_names) { %w(id) }
        end
      end

      describe '#get_my_files' do
        it_should_behave_like 'an api request' do
          let(:teamlab_module) { :files }
          let(:command) { :get_my_files }
          let(:add_data_to_collector) { true }
          let(:data_param) { :my_documents_ids }
          let(:param_names) { %w(current id) }
        end
      end

      describe '#create_file' do
        it_should_behave_like 'an api request' do
          let(:teamlab_module) { :files }
          let(:command) { :create_file }
          let(:args) { [random_id(:my_documents), random_word] }
          let(:add_data_to_collector) { true }
          let(:data_param) { :file_ids }
          let(:param_names) { %w(id) }
        end
      end
    end

    let(:teamlab_module) { :project }

    describe '#add_importing_url_to_queue' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_importing_url_to_queue }
        let(:args) { [BASECAMP_URL, BASECAMP_LOGIN, BASECAMP_PSW, IMPORT_CLOSED_PROJECTS, DISABLE_NOTIFICATONS, IMPORT_USERS_AS_COLLABORATORS] }
      end
    end

    describe '#get_projects_for_import' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_projects_for_import }
        let(:args) { [BASECAMP_URL, BASECAMP_LOGIN, BASECAMP_PSW] }
      end
    end

    describe '#get_import_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_import_status }
      end
    end

    describe '#create_project' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_project }
        let(:args) { [random_word, random_word, random_id(:user), random_word(3), random_bool] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :project_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#add_message' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_message }
        let(:args) { [random_id(:project), random_word, random_word, DATA_COLLECTOR[:user_ids].join(',')] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :discussion_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#create_template' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_template }
        let(:args) { [random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :project_template_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#add_task' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_task }
        let(:args) { [random_id(:project), random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :project_task_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#add_task_from_discussion' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_task_from_discussion }
        let(:args) { [random_id(:project), random_id(:discussion)] }
      end
    end

    describe '#create_subtask' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_my_tasks_with_status }
        let(:args) { [random_id(:project_task), random_id(:user), random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :project_subtask_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#upload_file_to_task' do
      it_should_behave_like 'an api request' do
        let(:command) { :upload_file_to_task }
        let(:args) { [random_id(:project_task), [random_id(:file)]] }
      end
    end

    describe '#upload_file_to_message' do
      it_should_behave_like 'an api request' do
        let(:command) { :upload_file_to_message }
        let(:args) { [random_id(:discussion), [random_id(:file)]] }
      end
    end

    describe '#add_milestone' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_milestone }
        let(:args) { [random_id(:project), random_word, DateTime.commercial(2015).to_s, random_id(:user)] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :project_milestone_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#add_task_comment' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_task_comment }
        let(:args) { [random_id(:project_task), random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :comment_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#add_message_comment' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_message_comment }
        let(:args) { [random_id(:project_task), random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :comment_ids }
        let(:param_names) { %w(id) }
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
        let(:args) { [{projectId: random_id(:project)}] }
      end
    end

    describe '#get_messages' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_messages }
        let(:args) { [random_id(:project)] }
      end
    end

    describe '#check_subscription_to_discussion' do
      it_should_behave_like 'an api request' do
        let(:command) { :check_subscription_to_discussion }
        let(:args) { [random_id(:discussion)] }
      end
    end

    describe '#update_message' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_message }
        let(:args) { [random_id(:discussion), random_id(:project), random_word, random_word] }
      end
    end

    describe '#subscribe_to_message_action' do
      it_should_behave_like 'an api request' do
        let(:command) { :subscribe_to_message_action }
        let(:args) { [random_id(:discussion)] }
      end
    end

    describe '#get_task_files' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_task_files }
        let(:args) { [random_id(:project_task)] }
      end
    end

    describe '#get_entity_files' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_entity_files }
        let(:args) { [random_id(:project_task), 'Task'] }
      end
    end

    describe '#get_message_files' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_message_files }
        let(:args) { [random_id(:discussion)] }
      end
    end

    describe '#get_comment' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_comment }
        let(:args) { [random_id(:comment)] }
      end
    end

    describe '#get_task_comments' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_task_comments }
        let(:args) { [random_id(:project_task)] }
      end
    end

    describe '#get_message_comments' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_message_comments }
        let(:args) { [random_id(:discussion)] }
      end
    end

    describe '#update_comment' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_comment }
        let(:args) { [random_id(:comment), random_word] }
      end
    end

    describe '#create_report_template' do
      it_should_behave_like 'an api request' do
        let(:command) { :create_report_template }
        let(:args) { [random_word] }
        let(:add_data_to_collector) { true }
        let(:data_param) { :report_template_ids }
        let(:param_names) { %w(id) }
      end
    end

    describe '#update_report_template' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_report_template }
        let(:args) { [random_id(:report_template), random_word] }
      end
    end

    describe '#delete_report_template' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_report_template }
        let(:args) { [DATA_COLLECTOR[:report_template_ids].pop] }
      end
    end

    describe '#get_projects' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_projects }
      end
    end

    describe '#get_project' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_project }
        let(:args) { random_id(:project) }
      end
    end

    describe '#get_participated_projects' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_participated_projects }
      end
    end

    describe '#filter_projects' do
      it_should_behave_like 'an api request' do
        let(:command) { :filter_projects }
      end
    end

    describe '#get_followed_projects' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_followed_projects }
      end
    end

    describe '#get_project_by_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_project_by_status }
        let(:args) { [PROJECT_STATUSES.sample] }
      end
    end

    describe '#get_templates' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_templates }
      end
    end

    describe '#get_spent_time' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_spent_time }
        let(:args) { [random_id(:project)] }
      end
    end

    describe '#get_project_files' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_project_files }
        let(:args) { [random_id(:project)] }
      end
    end

    describe '#get_template' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_template }
        let(:args) { [random_id(:project_template)] }
      end
    end

    describe '#get_milestones' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_milestones }
        let(:args) { [random_id(:project)] }
      end
    end

    describe '#search_all_projects' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_all_projects }
        let(:args) { [random_word] }
      end
    end

    describe '#search_project' do
      it_should_behave_like 'an api request' do
        let(:command) { :search_project }
        let(:args) { [random_id(:project), random_word] }
      end
    end

    describe '#get_milestones_with_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_milestones_with_status }
        let(:args) { [random_id(:project), PROJECT_MILESTONE_STATUSES.sample] }
      end
    end

    describe '#update_project_tags' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_project_tags }
        let(:args) { [random_id(:project), random_word(3)] }
      end
    end

    describe '#update_project_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_project_status }
        let(:args) { [random_id(:project), PROJECT_STATUSES.sample] }
      end
    end

    describe '#update_template' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_template }
        let(:args) { [random_id(:project_template), random_word] }
      end
    end

    describe '#follow_unfollow_project' do
      it_should_behave_like 'an api request' do
        let(:command) { :follow_unfollow_project }
        let(:args) { [random_id(:project)] }
      end
    end

    describe '#get_tasks_by_ids' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_tasks_by_ids }
        let(:args) { [DATA_COLLECTOR[:project_task_ids].sample(rand(2..4))] }
      end
    end

    describe '#get_task_order' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_task_order }
        let(:args) { [random_id(:project)] }
      end
    end

    describe '#get_simple_task_by_filter' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_simple_task_by_filter }
        let(:args) { [random_id(:project)] }
      end
    end

    describe '#add_link' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_link }
        let(:args) { [random_id(:project_task), random_id(:project_task), PROJECT_TASK_LINK_TYPES.sample] }
      end
    end

    describe '#update_project' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_project }
        let(:args) { [random_id(:project), random_word, random_id(:user), {private: random_bool, notify: random_bool}] }
      end
    end

    describe '#set_task_order' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_task_order }
        let(:args) { [random_id(:project_task), '123456'] }
      end
    end

    describe '#update_project_task' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_project_task }
        let(:args) { [random_id(:project_task), random_word] }
      end
    end

    describe '#get_project_team' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_project_team }
        let(:args) { [random_id(:project)] }
      end
    end

    describe '#get_projects_teams' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_projects_teams }
        let(:args) { [DATA_COLLECTOR[:project_ids].sample(rand(2..4))] }
      end
    end

    describe '#add_to_team' do
      it_should_behave_like 'an api request' do
        let(:command) { :add_to_team }
        let(:args) { [random_id(:project), random_id(:user)] }
      end
    end

    describe '#update_project_team' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_project_team }
        let(:args) { [random_id(:project), DATA_COLLECTOR[:user_ids].sample(rand(2..4)), {notify: random_bool}] }
      end
    end

    describe '#set_team_security' do
      it_should_behave_like 'an api request' do
        let(:command) { :set_team_security }
        let(:args) { [random_id(:project), random_id(:user), PROJECT_SECURITY_RIGHTS.sample] }
      end
    end

    describe '#remove_from_team' do
      it_should_behave_like 'an api request' do
        let(:command) { :remove_from_team }
        let(:args) { [random_id(:project), random_id(:user)] }
      end
    end

    describe '#get_my_tasks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_my_tasks }
      end
    end

    describe '#get_task_by_filter' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_task_by_filter }
        let(:args) { [{participant: random_id(:user)}] }
      end
    end

    describe '#get_task' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_task }
        let(:args) { [random_id(:project_task)] }
      end
    end

    describe '#get_tasks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_tasks }
        let(:args) { [random_id(:project)] }
      end
    end

    describe '#get_my_tasks_by_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_my_tasks_by_status }
        let(:args) { [PROJECT_TASKS_STATUSES.sample] }
      end
    end

    describe '#notify_task_responsible' do
      it_should_behave_like 'an api request' do
        let(:command) { :notify_task_responsible }
        let(:args) { [random_id(:project_task)] }
      end
    end

    describe '#get_all_tasks' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_all_tasks }
        let(:args) { [random_id(:project)] }
      end
    end

    describe '#get_tasks_with_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :get_tasks_with_status }
        let(:args) { [random_id(:project), PROJECT_TASKS_STATUSES.sample] }
      end
    end

    describe '#update_task_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_task_status }
        let(:args) { [random_id(:project_task), PROJECT_TASKS_STATUSES.sample] }
      end
    end

    describe '#update_subtask' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_subtask }
        let(:args) { [random_id(:project_task), random_id(:project_subtask), random_id(:user), random_word] }
      end
    end

    describe '#update_subtask_status' do
      it_should_behave_like 'an api request' do
        let(:command) { :update_subtask_status }
        let(:args) { [random_id(:project_task), random_id(:project_subtask), PROJECT_TASKS_STATUSES.sample] }
      end
    end



    describe '#delete_subtask' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_subtask }
        let(:args) { [random_id(:project_task), random_id(:project_subtask)] }
      end
    end

    describe '#detach_file_from_task' do
      it_should_behave_like 'an api request' do
        let(:command) { :detach_file_from_task }
        let(:args) { [random_id(:project_task), random_id(:file)] }
      end
    end

    describe '#detach_file_from_message' do
      it_should_behave_like 'an api request' do
        let(:command) { :detach_file_from_task }
        let(:args) { [random_id(:discussion), random_id(:file)] }
      end
    end

    describe '#delete_message_comments' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_comment }
        let(:args) { [DATA_COLLECTOR[:comment_ids].pop] }
      end
    end

    describe '#delete_task_comments' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_comment }
        puts DATA_COLLECTOR[:project_task_ids].last
        let(:args) { [DATA_COLLECTOR[:comment_ids].pop] }
      end
    end

    describe '#delete_task' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_task }
        puts DATA_COLLECTOR[:project_task_ids].last
        let(:args) { DATA_COLLECTOR[:project_task_ids].pop }
      end
    end

    describe '#delete_project' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_project }
        let(:args) { [DATA_COLLECTOR[:project_ids].pop] }
      end
    end

    describe '#delete_template' do
      it_should_behave_like 'an api request' do
        let(:command) { :delete_template }
        let(:args) { [DATA_COLLECTOR[:project_template_ids].pop] }
      end
    end

    describe '#delete_file' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :files }
        let(:command) { :delete_file }
        let(:args) { [DATA_COLLECTOR[:file_ids].pop] }
      end
    end

    describe '#delete_user' do
      it_should_behave_like 'an api request' do
        let(:teamlab_module) { :people }
        let(:command) { :delete_user }
        let(:args) { DATA_COLLECTOR[:user_ids].pop }
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
        let(:args) {[AUTOGENERATED, random_word(3).capitalize, rand(10)]}
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
        let(:args) { [random_word] }
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
        let(:args) { [random_word] }
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
        let(:args) { [random_word] }
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