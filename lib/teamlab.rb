require_relative 'teamlab/version'
require_relative 'teamlab/config'
require_relative 'teamlab/request'
require_relative 'teamlab/response'
require_relative 'teamlab/Modules/People'
require_relative 'teamlab/Modules/Group'
require_relative 'teamlab/Modules/Settings'
require_relative 'teamlab/Modules/Files'
require_relative 'teamlab/Modules/Project'
require_relative 'teamlab/Modules/Portals'
require_relative 'teamlab/Modules/Crm'
require_relative 'teamlab/Modules/Community'
require_relative 'teamlab/Modules/Calendar'
require_relative 'teamlab/Modules/Mail'

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
end
