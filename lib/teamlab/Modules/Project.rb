module Teamlab
  class Project
    def initialize
      @request = Teamlab::Request
    end

    def get_import_status
      @request.get(['import'])
    end

    def add_importing_url_to_queue(company_url, username, password, import_closed, disable_notifications, import_users_as_collaborators, projects = [])
      @request.post([], url: company_url, userName: username, password: password, importClosed: import_closed,
      disableNotifications: disable_notifications, importUsersAsCollaborators: import_users_as_collaborators, projects: projects)
    end

    def get_projects_for_import(url, username, password)
      @request.post(%w(import projects), url: url, userName: username, password: password)
    end

    def get_latest_discussion_messages
      @request.get(['message'])
    end

    def get_message_by_filter(options = {})
      @request.get(%w(message filter), options)
    end

    def get_messages(project_id)
      @request.get([project_id.to_s, 'message'])
    end

    def check_subscription_to_discussion(message_id)
      @request.get(['message', message_id.to_s, 'subscribe'])
    end

    def add_message(project_id, title, content, participants, options = [])
      @request.get([project_id.to_s, 'message'], { title: title, content: content, participants: participants }.merge(options))
    end
  end
end