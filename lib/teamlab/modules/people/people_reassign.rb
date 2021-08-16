# frozen_string_literal: true

module Teamlab
  # Module for people reassign data
  module PeopleReassign
    # Start a reassign process
    # @param from_user_id [String] guid of user from whom reassign
    # @param to_user_id [String] guid of user to whom reassign
    # @param delete_profile [True, False] Delete profile when reassignment will be finished
    # @return [Hash] reassign progress data
    def start_reassign_user_data(from_user_id, to_user_id, delete_profile = true)
      @request.post(%w[reassign start], fromUserId: from_user_id, toUserId: to_user_id, deleteProfile: delete_profile)
    end

    # Returns the progress of the started reassign process
    # @param from_user_id [String] User ID (guid) whose data is reassigned
    # @return [Hash] reassign progress data
    def reassign_progress(from_user_id)
      @request.get(%w[reassign progress], userId: from_user_id)
    end

    # Terminate reassign process
    # @param user_id [String] User ID (guid) whose data is reassigned
    # @return [Void]
    def terminate_reassign(user_id)
      @request.put(%w[reassign terminate], userId: user_id)
    end
  end
end
