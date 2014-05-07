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

#SERVER = 'https://nctautotest-rubyapitest6.teamlab.info'
#USERNAME = 'teamlab.ruby@gmail.com'
#PASSWORD = '123456'
#
#Teamlab.configure do |config|
#  config.server = SERVER
#  config.username = USERNAME
#  config.password = PASSWORD
#end
#
#
#b = Teamlab.crm.delete_user_field('contact', 21301)
##a = Teamlab.crm.create_task('CRM_TASK', DateTime.commercial(2015).to_s, '557dfd28-f423-43dd-91ce-51b9f4c4f8e0', )
##b = Teamlab.crm.create_invoice( {number: '2', contactId: 3101556, consigneeId: 3101556, templateType: 1, issueDate: '2014-04-10T06:30:00.0000000-07:00', dueDate: '2014-05-10T06:30:00.0000000-07:00',
##                                currency: 'USD', terms: 'test', entityId: 424, language: 'en-US'} )
#p 1