# frozen_string_literal: true

module Teamlab
  # Module for projects milestones methods
  module ProjectsMilestones
    def get_upcoming_milestones
      @request.get(%w[milestone])
    end

    def get_overdue_milestones
      @request.get(%w[milestone late])
    end

    def get_milestone(id)
      @request.get(['milestone', id.to_s])
    end

    def get_milestones_by_filter(options = {})
      @request.get(%w[milestone filter], options)
    end

    def get_milestone_tasks(id)
      @request.get(['milestone', id.to_s, 'task'])
    end

    def get_milestones_by_month(year, month)
      @request.get(['milestone', year.to_s, month.to_s])
    end

    def get_milestones_by_full_date(year, month, day)
      @request.get(['milestone', year.to_s, month.to_s, day.to_s])
    end

    # Returns a list of all the milestones within a project with the ID specified in the request
    # @param project_id [Symbol, String] Project ID
    # @return [Array] List of milestones
    def milestones_by_project_id(project_id)
      @request.get([project_id.to_s, 'milestone'])
    end

    # Returns a list of all the milestones within a project with the ID and status specified in the request
    # @param project_id [Symbol, String] Project ID
    # @param status [Symbol, String] Milestone status
    # @return [Array] List of milestones
    def milestones_by_project_id_and_status(project_id, status)
      @request.get([project_id.to_s, 'milestone', status.to_s])
    end

    # Adds a new milestone using the parameters (project ID, milestone title, deadline, etc) specified in the request
    # @param project_id [Symbol, String] Project ID
    # @param title [String] Milestone title
    # @param deadline [String] Milestone deadline
    # @param responsible_id [String] Milestone responsible
    # @param options [Hash] options to create a Milestone with
    # @option isKey [Boolean] Specifies if this is a key milestone or not
    # @option isNotify [Boolean] Reminds me 48 hours before the milestone due date
    # @option description [String] Milestone description
    # @option notifyResponsible [Boolean] Notifies the responsible about the milestone actions or not
    # @return [Hash] Added milestone
    def add_milestone(project_id, title, deadline, responsible_id, options = {})
      @request.post([project_id.to_s, 'milestone'], { title: title, deadline: deadline, responsible: responsible_id }.merge(options))
    end

    def update_milestone(id, title, deadline, options = {})
      @request.put(['milestone', id.to_s], { title: title, deadline: deadline }.merge(options))
    end

    def update_milestone_status(id, status)
      @request.put(['milestone', id.to_s, 'status'], status: status)
    end

    def delete_milestone(id)
      @request.delete(['milestone', id.to_s])
    end

    # Deletes the milestones with the IDs specified in the request
    # @param ids [Array] Milestone IDs
    # @return [Array] Deleted milestones
    def delete_milestones(ids)
      @request.delete(['milestone'], { ids: ids })
    end
  end
end
