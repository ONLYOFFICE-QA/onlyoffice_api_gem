# frozen_string_literal: true

module Teamlab
  # Methods for working with community forums
  module CommunityForums
    def get_forums
      @request.get(%w[forum])
    end

    def get_thread_topics(id)
      @request.get(['forum', id.to_s])
    end

    def get_last_updated_topics
      @request.get(%w[forum topic recent])
    end

    def get_posts(topic_id)
      @request.get(['forum', 'topic', topic_id.to_s])
    end

    def search_topics(query)
      @request.get(['forum', '@search', query.to_s])
    end

    def add_thread_to_category(category_id, category_name, thread_name, description)
      @request.post(%w[forum], categoryId: category_id, categoryName: category_name.to_s, threadName: thread_name, threadDescription: description)
    end

    def add_topic_to_thread(thread_id, subject, content, options = {})
      @request.post(['forum', thread_id], { subject: subject, content: content }.merge(options))
    end

    def add_post_to_topic(topic_id, subject, content, options = {})
      @request.post(['forum', 'topic', topic_id.to_s], { subject: subject, content: content }.merge(options))
    end

    def update_topic_in_thread(topic_id, subject, options = {})
      @request.put(['forum', 'topic', topic_id.to_s], { subject: subject }.merge(options))
    end

    def update_post_in_topic(topic_id, post_id, options = {})
      @request.put(['forum', 'topic', topic_id.to_s, post_id.to_s], options)
    end

    # @param post_id [Integer] post to delete
    # @return [Teamlab::Response] result of delete
    def delete_forum_post(post_id)
      @request.delete(['forum', 'post', post_id.to_s])
    end

    # @param topic_id [Integer] topic to delete
    # @return [Teamlab::Response] result of delete
    def delete_forum_topic(topic_id)
      @request.delete(['forum', 'topic', topic_id.to_s])
    end

    # @param thread_id [Integer] thread to delete
    # @return [Teamlab::Response] result of delete
    def delete_thread(thread_id)
      @request.delete(['forum', 'thread', thread_id.to_s])
    end
  end
end
