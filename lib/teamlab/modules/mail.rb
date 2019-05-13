require_relative 'mail/mail_accounts'
require_relative 'mail/mail_alerts'
require_relative 'mail/mail_contacts'
require_relative 'mail/mail_conversations'
require_relative 'mail/mail_folders'
require_relative 'mail/mail_helpcenter'
require_relative 'mail/mail_images'
require_relative 'mail/mail_messages'
require_relative 'mail/mail_settings'
require_relative 'mail/mail_signature'
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
    include MailSignature
    include MailSettings
    include MailTags

    def initialize
      @request = Teamlab::Request.new('mail')
    end
  end
end
