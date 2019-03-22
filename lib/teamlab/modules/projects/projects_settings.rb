module Teamlab
  # Module for projects settings methods
  module ProjectsSettings
    # @return [Hash] Values of projects settings
    def projects_settings
      @request.get(%w[settings])
    end
  end
end
