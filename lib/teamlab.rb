require 'teamlab/version'
require 'teamlab/Config'
require 'teamlab/Request'
require 'teamlab/Response'
require 'teamlab/Modules/People'
require 'teamlab/Modules/Group'
require 'teamlab/Modules/Settings'

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
end

#Teamlab::configure do |config|
#  config.server = 'https://autotestdoc.teamlab.com'
#  config.username = 'shockwavenn@gmail.com'
#  config.password = '123456'
#end
#
#a = Teamlab::Commands.people.filter({ 'activationStatus' => :pizda })
#p a