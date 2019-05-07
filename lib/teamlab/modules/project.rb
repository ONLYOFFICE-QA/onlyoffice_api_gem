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

    def initialize
      @request = Teamlab::Request.new('project')
    end

    # region Import

    def get_import_status
      @request.get(['import'])
    end

    def add_importing_url_to_queue(company_url, username, password, import_closed, disable_notifications, import_users_as_collaborators, projects = [])
      @request.post(%w[import], url: company_url, userName: username, password: password, importClosed: import_closed,
                                disableNotifications: disable_notifications, importUsersAsCollaborators: import_users_as_collaborators, projects: projects)
    end

    def get_projects_for_import(url, username, password)
      @request.post(%w[import projects], url: url, userName: username, password: password)
    end

    # endregion

    def get_tasks_by_ids(*task_ids)
      @request.get(['task'], taskid: task_ids.flatten)
    end

    def get_task_order(project_id)
      @request.get([project_id.to_s, 'order'])
    end

    def get_simple_task_by_filter(project_id, options = {})
      @request.get(%w[task filter simple], { projectid: project_id }.merge(options))
    end

    def add_link(parent_task_id, dependence_task_id, link_type)
      @request.post(['task', parent_task_id.to_s, 'link'], dependenceTaskId: dependence_task_id, linkType: link_type)
    end

    def update_project(id, title, responsible_id, options = {})
      @request.put([id.to_s], { title: title, responsibleId: responsible_id }.merge(options))
    end

    def set_task_order(project_id, order)
      @request.put([project_id.to_s, 'order'], order: order)
    end

    def update_project_task(task_id, title, options = {})
      @request.put(['task', task_id.to_s], { title: title.to_s }.merge(options))
    end
  end
end
