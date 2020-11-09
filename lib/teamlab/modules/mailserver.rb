# frozen_string_literal: true

require_relative 'mailserver/domains'

module Teamlab
  # API for MailServer api namespace
  # For example
  # https://api.onlyoffice.com/portals/section/mailserver/addressdata
  class MailServer
    include MailserverDomains

    def initialize
      @request = Teamlab::Request.new('mailserver')
    end
  end
end
