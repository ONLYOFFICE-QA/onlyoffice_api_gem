# frozen_string_literal: true

require_relative 'community/community_blogs'
require_relative 'community/community_bookmarks'
require_relative 'community/community_events'
require_relative 'community/community_forums'
require_relative 'community/community_wiki'
module Teamlab
  class Community
    include CommunityBlogs
    include CommunityBookmarks
    include CommunityEvents
    include CommunityForums
    include CommunityWiki

    def initialize(config)
      @request = Teamlab::Request.new(config, 'community')
    end
  end
end
