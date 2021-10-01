# frozen_string_literal: true

module Teamlab
  # Module for projects comments methods
  module ProjectsComments
    def get_comment(comment_id)
      @request.get(['comment', comment_id.to_s])
    end

    def get_task_comments(task_id)
      @request.get(['task', task_id.to_s, 'comment'])
    end

    def get_message_comments(message_id)
      @request.get(['message', message_id.to_s, 'comment'])
    end

    def add_task_comment(task_id, content, options = {})
      @request.post(['task', task_id.to_s, 'comment'], { content: content }.merge(options))
    end

    def add_message_comment(message_id, content, options = {})
      @request.post(['message', message_id.to_s, 'comment'], { content: content }.merge(options))
    end

    def update_comment(comment_id, content)
      @request.put(['comment', comment_id.to_s], content: content)
    end

    def delete_comment(comment_id)
      @request.delete(['comment', comment_id.to_s])
    end

    # Adds a project comment with the parameters specified in the request
    # @param entity_id [String] Entity ID
    # @param content [String] Comment text
    # @param type [String, Symbol] Comment type (message or task)
    # @return [Hash] Comment information
    def add_project_comment(entity_id, content, type, options = {})
      @request.post(%w[comment], { entityid: entity_id, content: content, type: type.to_s }.merge(options))
    end

    # Get a preview of a project comment with the ID specified in the request
    # @param htmltext [String] Comment text in the HTML format
    # @return [Hash] Comment information
    def get_a_comment_preview(htmltext, options = {})
      @request.post(%w[comment preview], { htmltext: htmltext }.merge(options))
    end
  end
end
