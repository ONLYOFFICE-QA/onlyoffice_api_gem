require_relative '../spec_helper'

describe '[Files]' do
  let(:teamlab_module) { :files }

  describe '#add_user' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :people }
      let(:command) { :add_user }
      let(:args) { [false, random_email, random_word.capitalize, random_word.capitalize] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :user_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_my_files' do
    it_should_behave_like 'an api request' do
      let(:teamlab_module) { :files }
      let(:command) { :get_my_files }
      let(:add_data_to_collector) { true }
      let(:data_param) { :my_documents_ids }
      let(:param_names) { %w[current id] }
    end
  end

  describe '#get_my_files' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_my_files }
      # let(:add_data_to_collector) { true }
      # let(:data_param) {:my_documents_ids}
      # let(:param_names) {%w(current id)}
    end
  end

  describe '#get_trash' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_trash }
      let(:add_data_to_collector) { true }
      let(:data_param) { :trash_documents_ids }
      let(:param_names) { %w[current id] }
    end
  end

  describe '#get_shared_docs' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_shared_docs }
      let(:add_data_to_collector) { true }
      let(:data_param) { :shared_documents_ids }
      let(:param_names) { %w[current id] }
    end
  end

  describe '#get_common_docs' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_common_docs }
      let(:add_data_to_collector) { true }
      let(:data_param) { :common_documents_ids }
      let(:param_names) { %w[current id] }
    end
  end

  describe '#new_folder' do
    it_should_behave_like 'an api request' do
      let(:command) { :new_folder }
      let(:args) { [random_id(:my_documents), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :new_folder_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#get_folder' do
    it_should_behave_like 'an api request' do
      let(:command) { :get_folder }
      let(:args) { [random_id(:new_folder)] }
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
      let(:args) { [random_word] }
    end
  end

  describe '#create_file' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_file }
      let(:args) { [random_id(:new_folder), random_word] }
      let(:add_data_to_collector) { true }
      let(:data_param) { :new_file_ids }
      let(:param_names) { %w[id] }
    end
  end

  describe '#generate_shared_link' do
    it_should_behave_like 'an api request' do
      let(:command) { :generate_shared_link }
      let(:args) { [random_id(:new_file), FILES_SHARE_TYPES.sample] }
    end
  end

  describe '#upload_to_my_docs' do
    it_should_behave_like 'an api request' do
      let(:command) { :upload_to_my_docs }
      let(:args) { [FILE_FOR_UPLOAD] }
    end
  end

  describe '#upload_to_common_docs' do
    it_should_behave_like 'an api request' do
      let(:command) { :upload_to_common_docs }
      let(:args) { [FILE_FOR_UPLOAD] }
    end
  end

  describe '#upload_to_folder' do
    it_should_behave_like 'an api request' do
      let(:command) { :upload_to_folder }
      let(:args) { [random_id(:new_folder), FILE_FOR_UPLOAD] }
    end
  end

  describe '#chunked_upload' do
    it_should_behave_like 'an api request' do
      let(:command) { :chunked_upload }
      let(:args) { [random_id(:new_folder), File.basename(FILE_FOR_UPLOAD), rand(1..50)] }
    end
  end

  describe '#create_txt_in_my_docs' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_txt_in_my_docs }
      let(:args) { [random_word, random_word(rand(100))] }
    end
  end

  describe '#create_html_in_my_docs' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_html_in_my_docs }
      let(:args) { [random_word, random_word(rand(100))] }
    end
  end

  describe '#create_txt_in_common_docs' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_txt_in_common_docs }
      let(:args) { [random_word, random_word(rand(100))] }
    end
  end

  describe '#create_html_in_common_docs' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_html_in_common_docs }
      let(:args) { [random_word, random_word(rand(100))] }
    end
  end

  describe '#create_txt' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_txt }
      let(:args) { [random_id(:new_folder), random_word, random_word(rand(100))] }
    end
  end

  describe '#create_html' do
    it_should_behave_like 'an api request' do
      let(:command) { :create_html }
      let(:args) { [random_id(:new_folder), random_word, random_word(rand(100))] }
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

  describe '#update_file_info' do
    it_should_behave_like 'an api request' do
      let(:command) { :update_file_info }
      let(:args) { [random_id(:new_file), random_word, 1] }
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
      let(:args) { [random_id(:new_folder), { fileids: DATA_COLLECTOR[:new_file_ids].sample(rand(1..4)), overwrite: random_bool }] }
    end
  end

  describe '#copy_to_folder' do
    it_should_behave_like 'an api request' do
      let(:command) { :copy_to_folder }
      let(:args) { [random_id(:new_folder), { fileids: DATA_COLLECTOR[:new_file_ids].sample(rand(1..4)), overwrite: random_bool }] }
    end
  end

  describe '#delete' do
    it_should_behave_like 'an api request' do
      let(:command) { :delete }
      let(:args) { [folderIds: [], fileids: []] }
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
      let(:args) { [folderIds: [random_id(:new_folder)], fileids: [random_id(:new_file)]] }
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
      let(:args) { [random_id(:new_file), [random_id(:user)]] }
    end
  end

  describe '#remove_folder_sharing_rights' do
    it_should_behave_like 'an api request' do
      let(:command) { :remove_folder_sharing_rights }
      let(:args) { [random_id(:new_folder), [random_id(:user)]] }
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

  describe '#document_server_info' do
    it_should_behave_like 'an api request' do
      let(:command) { :document_server_info }
    end
  end

  describe '#check_overwrite' do
    it_should_behave_like 'an api request' do
      let(:command) { :check_overwrite }
      let(:args) { ['true'] }
    end
  end
end
