# frozen_string_literal: true

module Teamlab
  # Methods for working with mailserver mailboxes
  module MailserverMailboxes
    # @param name [String] name of mailbox
    # @param local_part [String] local part of mailbox
    # @param domain_id [Integer] id of domain
    # @param user_id [Integer] id of user
    # @param notify_current [True, False] Send message to creating mailbox's address
    # @param notify_profile [True, False] Send message to email from user profile
    # @return [Hash] Add mailbox
    def add_mailbox(name: nil,
                    local_part: nil,
                    domain_id: nil,
                    user_id: nil,
                    notify_current: true,
                    notify_profile: true)
      @request.post(%w[mailboxes add],
                    name: name,
                    local_part: local_part,
                    domain_id: domain_id,
                    user_id: user_id,
                    notifyCurrent: notify_current,
                    notifyProfile: notify_profile)
    end
  end
end
