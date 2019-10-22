# frozen_string_literal: true

module Teamlab
  # Methods for working with community events
  module CommunityEvents
    def get_all_events
      @request.get(%w[event])
    end

    def get_my_events
      @request.get(%w[event @self])
    end

    def get_event(id)
      @request.get(['event', id.to_s])
    end

    def search_events(query)
      @request.get(['event', '@search', query])
    end

    def get_event_comments(event_id)
      @request.get(['event', event_id.to_s, 'comment'])
    end

    def create_event(title, content, options = {})
      @request.post(%w[event], { title: title, content: content }.merge(options))
    end

    def vote_for_event(event_id, *variants)
      @request.post(['event', event_id.to_s, 'vote'], variants: variants.flatten)
    end

    def add_comment_to_event(event_id, content, options = {})
      @request.post(['event', event_id.to_s, 'comment'], { content: content }.merge(options))
    end

    def update_event(event_id, options = {})
      @request.put(['event', event_id.to_s], title: options[:title],
                                             content: options[:content],
                                             type: options[:type])
    end
  end
end
