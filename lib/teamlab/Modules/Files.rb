module Teamlab
  class Files

    def initialize
      @request = Teamlab::Request.new('files')
    end

    def get_my_files
      @request.get(['@my'])
    end

    def get_trash
      @request.get(['@trash'])
    end

    def get_folder(folder_id, options = {})
      @request.get([folder_id.to_s], options)
    end

    def new_folder(folder_id, title)
      @request.post(['folder', folder_id.to_s], title: title)
    end

    def rename_folder(folder_id, title)
      @request.put(['folder', folder_id.to_s], title: title)
    end

    def get_shared_docs
      @request.get(['@share'])
    end

    def get_common_docs
      @request.get(['@common'])
    end

    def search(query)
      @request.get(['@search', query.to_s])
    end

    def get_recent_uploaded_files(folder_id)
      @request.get([folder_id.to_s, 'feeds'])
    end

    def generate_shared_link(file_id, share)
      @request.put([file_id.to_s, 'sharedlink'], share: share)
    end

    def upload_to_my_docs(file)
      @request.post(%w(@my upload), somefile: File.new(file))
    end

    def upload_to_common_docs(file)
      @request.post(%w(@common upload), somefile: File.new(file))
    end

    def upload_to_folder(folder_id, file)
      @request.post([folder_id.to_s, 'upload'], somefile: File.new(file))
    end

    def chunked_upload(folder_id, filename, file_size)
      @request.post([folder_id.to_s, 'upload', 'create_session'], fileName: filename, fileSize: file_size)
    end

    def create_txt_in_my_docs(title, content)
      @request.post(%w(@my text), title: title.to_s, content: content.to_s)
    end

    def create_html_in_my_docs(title, content)
      @request.post(%w(@my html), title: title.to_s, content: content.to_s)
    end

    def create_txt_in_common_docs(title, content)
      @request.post(%w(@common text), title: title.to_s, content: content.to_s)
    end

    def create_html_in_common_docs(title, content)
      @request.post(%w(common html), title: title.to_s, content: content.to_s)
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

    def get_file_info(file_id)
      @request.get(['file', file_id.to_s])
    end

    def get_file_history(file_id)
      @request.get(['file', file_id.to_s, 'history'])
    end

    def get_third_party_files(source, options = {})
      @request.get(['settings', 'import', source.to_s, 'data'], options)
    end

    def update_file_info(file_id, title, last_version)
      @request.put(['file', file_id.to_s], title: title, lastVersion: last_version)
    end

    def finish_importing
      @request.put(%w(settings import terminate))
    end

    def import_from_third_party(source, folder_id, ignore_coincidence_files, data_to_import, options = {})
      @request.put(['settings', 'import', source.to_s, 'data'], {folderId: folder_id.to_s, ignoreCoincidenceFiles: ignore_coincidence_files, dataToImport: data_to_import}.merge(options))
    end

    def delete_file(file_id)
      @request.delete(['file', file_id.to_s])
    end

    def delete_folder(folder_id)
      @request.delete(['folder', folder_id.to_s])
    end

    def get_file_operations_list
      @request.get(%w(fileops))
    end

    def move_files(dest_folder_id, options = {})
      @request.put(%w(fileops move), { destFolderId: dest_folder_id }.merge(options))
    end

    def copy_to_folder(dest_folder_id, options = {})
      @request.put(%w(fileops copy), { destFolderId: dest_folder_id }.merge(options))
    end

    def delete(options = {})
      @request.put(%w(fileops copy), options)
    end

    def finish_all
      @request.put(%w(fileops terminate))
    end

    def clear_recycle_bin
      @request.put(%w(fileops emptytrash))
    end

    def mark_as_read
      @request.put(%w(fileops markasread))
    end

    def finish_operations(options = {})
      @request.put(%w(fileops bulkdownload), options)
    end

    def get_file_sharing(file_id)
      @request.get(['file', file_id.to_s, 'share'])
    end

    def get_folder_sharing(folder_id)
      @request.get(['folder', folder_id.to_s, 'share'])
    end

    def share_file(file_id, user_id, access_type, options = {})
      @request.put(['file', file_id.to_s, 'share'], { share: { shareTo: user_id, fileShare: access_type}.merge(options) })
    end

    def share_folder(folder_id, user_id, access_type, options = {})
      @request.put(['folder', folder_id.to_s, 'share'], { share: { shareTo: user_id, fileShare: access_type}.merge(options) })
    end

    def remove_file_sharing_rights(file_id, share_to_ids)
      @request.delete(['file', file_id.to_s, 'share'], shareTo: share_to_ids)
    end

    def remove_folder_sharing_rights(folder_id, share_to_ids)
      @request.delete(['folder', folder_id.to_s, 'share'], shareTo: share_to_ids)
    end

    def get_third_party
      @request.get(%w(thirdparty))
    end

    def remove_third_party_account(provider_id)
      @request.delete(['thirdparty', provider_id.to_s])
    end

  end
end