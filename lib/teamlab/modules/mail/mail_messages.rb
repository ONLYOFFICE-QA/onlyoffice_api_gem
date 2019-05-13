module Teamlab
  # Methods for working with mail messages
  module MailMessages
    def get_filtered_messages(page, options = {})
      @request.get(%w[messages], { page: page }.merge(options))
    end

    def get_message(id, options = {})
      @request.get(['messages', id.to_s], options)
    end

    def get_message_template
      @request.get(%w[messages template])
    end

    def get_message_modify_date
      @request.get(%w[messages modify_date])
    end

    def get_previous_or_next_message_id(id, direction, options = {})
      @request.get(['messages', id.to_s, direction.to_s], options)
    end

    def set_message_crm_status(emails, *user_ids)
      @request.post(%w[messages update_crm], emails: emails, userIds: user_ids.flatten)
    end

    def attach_teamlab_document(message_id, file_id, options = {})
      @request.post(['messages', message_id.to_s, 'document'], { fileId: file_id }.merge(options))
    end

    def set_message_status(status, *ids)
      @request.put(%w[messages mark], status: status, ids: ids.flatten)
    end

    def move_messages_to_folder(folder_id, *message_ids)
      @request.put(%w[,essages move], folderId: folder_id, ids: message_ids.flatten)
    end

    def send_message(id, options = {})
      @request.put(%w[messages send], { id: id }.merge(options))
    end

    def save_message(id, options = {})
      @request.put(%w[messages save], { id: id }.merge(options))
    end

    def remove_messages(*ids)
      @request.put(%w[messages remove], ids: ids.flatten)
    end

    def restore_message_to_folders
      @request.put(%w[messages restore])
    end

    def export_mail_to_crm_relations_history(message_id, *crm_contact_ids)
      @request.put(%w[messages crm export], messageId: message_id, crmContactIds: crm_contact_ids.flatten)
    end

    def export_attachments_to_my_docs(attachment_id)
      @request.put(%w[attachment mydocuments export], attachmentId: attachment_id)
    end

    def export_all_message_attachments_to_my_docs(message_id)
      @request.put(%w[attachments mydocuments export], messageId: message_id)
    end

    def delete_attachment_from_message(message_id, attachment_id)
      @request.delete(['messages', message_id.to_s, 'attachments', attachment_id.to_s])
    end
  end
end
