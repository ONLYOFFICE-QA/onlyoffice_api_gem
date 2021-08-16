# frozen_string_literal: true

module Teamlab
  # Module for people removing process
  module PeopleRemove
    # Start a remove process
    # @param userId [String] guid of user to remove
    # @param [Hash] remove progress data
    def start_remove(user_id)
      @request.post(%w[remove start], userId: user_id)
    end

    # Returns the progress of the started remove process
    # @param userId [String] guid of user to remove
    # @param from_user_id [String] remove progress data
    def get_remove_progress(user_id)
      @request.get(%w[remove progress], userId: user_id)
    end

    # Terminate remove process
    # @param userId [String] guid of user to remove
    # @return [Void]
    def terminate_remove(user_id)
      @request.put(%w[remove terminate], userId: user_id)
    end
  end
end
