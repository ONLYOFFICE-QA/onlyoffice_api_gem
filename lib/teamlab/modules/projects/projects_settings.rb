# frozen_string_literal: true

module Teamlab
  # Module for projects settings methods
  module ProjectsSettings
    # @return [Hash] Values of projects settings
    def projects_settings
      @request.get(%w[settings])
    end

    # Updates the project settings with the parameters specified in the request
    # @param options [Hash] options to change Projects module settings
    # @option everebodyCanCreate [Boolean] Specifies if all the portal users can create projects or not
    # @option hideEntitiesInPausedProjects [Boolean] Specifies if the entities will be hidden in the paused projects or not
    # @option startModule [String] Module type: Projects, Tasks, Discussions, TimeTracking
    # @option folderId [String] Folder ID
    # @return [Hash] Updated settings
    def update_projects_settings(options = {})
      @request.put(%w[settings], options)
    end
  end
end
