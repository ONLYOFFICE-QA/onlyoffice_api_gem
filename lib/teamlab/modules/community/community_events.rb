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

    def update_event(event_id, title, content, options = {})
      @request.put(['event', event_id.to_s], { title: title, content: content }.merge(options))
    end

    # @param bookmark_id [Intger] bookmark to delete
    # @return [Teamlab::Response] result of delete
    def delete_event(bookmark_id)
      @request.delete(['event', bookmark_id.to_s])
    end
  end
end
