# frozen_string_literal: true

module Teamlab
  # Module for projects team methods
  module ProjectsTeam
    def get_project_team(project_id)
      @request.get([project_id.to_s, 'team'])
    end

    def get_projects_teams(*project_ids)
      @request.post(%w[team], ids: project_ids.flatten)
    end

    def add_to_team(project_id, user_id)
      @request.post([project_id.to_s, 'team'], userid: user_id)
    end

    def update_project_team(project_id, participants_ids, options = {})
      @request.put([project_id.to_s, 'team'], { participants: participants_ids }.merge(options))
    end

    def set_team_security(project_id, user_id, security, options = {})
      @request.put([project_id.to_s, 'team', 'security'], { userId: user_id, security: security }.merge(options))
    end

    def remove_from_team(project_id, user_id)
      @request.delete([project_id.to_s, 'team'], userId: user_id)
    end
  end
end
