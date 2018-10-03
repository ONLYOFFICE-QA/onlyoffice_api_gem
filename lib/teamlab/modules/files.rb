module Teamlab
  class Files
    def initialize
      @request = Teamlab::Request.new('files')
    end

    # region File Creation

    def create_txt_in_my_docs(title, content)
      @request.post(%w[@my text], title: title.to_s, content: content.to_s)
    end

    def create_html_in_my_docs(title, content)
      @request.post(%w[@my html], title: title.to_s, content: content.to_s)
    end

    def create_txt_in_common_docs(title, content)
      @request.post(%w[@common text], title: title.to_s, content: content.to_s)
    end

    def create_html_in_common_docs(title, content)
      @request.post(%w[common html], title: title.to_s, content: content.to_s)
    end

    def create_txt(folder_id, title, content)
      @request.post([folder_id.to_s, 'text'], title: title.to_s, content: content.to_s)
    end

    def create_html(folder_id, title, content)
      @request.post([folder_id.to_s, 'html'], title: title.to_s, content: content.to_s)
    end

    def create_file(folder_id, title)
      @request.post([folder_id.to_s, 'file'], title: title.to_s)
    end

    # endregion

    # region File operations

    def get_file_operations_list
      @request.get(%w[fileops])
    end

    def check_conflict(options = {})
      @request.get(%w[fileops move], options)
    end

    def check_conversion_status(fileid)
      @request.get(['file', fileid.to_s, 'checkconversion'])
    end

    def move_to_folder(dest_folder_id, options = {})
      @request.put(%w[fileops move], { destFolderId: dest_folder_id }.merge(options))
    end
    alias move_files move_to_folder

    def copy_to_folder(dest_folder_id, options = {})
      @request.put(%w[fileops copy], { destFolderId: dest_folder_id }.merge(options))
    end

    def delete(options = {})
      @request.put(%w[fileops delete], options)
    end

    def finish_all
      @request.put(%w[fileops terminate])
    end

    def mark_as_read
      @request.put(%w[fileops markasread])
    end

    def clear_recycle_bin
      @request.put(%w[fileops emptytrash])
    end

    def finish_operations(options = {})
      @request.put(%w[fileops bulkdownload], options)
    end

    def start_conversion(file_id, start)
      @request.put(['file', file_id.to_s, 'checkconversion'], start: start)
    end

    # endregion

    # region Files

    def get_file_info(file_id)
      @request.get(['file', file_id.to_s])
    end

    def get_file_history(file_id)
      @request.get(['file', file_id.to_s, 'history'])
    end

    def update_file_history(file_id, version, continue_version = false)
      @request.put(['file', file_id.to_s, 'history'], version: version, continueVersion: continue_version)
    end

    def update_file_info(file_id, title, last_version)
      @request.put(['file', file_id.to_s], title: title, lastVersion: last_version)
    end

    def delete_file(file_id)
      @request.delete(['file', file_id.to_s])
    end

    # endregion

    # region Folders

    def get_my_docs
      @request.get(['@my'])
    end
    alias get_my_files get_my_docs

    def get_shared_docs
      @request.get(['@share'])
    end

    def get_trash
      @request.get(['@trash'])
    end

    def get_common_docs
      @request.get(['@common'])
    end

    def get_projects_folder
      @request.get(['@projects'])
    end

    def get_folder(folder_id, options = {})
      @request.get([folder_id.to_s], options)
    end

    def get_folder_info(folder_id)
      @request.get(['folder', folder_id.to_s])
    end

    def get_folder_path(folder_id)
      @request.get(['folder', folder_id.to_s, 'path'])
    end

    def new_folder(folder_id, title)
      @request.post(['folder', folder_id.to_s], title: title)
    end

    def rename_folder(folder_id, title)
      @request.put(['folder', folder_id.to_s], title: title)
    end

    def delete_folder(folder_id)
      @request.delete(['folder', folder_id.to_s])
    end

    # endregion

    # region Sharing

    def get_file_sharing(file_id)
      @request.get(['file', file_id.to_s, 'share'])
    end

    def get_folder_sharing(folder_id)
      @request.get(['folder', folder_id.to_s, 'share'])
    end

    def share_file(file_id, user_id, access_type, options = {})
      @request.put(['file', file_id.to_s, 'share'], { share: { shareTo: user_id, Access: access_type } }.merge(options))
    end

    def share_folder(folder_id, user_id, access_type, options = {})
      @request.put(['folder', folder_id.to_s, 'share'], { share: { shareTo: user_id, Access: access_type } }.merge(options))
    end

    def removes_sharing_rights(options = {})
      @request.delete(['share'], options)
    end

    # endregion

    # region Third-Party Integration

    def get_third_party
      @request.get(%w[thirdparty])
    end

    def save_third_party(options = {})
      @request.post(%w[thirdparty], options)
    end

    def remove_third_party_account(provider_id)
      @request.delete(['thirdparty', provider_id.to_s])
    end

    # endregion

    # region Uploads

    def upload_to_my_docs(file)
      @request.post(%w[@my upload], somefile: File.new(file))
    end

    # @param create_new_if_exists [Boolean] create new file if same name file already exists
    def insert_to_my_docs(file, title: File.basename(file), keep_convert_status: false, create_new_if_exists: nil)
      @request.post(%w[@my insert],
                    file: File.new(file),
                    title: title,
                    keepConvertStatus: keep_convert_status,
                    createNewIfExist: create_new_if_exists)
    end

    def upload_to_common_docs(file)
      @request.post(%w[@common upload], somefile: File.new(file))
    end

    def insert_to_common_docs(file, title: File.basename(file), keep_convert_status: false)
      @request.post(%w[@common insert], file: File.new(file), title: title, keepConvertStatus: keep_convert_status)
    end

    def upload_to_folder(folder_id, file)
      @request.post([folder_id.to_s, 'upload'], somefile: File.new(file))
    end

    def insert_file(folder_id, file, title: File.basename(file), keep_convert_status: false)
      @request.post([folder_id.to_s, 'insert'], file: File.new(file), title: title, keepConvertStatus: keep_convert_status)
    end

    def chunked_upload(folder_id, filename, file_size)
      @request.post([folder_id.to_s, 'upload', 'create_session'], fileName: filename, fileSize: file_size)
    end

    # endregion

    def search(query)
      @request.get(['@search', query.to_s])
    end

    def generate_shared_link(file_id, share)
      @request.put([file_id.to_s, 'sharedlink'], share: share)
    end

    def document_server_info
      @request.get(%w[docservice])
    end

    def check_overwrite(set_value = true)
      @request.put(%w[updateifexist], set: set_value)
    end
  end
end
