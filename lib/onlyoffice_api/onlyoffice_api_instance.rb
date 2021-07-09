# frozen_string_literal: true

require_relative '../teamlab/config'

module Teamlab
  # Class for multiuser instance
  class OnlyofficeApiInstance
    def initialize(params = {})
      @config = Config.new(params)
      auth_response = Teamlab::Request.new(@config, 'authentication').post('', userName: @config.username, password: @config.password).body
      raise "Cannot get response token for #{auth_response}" if auth_response['response'].nil? || auth_response['response']['token'].nil?

      @config.token = auth_response['response']['token']
      @config.headers = { 'authorization' => @config.token }
    end

    def people
      @people ||= Teamlab::People.new(@config)
    end

    def group
      @group ||= Teamlab::Group.new(@config)
    end

    def settings
      @settings ||= Teamlab::Settings.new(@config)
    end

    def files
      @files ||= Teamlab::Files.new(@config)
    end

    def project
      @project ||= Teamlab::Project.new(@config)
    end

    def portal
      @portal ||= Teamlab::Portal.new(@config)
    end

    def crm
      @crm ||= Teamlab::Crm.new(@config)
    end

    def community
      @community ||= Teamlab::Community.new(@config)
    end

    def calendar
      @calendar ||= Teamlab::Calendar.new(@config)
    end

    def mail
      @mail ||= Teamlab::Mail.new(@config)
    end

    def mailserver
      @mailserver ||= Teamlab::MailServer.new(@config)
    end

    def feed
      @feed ||= Teamlab::Feed.new(@config)
    end
  end
end
