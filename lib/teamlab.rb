require_relative 'teamlab/version'
require_relative 'teamlab/Config'
require_relative 'teamlab/Request'
require_relative 'teamlab/Response'
require_relative 'teamlab/Modules/People'
require_relative 'teamlab/Modules/Group'
require_relative 'teamlab/Modules/Settings'
require_relative 'teamlab/Modules/Files'
require_relative 'teamlab/Modules/Project'
require_relative 'teamlab/Modules/Crm'
require_relative 'teamlab/Modules/Community'
require_relative 'teamlab/Modules/Calendar'
require_relative 'teamlab/Modules/Mail'

module Teamlab

  def self.people
    Teamlab.config.api_additive = 'people'
    @people ||= Teamlab::People.new
  end

  def self.group
    Teamlab.config.api_additive = 'group'
    @group ||= Teamlab::Group.new
  end

  def self.settings
    Teamlab.config.api_additive = 'settings'
    @settings ||= Teamlab::Settings.new
  end

  def self.files
    Teamlab.config.api_additive = 'files'
    @files ||= Teamlab::Files.new
  end

  def self.project
    Teamlab.config.api_additive = 'project'
    @project ||= Teamlab::Project.new
  end

  def self.crm
    Teamlab.config.api_additive = 'crm'
    @crm ||= Teamlab::Crm.new
  end

  def self.community
    Teamlab.config.api_additive = 'community'
    @community ||= Teamlab::Community.new
  end

  def self.calendar
    Teamlab.config.api_additive = 'calendar'
    @calendar ||= Teamlab::Calendar.new
  end

  def self.mail
    Teamlab.config.api_additive = 'mail'
    @mail ||= Teamlab::Mail.new
  end
end