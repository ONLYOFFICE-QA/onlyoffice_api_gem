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
  end
end
