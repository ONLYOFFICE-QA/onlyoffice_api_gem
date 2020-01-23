# frozen_string_literal: true

module Teamlab
  # Helper to store methods for working with groups
  module GroupHelper
    # @param name [String] group info
    # @return [Hash] info about that group
    def info_by_name(name)
      get_groups.data.each do |group|
        return group if group['name'] == name
      end
      nil
    end
  end
end
