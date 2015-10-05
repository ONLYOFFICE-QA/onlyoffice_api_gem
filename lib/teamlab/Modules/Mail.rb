module Teamlab
  class Mail

    def initialize
      @request = Teamlab::Request.new('mail')
    end

    #region Messages

    def get_filtered_messages(page, options = {})
      @request.get(%w(messages), {page: page}.merge(options))
    end

    def get_message(id, options = {})
      @request.get(['messages', id.to_s], options)
    end

    def get_message_template
      @request.get(%w(messages template))
    end

    def get_message_modify_date
      @request.get(%w(messages modify_date))
    end

    def get_previous_or_next_message_id(id, direction, options = {})
      @request.get(['messages', id.to_s, direction.to_s], options)
    end

    def set_message_crm_status(emails, *user_ids)
      @request.post(%w(messages update_crm), {emails: emails, userIds: user_ids.flatten})
    end

    def attach_teamlab_document(message_id, file_id, options = {})
      @request.post(['messages', message_id.to_s, 'document'], {fileId: file_id}.merge(options))
    end

    def set_message_status(status, *ids)
      @request.put(%w(messages mark), {status: status, ids: ids.flatten})
    end

    def move_messages_to_folder(folder_id, *message_ids)
      @request.put(%w(,essages move), folderId: folder_id, ids: message_ids.flatten)
    end

    def send_message(id, options = {})
      @request.put(%w(messages send), {id: id}.merge(options))
    end

    def save_message(id, options = {})
      @request.put(%w(messages save), {id: id}.merge(options))
    end

    def remove_messages(*ids)
      @request.put(%w(messages remove), ids: ids.flatten)
    end

    def restore_message_to_folders
      @request.put(%w(messages restore))
    end

    def export_mail_to_crm_relations_history(message_id, *crm_contact_ids)
      @request.put(%w(messages crm export), messageId: message_id, crmContactIds: crm_contact_ids.flatten)
    end

    def export_attachments_to_my_docs(attachment_id)
      @request.put(%w(attachment mydocuments export), attachmentId: attachment_id)
    end

    def export_all_message_attachments_to_my_docs(message_id)
      @request.put(%w(attachments mydocuments export), messageId: message_id)
    end

    def delete_attachment_from_message(message_id, attachment_id)
      @request.delete(['messages', message_id.to_s, 'attachments', attachment_id.to_s])
    end

    #endregion

    #region HelpCenter

    def get_html_of_help_center
      @request.get(%w(helpcenter))
    end

    #endregion

    def get_meail_signature(mailbox_id)
      @request.get(['signature', mailbox_id.to_s])
    end

    def update_signature(mailbox_id, html, options = {})
      @request.post(['signature', 'update', mailbox_id.to_s], {html: html}.merge(options))
    end

    #region Accounts

    def get_account_list
      @request.get(%w(accounts))
    end

    def get_account_by_email(email)
      @request.get(['accounts', email.to_s])
    end

    def get_default_account_settings(email, options = {})
      @request.get(['accounts', email.to_s, 'default'], options)
    end

    def create_account_with_custom_mail_service(name, email, account, password, options = {})
      @request.post(%w(accounts), {name: name, email: email, account: account, password: password}.merge(options))
    end

    def create_oauth_account(email, token, options = {})
      @request.post(%w(accounts oauth), {email: email, token: token}.merge(options))
    end

    def create_account_by_email(email, password)
      @request.post(%w(accounts simple), {email: email, password: password})
    end

    def update_account(name, email, password, options = {})
      @request.put(%w(accounts), {name: name, email: email, password: password}.merge(options))
    end

    def set_account_state(email, state)
      @request.put(['accounts', email.to_s, 'state'], state: state)
    end

    def set_account_state_by_mailbox(mailbox_id, email_in_folder)
      @request.put(['accounts', mailbox_id.to_s, 'emailinfolder'], emailInFolder: email_in_folder)
    end

    def delete_account(email)
      @request.delete(['accounts', email.to_s])
    rescue
      @request.delete(['accounts'], {email: email.to_s}) # for version 8.7
    end

    #endregion

    #region Alerts

    def get_alerts_list
      @request.get('alert')
    end

    def delete_alert_by_id(id)
      @request.delete(['alert', id.to_s])
    end

    #endregion

    #region Contacts

    def get_contact_list_for_auto_complete(term)
      @request.get(%w(contacts), term: term)
    end

    def get_crm_linked_entities(message_id)
      @request.get(%w(crm linked entities), messageId: message_id)
    end

    #endregion

    #region Conversations

    def get_filtered_conversations(options = {})
      @request.get(%w(conversations), options)
    end

    def get_messages_linked_into_one_chain(message_id, load_all_content)
      @request.get(['conversation', message_id.to_s], loadAllContent: load_all_content)
    end

    def get_previous_or_next_conversation_id(id, direction, options = {})
      @request.get(['conversation', id.to_s, direction.to_s], options)
    end

    def is_chain_crm_linked_by_message(message_id)
      @request.get(%w(conversations link crm status), messageId: message_id)
    end

    def move_conversations_to_folder(folder_id, *message_ids)
      @request.put(%w(conversations move), folderId: folder_id, ids: message_ids.flatten)
    end

    def set_conversations_status(status, *ids)
      @request.put(%w(conversations mark), status: status, ids: ids.flatten)
    end

    def remove_conversations(*ids)
      @request.put(%w(conversations remove), ids: ids.flatten)
    end

    def restore_conversations_to_folders(*ids)
      @request.put(%w(conversations restore), ids: ids.flatten)
    end

    def mark_conversation_as_crm_linked(message_id, *crm_contact_ids)
      @request.put(%w(conversations crm mark), messageId: message_id, crmContactIds: crm_contact_ids.flatten)
    end

    def unmark_conversation_link_with_crm(message_id, *crm_contact_ids)
      @request.put(%w(conversations crm unmark), messageId: message_id, crmContactIds: crm_contact_ids.flatten)
    end

    def add_tag_to_conversations(tag_id, *conversation_ids)
      @request.put(['conversations', 'tag', tag_id.to_s, 'set'], messages: conversation_ids.flatten)
    end

    def remove_tag_from_conversations(tag_id, *conversation_ids)
      @request.put(['conversations', 'tag', tag_id.to_s, 'unset'], messages: conversation_ids.flatten)
    end

    #endregion

    #region Folders

    def get_folders(options = {})
      @request.get(%w(folders), options)
    end

    def get_folder_change_date(folder_id)
      @request.get(['folders', folder_id.to_s, 'modify_date'])
    end

    def remove_all_messages_from_folder(folder_id)
      @request.get(['folders', folder_id.to_s, 'messages'])
    end

    #endregion

    #region GUID

    def generate_custom_guid
      @request.get(%w(random_guid))
    end

    #endregion

    #region IMAGES

    def get_trusted_addresses
      @request.get(%w(display_messages addresses))
    end

    def add_trusted_address(address)
      @request.post(%w(display_messages addresses), addres: address)
    end

    def remove_from_trusted_addresses(address)
      @request.delete(%w(display_messages addresses), addres: address)
    end

    #endregion

    #region Tags

    def get_tag_list
      @request.get(%w(tags))
    end

    def create_tag(name, options = {})
      @request.post(%w(tags), {name: name}.merge(options))
    end

    def update_tag(id, name, options = {})
      @request.put(['tags', id.to_s], {name: name}.merge(options))
    end

    def set_tag_to_messages(id, *message_ids)
      @request.put(['tags', id.to_s, 'set'], messages: message_ids.flatten)
    end

    def remove_tag_from_messages(id, *message_ids)
      @request.put(['tags', id.to_s, 'remove'], messages: message_ids.flatten)
    end

    def delete_tag(id)
      @request.delete(['tags', id.to_s])
    end

    #endregion
  end
end

