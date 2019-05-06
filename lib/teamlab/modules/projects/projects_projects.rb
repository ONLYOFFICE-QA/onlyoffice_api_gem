module Teamlab
  # Module for projects projects methods
  module ProjectsProjects
    def get_projects
      @request.get
    end

    def get_project(id)
      @request.get([id.to_s])
    end

    def get_participated_projects
      @request.get(['@self'])
    end

    def filter_projects(options = {})
      @request.get(['filter'], options)
    end

    def get_followed_projects
      @request.get(['@follow'])
    end

    def get_project_by_status(status)
      @request.get([status.to_s])
    end

    def get_spent_time(project_id)
      @request.get([project_id.to_s, 'time'])
    end

    def get_project_files(project_id)
      @request.get([project_id.to_s, 'files'])
    end

    def get_milestones(project_id)
      @request.get([project_id.to_s, 'milestone'])
    end

    def search_all_projects(query)
      @request.get(['@search', query.to_s])
    end

    def search_project(project_id, query)
      @request.get([project_id.to_s, '@search', query.to_s])
    end

    def get_milestones_with_status(project_id, status)
      @request.get([project_id.to_s, 'milestone', status.to_s])
    end

    def create_project(title, description, responsible_id, tags, private, options = {})
      @request.post('', { title: title, description: description, responsibleid: responsible_id, tags: tags, private: private }.merge(options))
    end

    def add_milestone(project_id, title, deadline, responsible_id, options = {})
      @request.post([project_id.to_s, 'milestone'], { title: title, deadline: deadline, responsible: responsible_id }.merge(options))
    end

    def update_project_tags(id, tags)
      @request.put([id.to_s, 'tag'], tags: tags)
    end

    def update_project_status(id, status)
      @request.put([id.to_s, 'status'], status: status)
    end

    def follow_unfollow_project(project_id)
      @request.put([project_id.to_s, 'follow'])
    end

    def delete_project(id)
      @request.delete([id.to_s])
    end
  end
end
