require_relative 'mail/mail_accounts'
require_relative 'mail/mail_alerts'
require_relative 'mail/mail_contacts'
require_relative 'mail/mail_conversations'
require_relative 'mail/mail_folders'
require_relative 'mail/mail_helpcenter'
require_relative 'mail/mail_messages'
require_relative 'mail/mail_settings'
module Teamlab
  class Mail
    include MailAccounts
    include MailAlerts
    include MailContacts
    include MailConversations
    include MailFolders
    include MailHelpCenter
    include MailMessages
    include MailSettings

    def initialize
      @request = Teamlab::Request.new('mail')
    end

    def get_meail_signature(mailbox_id)
      @request.get(['signature', mailbox_id.to_s])
    end

    def update_signature(mailbox_id, html, options = {})
      @request.post(['signature', 'update', mailbox_id.to_s], { html: html }.merge(options))
    end

    # region GUID

    def generate_custom_guid
      @request.get(%w[random_guid])
    end

    # endregion

    # region IMAGES

    def get_trusted_addresses
      @request.get(%w[display_messages addresses])
    end

    def add_trusted_address(address)
      @request.post(%w[display_messages addresses], addres: address)
    end

    def remove_from_trusted_addresses(address)
      @request.delete(%w[display_messages addresses], addres: address)
    end

    # endregion

    # region Tags

    def get_tag_list
      @request.get(%w[tags])
    end

    def create_tag(name, options = {})
      @request.post(%w[tags], { name: name }.merge(options))
    end

    def update_tag(id, name, options = {})
      @request.put(['tags', id.to_s], { name: name }.merge(options))
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

    # endregion
  end
end
