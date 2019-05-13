module Teamlab
  # Module for projects files methods
  module ProjectsFiles
    def get_task_files(task_id)
      @request.get(['task', task_id.to_s, 'files'])
    end

    def get_entity_files(entity_id, entity_type)
      @request.get([entity_id.to_s, 'entityfiles'], entityType: entity_type)
    end

    def get_message_files(message_id)
      @request.get(['message', message_id.to_s, 'files'])
    end

    def upload_file_to_task(task_id, *files)
      @request.post(['task', task_id.to_s, 'files'], files: files.flatten)
    end

    def upload_file_to_message(message_id, *files)
      @request.post(['message', message_id.to_s, 'files'], files: files.flatten)
    end

    def detach_file_from_task(task_id, file_id)
      @request.delete(['task', task_id.to_s, 'files'], fileid: file_id)
    end

    def detach_file_from_message(message_id, file_id)
      @request.delete(['message', message_id.to_s, 'files'], fileid: file_id)
    end
  end
end
