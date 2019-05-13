module Teamlab
  # Methods for working with mail folders
  module MailFolders
    def get_folders(options = {})
      @request.get(%w[folders], options)
    end

    def get_folder_change_date(folder_id)
      @request.get(['folders', folder_id.to_s, 'modify_date'])
    end

    def remove_all_messages_from_folder(folder_id)
      @request.delete(['folders', folder_id.to_s, 'messages'])
    end
  end
end
