# frozen_string_literal: true

# Module for code to cleanup mailserver
module MailServerCleanup
  # Remove all mailserver mailboxes
  # @param [Teamlab::OnlyofficeApiInstance] api to use
  def remove_mailserver_mailboxes(api)
    mailboxes = api.mailserver.mailboxes.body['response']
    return if mailboxes.empty?

    mailboxes.each do |mailbox|
      api.mailserver.delete_mailbox(mailbox['id'])
    end
  end
end
