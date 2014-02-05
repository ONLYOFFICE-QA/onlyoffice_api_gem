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
  end
end