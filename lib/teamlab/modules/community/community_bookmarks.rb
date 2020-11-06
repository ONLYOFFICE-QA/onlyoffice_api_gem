# frozen_string_literal: true

module Teamlab
  # Methods for working with community bookmarks
  module CommunityBookmarks
    def get_all_bookmarks
      @request.get(%w[bookmark])
    end

    def get_all_bookmark_tags
      @request.get(%w[bookmark tag])
    end

    def get_bookmark(id)
      @request.get(['bookmark', id.to_s])
    end

    def get_bookmarks_added_by_me
      @request.get(%w[bookmark @self])
    end

    def get_my_favourite_bookmarks
      @request.get(%w[bookmark @favs])
    end

    %w[day week month year].each do |e|
      define_method("get_top_of_#{e}_bookmarks") { @request.get(['bookmark', 'top', e.to_s]) }
    end

    def get_bookmarks_by_tag(tag)
      @request.get(['bookmark', "bytag?tag=#{tag.to_s.gsub(' ', '%20')}"])
    end

    def get_recently_added_bookmarks
      @request.get(%w[bookmark top recent])
    end

    def get_bookmark_comments(bookmark_id)
      @request.get(['bookmark', bookmark_id.to_s, 'comment'])
    end

    def search_bookmarks(queue)
      @request.get(['bookmark', '@search', queue.to_s])
    end

    def add_bookmark(url, title, options = {})
      @request.post(%w[bookmark], { url: url, title: title }.merge(options))
    end

    def add_comment_to_bookmark(bookmark_id, content, options = {})
      @request.post(['bookmark', bookmark_id.to_s, 'comment'], { content: content }.merge(options))
    end

    # @param bookmark_id [Intger] bookmark to delete
    # @return [Teamlab::Response] result of delete
    def delete_bookmark(bookmark_id)
      @request.delete(['bookmark', bookmark_id.to_s])
    end
  end
end
