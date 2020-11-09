# frozen_string_literal: true

require_relative 'mailserver/domains'
require_relative 'mailserver/mailboxes'

module Teamlab
  # API for MailServer api namespace
  # For example
  # https://api.onlyoffice.com/portals/section/mailserver/addressdata
  class MailServer
    include MailserverDomains
    include MailserverMailboxes

    def initialize
      @request = Teamlab::Request.new('mailserver')
    end
  end
end
