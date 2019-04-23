require_relative 'community/community_blogs'
require_relative 'community/community_bookmarks'
require_relative 'community/community_events'
require_relative 'community/community_forums'
module Teamlab
  class Community
    include CommunityBlogs
    include CommunityBookmarks
    include CommunityEvents
    include CommunityForums

    def initialize
      @request = Teamlab::Request.new('community')
    end

    def get_wiki_pages
      @request.get(%w[wiki])
    end

    def get_wiki_page(name, options = {})
      @request.get(['wiki', name], options)
    end

    def get_wiki_file_info(name)
      @request.get(['wiki', 'file', name.to_s])
    end

    def get_page_history(name)
      @request.get(['wiki', name.to_s, 'story'])
    end

    def get_all_page_comments(page_name)
      @request.get(['wiki', page_name.to_s, 'comment'])
    end

    def search_wiki_pages_by_name(name)
      @request.get(['wiki', 'search', 'byname', name.to_s])
    end

    def search_wiki_pages_by_content(content)
      @request.get(['wiki', 'search', 'bycontent', content.to_s])
    end

    def create_page(name, body)
      @request.post(%w[wiki], name: name.to_s, body: body.to_s)
    end

    def upload_files(file)
      @request.post(%w[wiki file], somefile: File.new(file))
    end

    def create_wiki_page_comment(page_name, content, options = {})
      @request.post(['wiki', page_name.to_s, 'comment'], { content: content.to_s }.merge(options))
    end

    def update_wiki_page(name, body)
      @request.put(['wiki', name.to_s], body: body.to_s)
    end

    def update_wiki_page_comment(comment_id, body)
      @request.put(['wiki', 'comment', comment_id.to_s], content: body)
    end

    def delete_wiki_page(name)
      @request.delete(['wiki', name.to_s])
    end

    def delete_wiki_file(name)
      @request.delete(['wiki', 'file', name.to_s])
    end

    def delete_wiki_page_comment(id)
      @request.delete(['wiki', 'comment', id.to_s])
    end
  end
end
