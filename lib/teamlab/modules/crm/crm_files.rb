module Teamlab
  # Methods for working with crm files
  module CrmFiles
    def get_root_folder_id
      @request.get(%w[files root])
    end

    def get_file_list(entity_type, entity_id)
      @request.get([entity_type.to_s, entity_id.to_s, 'files'])
    end

    def associate_file_with_entity(entity_type, entity_id, *fileids)
      @request.post([entity_type, entity_id, 'files'], fileids: fileids.flatten)
    end

    def create_txt(entity_type, entity_id, title, content)
      @request.post([entity_type.to_s, entity_id.to_s, 'files', 'text'], title: title, content: content)
    end

    def upload_file(entity_type, entity_id, file)
      @request.post([entity_type.to_s, entity_id.to_s, 'files', 'upload'], somefile: File.new(file))
    end

    def delete_file(id)
      @request.delete(['files', id.to_s])
    end
  end
end
