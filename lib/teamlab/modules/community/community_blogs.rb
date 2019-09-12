# frozen_string_literal: true

module Teamlab
  # Methods for working with community blogs
  module CommunityBlogs
    def get_all_posts
      @request.get(%w[blog])
    end

    def get_blog_tags
      @request.get(%w[blog tag])
    end

    def get_my_posts
      @request.get(%w[blog @self])
    end

    def get_post(post_id)
      @request.get(['blog', post_id.to_s])
    end

    def get_posts_by_tag(tag)
      @request.get(['blog', 'tag', tag.to_s])
    end

    def search_posts(query)
      @request.get(['blog', '@search', query.to_s])
    end

    def get_user_posts(username)
      @request.get(['blog', 'user', username.to_s])
    end

    def get_comments(post_id)
      @request.get(['blog', post_id.to_s, 'comment'])
    end

    def create_post(title, content, options = {})
      @request.post(%w[blog], { title: title, content: content }.merge(options))
    end

    def add_comment(post_id, content, options = {})
      @request.post(['blog', post_id.to_s, 'comment'], { content: content }.merge(options))
    end

    def update_post(post_id, title, content, options = {})
      @request.put(['blog', post_id.to_s], { title: title, content: content }.merge(options))
    end

    def delete_post(post_id)
      @request.delete(['blog', post_id.to_s])
    end
  end
end
