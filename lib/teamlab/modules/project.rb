# frozen_string_literal: true

require_relative 'projects/projects_comments'
require_relative 'projects/projects_contacts'
require_relative 'projects/projects_discussions'
require_relative 'projects/projects_files'
require_relative 'projects/projects_milestones'
require_relative 'projects/projects_projects'
require_relative 'projects/projects_reports'
require_relative 'projects/projects_settings'
require_relative 'projects/projects_tags'
require_relative 'projects/projects_tasks'
require_relative 'projects/projects_team'
require_relative 'projects/projects_templates'
require_relative 'projects/projects_time'

module Teamlab
  class Project
    include ProjectsComments
    include ProjectsContacts
    include ProjectsDiscussions
    include ProjectsFiles
    include ProjectsMilestones
    include ProjectsProjects
    include ProjectsReports
    include ProjectsSettings
    include ProjectsTags
    include ProjectsTasks
    include ProjectsTeam
    include ProjectsTemplates
    include ProjectsTime

    def initialize(config)
      @request = Teamlab::Request.new(config, 'project')
    end
  end
end
