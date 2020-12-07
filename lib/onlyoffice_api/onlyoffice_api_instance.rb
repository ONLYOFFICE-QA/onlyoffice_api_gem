# frozen_string_literal: true

# Class for multiuser instance
class OnlyofficeApiInstance
  def initialize(params = {})
    @config = Config.new(params)
    auth_response = Teamlab::Request.new('authentication').post('', userName: @config.username, password: @config.password).body
    raise "Cannot get response token for #{auth_response}" if auth_response['response'].nil? || auth_response['response']['token'].nil?

    @config.token = auth_response['response']['token']
    @config.headers = { 'authorization' => @config.token }
  end

  def people
    @people ||= Teamlab::People.new
  end

  def group
    @group ||= Teamlab::Group.new
  end

  def settings
    @settings ||= Teamlab::Settings.new
  end

  def files
    @files ||= Teamlab::Files.new
  end

  def project
    @project ||= Teamlab::Project.new
  end

  def portal
    @portal ||= Teamlab::Portal.new
  end

  def crm
    @crm ||= Teamlab::Crm.new
  end

  def community
    @community ||= Teamlab::Community.new
  end

  def calendar
    @calendar ||= Teamlab::Calendar.new
  end

  def mail
    @mail ||= Teamlab::Mail.new
  end

  def mailserver
    @mailserver ||= Teamlab::MailServer.new
  end

  def feed
    @feed ||= Teamlab::Feed.new
  end
end
