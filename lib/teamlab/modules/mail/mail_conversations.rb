# frozen_string_literal: true

module Teamlab
  # Methods for working with mail conversations
  module MailConversations
    def get_filtered_conversations(options = {})
      @request.get(%w[conversations], options)
    end

    def get_messages_linked_into_one_chain(message_id, load_all_content)
      @request.get(['conversation', message_id.to_s], loadAllContent: load_all_content)
    end

    def get_previous_or_next_conversation_id(id, direction, options = {})
      @request.get(['conversation', id.to_s, direction.to_s], options)
    end

    def chain_crm_linked_by_message?(message_id)
      @request.get(%w[conversations link crm status], messageId: message_id)
    end

    def move_conversations_to_folder(folder_id, *message_ids)
      @request.put(%w[conversations move], folderId: folder_id, ids: message_ids.flatten)
    end

    def set_conversations_status(status, *ids)
      @request.put(%w[conversations mark], status: status, ids: ids.flatten)
    end

    def remove_conversations(*ids)
      @request.put(%w[conversations remove], ids: ids.flatten)
    end

    def restore_conversations_to_folders(*ids)
      @request.put(%w[conversations restore], ids: ids.flatten)
    end

    def mark_conversation_as_crm_linked(message_id, *crm_contact_ids)
      @request.put(%w[conversations crm mark], messageId: message_id, crmContactIds: crm_contact_ids.flatten)
    end

    def unmark_conversation_link_with_crm(message_id, *crm_contact_ids)
      @request.put(%w[conversations crm unmark], messageId: message_id, crmContactIds: crm_contact_ids.flatten)
    end

    def add_tag_to_conversations(tag_id, *conversation_ids)
      @request.put(['conversations', 'tag', tag_id.to_s, 'set'], messages: conversation_ids.flatten)
    end

    def remove_tag_from_conversations(tag_id, *conversation_ids)
      @request.put(['conversations', 'tag', tag_id.to_s, 'unset'], messages: conversation_ids.flatten)
    end
  end
end
