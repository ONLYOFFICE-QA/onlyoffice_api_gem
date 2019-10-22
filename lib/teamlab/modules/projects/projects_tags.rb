# frozen_string_literal: true

module Teamlab
  # Module for projects tags methods
  module ProjectsTags
    def get_project_tags
      @request.get(%w[tag])
    end

    def get_project_by_tag(tag)
      @request.get(['tag', tag.to_s])
    end

    def get_tags_by_name(tag_name)
      @request.get(%w[tag search], tagName: tag_name)
    end
  end
end
