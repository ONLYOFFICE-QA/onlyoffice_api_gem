require_relative 'teamlab/version'
require_relative 'teamlab/config'
require_relative 'teamlab/request'
require_relative 'teamlab/response'
require_relative 'teamlab/modules/people'
require_relative 'teamlab/modules/group'
require_relative 'teamlab/modules/settings'
require_relative 'teamlab/modules/files'
require_relative 'teamlab/modules/project'
require_relative 'teamlab/modules/portals'
require_relative 'teamlab/modules/crm'
require_relative 'teamlab/modules/community'
require_relative 'teamlab/modules/calendar'
require_relative 'teamlab/modules/mail'
require_relative 'teamlab/modules/feed'

module Teamlab
  def self.people
    @people ||= Teamlab::People.new
  end

  def self.group
    @group ||= Teamlab::Group.new
  end

  def self.settings
    @settings ||= Teamlab::Settings.new
  end

  def self.files
    @files ||= Teamlab::Files.new
  end

  def self.project
    @project ||= Teamlab::Project.new
  end

  def self.portal
    @portal ||= Teamlab::Portal.new
  end

  def self.crm
    @crm ||= Teamlab::Crm.new
  end

  def self.community
    @community ||= Teamlab::Community.new
  end

  def self.calendar
    @calendar ||= Teamlab::Calendar.new
  end

  def self.mail
    @mail ||= Teamlab::Mail.new
  end

  def self.feed
    @feed ||= Teamlab::Feed.new
  end
end

OnlyOfficeApi = Teamlab
