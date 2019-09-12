# frozen_string_literal: true

module Teamlab
  # Module for projects discussions methods
  module ProjectsDiscussions
    def get_latest_discussion_messages
      @request.get(['message'])
    end

    def get_message_by_filter(options = {})
      @request.get(%w[message filter], options)
    end

    def get_messages(project_id)
      @request.get([project_id.to_s, 'message'])
    end

    def get_project_message(message_id)
      @request.get(['message', message_id.to_s])
    end

    def check_subscription_to_discussion(message_id)
      @request.get(['message', message_id.to_s, 'subscribe'])
    end

    def add_message(project_id, title, content, participants, options = {})
      @request.post([project_id.to_s, 'message'], { title: title, content: content, participants: participants }.merge(options))
    end

    def update_message(message_id, project_id, title, content, options = {})
      @request.put(['message', message_id.to_s], { projectid: project_id, title: title, content: content }.merge(options))
    end

    def update_message_status(message_id, status)
      @request.put(['message', message_id.to_s, 'status'], status: status)
    end

    def subscribe_to_message_action(message_id)
      @request.put(['message', message_id.to_s, 'subscribe'])
    end

    def delete_message(message_id)
      @request.delete(['message', message_id.to_s])
    end
  end
end
