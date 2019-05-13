require_relative 'mail/mail_accounts'
require_relative 'mail/mail_alerts'
require_relative 'mail/mail_contacts'
require_relative 'mail/mail_conversations'
require_relative 'mail/mail_folders'
require_relative 'mail/mail_helpcenter'
require_relative 'mail/mail_images'
require_relative 'mail/mail_messages'
require_relative 'mail/mail_settings'
require_relative 'mail/mail_tags'
module Teamlab
  class Mail
    include MailAccounts
    include MailAlerts
    include MailContacts
    include MailConversations
    include MailFolders
    include MailHelpCenter
    include MailImages
    include MailMessages
    include MailSettings
    include MailTags

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
  end
end
