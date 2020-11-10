# frozen_string_literal: true

# Module for code to cleanup mailserver
module MailServerCleanup
  def remove_mailserver_mailboxes
    mailboxes = Teamlab.mailserver.mailboxes.body['response']
    return if mailboxes.empty?

    mailboxes.each do |mailbox|
      Teamlab.mailserver.delete_mailbox(mailbox['id'])
    end
  end
end
